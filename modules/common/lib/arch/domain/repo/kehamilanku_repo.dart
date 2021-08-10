

import 'dart:io';

import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/local/source/check_up_local_source.dart';
import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_warning_api_model.dart';
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:core/util/annotation/data_annotation.dart';

import '../dummy_data.dart';

mixin PregnancyRepo {
  // ====== Home ==========
  Future<Result<List<MotherHomeBabyData>>> getMotherHomeData(int pregnancyId);
  Future<Result<List<MotherTrimester>>> getMotherTrimester(int pregnancyId);
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(int pregnancyId, int pregnancyWeekAge);
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(int pregnancyId);

  // ====== Check ==========
  Future<Result<int>> getPregnancyCheckId(int pregnancyId, int week);
  Future<Result<bool>> savePregnancyCheckId(PregnancyCheckUpId checkUpId);
  Future<Result<PregnancyCheck>> getPregnancyCheck(PregnancyCheckUpWeek checkUpWeek);
  /// Returns the check up id.
  Future<Result<int>> savePregnancyCheck(int pregnancyId, PregnancyCheck data, int trimesterId);
  /// Returns the final storage of [imgFile]. If null, it means [imgFile] is not
  /// stored in persistent storage.
  Future<Result<File?>> saveUsgImg({
    required int pregnancyId,
    required ImgData imgFile,
    required int checkUpId,
  });
  /// Returns null if there's no available [PregnancyBabySize] for [pregnancyWeekAge].
  Future<Result<PregnancyBabySize?>> getPregnancyBabySize(PregnancyCheckUpWeek checkUpWeek);
  Future<Result<List<FormWarningStatus>>> getMotherWarningStatus(PregnancyCheckUpWeek checkUpWeek);

  // ====== Chart ==========
  Future<Result<List<MotherChartMenuData>>> getMotherPregnancyEvalGraphMenu();
  Future<Result<List<MotherChartMenuData>>> getMotherWeightGraphMenu();
}


class PregnancyRepoImpl with PregnancyRepo {
  final KehamilankuApi _api;
  //final AccountLocalSrc _accountLocalSrc;
  final CheckUpLocalSrc _checkUpLocalSrc;

  PregnancyRepoImpl({
    required KehamilankuApi api,
    //required AccountLocalSrc accountLocalSrc,
    required CheckUpLocalSrc checkUpLocalSrc,
  }):
    _api = api,
    //_accountLocalSrc = accountLocalSrc,
    _checkUpLocalSrc = checkUpLocalSrc
  ;

  // ====== Home ==========
  /// We only use 1 home data because in endpoint only serve for one.
  List<MotherHomeBabyData>? _homeDataList;
  int? _currentPregnancyId;

  @override
  Future<Result<List<MotherHomeBabyData>>> getMotherHomeData(@notUsedYet int pregnancyId) async {
    try {
      final res = await _api.getHomeData();
      final rawHomeData = res.data;
      _homeDataList = rawHomeData.map((e) => MotherHomeBabyData.fromResponse(e)).toList(growable: false);
      _currentPregnancyId = pregnancyId;
      return Success(_homeDataList!);
    } catch(e, stack) {
      final msg = "Error calling `getMotherHomeData()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<List<MotherTrimester>>> getMotherTrimester(int pregnancyId) async {
    if(_homeDataList == null || pregnancyId != _currentPregnancyId) {
      //@mayChangeInFuture
      //final motherNik = VarDi.motherNik.getOrElse();
      final res = await getMotherHomeData(pregnancyId);
      if(res is Fail<List<MotherHomeBabyData>>) {
        return res.copy();
      }
    }
    return Success(_homeDataList!.first.trimesterList); //For now, we only use the first one.
  }
  @override
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(int pregnancyId, int pregnancyWeekAge) async {
    if(_homeDataList == null || pregnancyId != _currentPregnancyId) {
      //@mayChangeInFuture
      //final motherNik = VarDi.motherNik.getOrElse();
      final res = await getMotherHomeData(pregnancyId);
      if(res is Fail<List<MotherHomeBabyData>>) {
        return res.copy();
      }
    }
    return Success(_homeDataList!.first.foodRecomList); //For now, we only use the first one.
  }
  @override
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(int pregnancyId) async {
    if(_homeDataList == null || pregnancyId != _currentPregnancyId) {
      //@mayChangeInFuture
      //final motherNik = VarDi.motherNik.getOrElse();
      final res = await getMotherHomeData(pregnancyId);
      if(res is Fail<List<MotherHomeBabyData>>) {
        return res.copy();
      }
    }
    VarDi.pregnancyWeek.value = _homeDataList!.first.pregnancyAge.weekAge; //For now, we only use the first one.
    return Success(_homeDataList!.first.pregnancyAge);
  }

  PregnancyCheckBody? _checkBody;
  PregnancyCheckFormWarningDataResponse? _checkUpAnalysis;
  PregnancyCheckUpWeek? _currentCheckUpWeek;

  // ====== Check ==========
  @override
  Future<Result<int>> getPregnancyCheckId(int pregnancyId, int week) => _checkUpLocalSrc.getCheckUpId(
    period: week,
    refId: pregnancyId,
    type: DbConst.TYPE_PREGNANCY_CHECK,
  );
  @override
  Future<Result<bool>> savePregnancyCheckId(PregnancyCheckUpId checkUpId) => _checkUpLocalSrc.saveCheckUpId(
    id: checkUpId.id,
    period: checkUpId.week,
    refId: checkUpId.pregnancyId,
    type: DbConst.TYPE_PREGNANCY_CHECK,
  );
  @override
  Future<Result<PregnancyCheck>> getPregnancyCheck(PregnancyCheckUpWeek checkUpWeek) async {
    try {
      //final checkId = checkUpId.id;
      final body = PregnancyShowCheckBody(
        trisemester_id: checkUpWeek.trimesterId,
        week: checkUpWeek.week,
      );
      _checkBody = await _api.getPregnancyCheckForm(body);
      final checkUpId = PregnancyCheckUpId(
        pregnancyId: checkUpWeek.pregnancyId, week: checkUpWeek.week, id: _checkBody!.id!,
      );
      final locRes = await savePregnancyCheckId(checkUpId);
      if(locRes is! Success<bool>) {
        final errMsg = (locRes as Fail<bool>).error?.toString();
        //prind("getPregnancyCheck() errMsg?.contains('2067') = ${errMsg?.contains("2067")}");
        if(!(errMsg?.contains("2067") == true || errMsg?.contains("UNIQUE") == true)) {
          final msg = "Can't save pregnancy check up id to local, locRes = $locRes";
          prine(msg);
          return Fail(msg: msg);
        }
      }
      _currentCheckUpWeek = checkUpWeek;
      return Success(PregnancyCheck.fromResponse(_checkBody!));
    } catch(e, stack) {
      final msg = "`getPregnancyCheck()` error";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<int>> savePregnancyCheck(
      int pregnancyId, PregnancyCheck data, int trimesterId,
  ) async {
    final body = PregnancyCheckBody.fromModel(model: data, trimesterId: trimesterId);
    try {
      final res = await _api.sendPregnancyCheckForm(body);
      final res2 = await savePregnancyCheckId(PregnancyCheckUpId.fromResponse(
        pregnancyId: pregnancyId,
        week: data.pregnancyAge,
        response: res.checkupId,
      ));
      prind("savePregnancyCheck() pregnancyId= $pregnancyId res2 = $res2 data.pregnancyAge = ${data.pregnancyAge} res.checkupId = ${res.checkupId}");
      if(res2 is! Success<bool>) {
        return (res2 as Fail<bool>).copy();
      }
      return Success(res.checkupId.id);
    } catch(e, stack) {
      final msg = "`savePregnancyCheck()` error";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<File?>> saveUsgImg({
    required int pregnancyId,
    required ImgData imgFile,
    required int checkUpId,
  }) async {
    if(imgFile.src != ImgSrc.file) {
      throw "Can't send image with source besides `ImgSrc.file`";
    }
    try {
      final file = File(imgFile.link);
      final res = await _api.sendPregnancyCheckUsg(checkUpId, file);
      if(res.code != 200) {
        return Fail(msg: "Can't upload USG img", code: res.code);
      }
      return Success(null);
    } catch(e, stack) {
      final msg = "Error calling `saveUsgImg()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
  /// Returns null if there's no available [PregnancyBabySize] for [pregnancyWeekAge].
  @override
  Future<Result<PregnancyBabySize?>> getPregnancyBabySize(PregnancyCheckUpWeek checkUpWeek) async {
    if(checkUpWeek != _currentCheckUpWeek) {
      try {
        final res = await getPregnancyCheck(checkUpWeek);
        if(res is! Success<PregnancyCheck>) {
          final msg = "Can't get pregnancy check up data with `checkUpWeek` of '$checkUpWeek', res= $res";
          return Fail(msg: msg);
        }
        //final checkId = checkUpId.id;
        final body = PregnancyShowAnalysisBody(
          weekly_trisemester_checkup_id: res.data.id!,
        );
        _checkUpAnalysis = (await _api.getPregnancyCheckWarning(body)).data;
        //_checkBody = await _api.getPregnancyCheckWarning(body);
      } catch(e, stack) {
        prine(e);
        prine(stack);
        return Fail(msg: "Error calling `getPregnancyBabySize()`", error: e);
      }
    }
    if(_checkUpAnalysis!.fetusGrowth.desc == null) {
      return Success(null);
    }
    return Success(PregnancyBabySize.fromResponse(_checkUpAnalysis!.fetusGrowth));
  }
  @override
  Future<Result<List<FormWarningStatus>>> getMotherWarningStatus(PregnancyCheckUpWeek checkUpWeek) async {
    if(checkUpWeek != _currentCheckUpWeek) {
      try {
        final res = await getPregnancyCheck(checkUpWeek);
        if(res is! Success<PregnancyCheck>) {
          final msg = "Can't get pregnancy check up data with `checkUpWeek` of '$checkUpWeek', res= $res";
          return Fail(msg: msg);
        }
        //final checkId = checkUpId.id;
        final body = PregnancyShowAnalysisBody(
          weekly_trisemester_checkup_id: res.data.id!,
        );
        _checkUpAnalysis = (await _api.getPregnancyCheckWarning(body)).data;
        //_checkBody = await _api.getPregnancyCheckWarning(body);
      } catch(e, stack) {
        final msg = "`getMotherWarningStatus()` error";
        prine("$msg; e= $e");
        prine(stack);
        return Fail(msg: msg, error: e);
      }
      _currentCheckUpWeek = checkUpWeek;
    }
    return Success(responseToMotherFormWarning(_checkUpAnalysis!));
  }

  // ====== Chart ==========
  @override @notDummy
  Future<Result<List<MotherChartMenuData>>> getMotherPregnancyEvalGraphMenu() async => Success(motherPregEvalGraphMenuList);
  @override @notDummy
  Future<Result<List<MotherChartMenuData>>> getMotherWeightGraphMenu() async => Success(motherWeightGraphMenuList);
}


class PregnancyRepoDummy with PregnancyRepo {
  PregnancyRepoDummy._();
  static final obj = PregnancyRepoDummy._();

  @override
  Future<Result<List<MotherHomeBabyData>>> getMotherHomeData(int pregnancyId) async => Success(motherHomeData);
  @override
  Future<Result<List<MotherTrimester>>> getMotherTrimester(int pregnancyId) async => Success(dummyTrimesterList);
  @override
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(int pregnancyId, int pregnancyWeekAge) async => Success(dummyFoodRecomList(pregnancyWeekAge));
  @override
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(int pregnancyId) async => Success(dummyPregnancyAgeOverview);

  @override
  Future<Result<PregnancyCheck>> getPregnancyCheck(PregnancyCheckUpWeek checkUpWeek) async => Fail(); //Success(dummyPregnancyCheck(checkUpWeek.week));
  @override
  Future<Result<int>> savePregnancyCheck(int pregnancyId, PregnancyCheck data, int trimester) async => Success(1);
  @override
  Future<Result<File?>> saveUsgImg({
    required int pregnancyId,
    required ImgData imgFile,
    required int checkUpId,
  }) async => Success(null);
  @override
  Future<Result<PregnancyBabySize?>> getPregnancyBabySize(PregnancyCheckUpWeek checkUpWeek) async => Success(dummyPregnancyBabySize(checkUpWeek.week));
  @override
  Future<Result<List<FormWarningStatus>>> getMotherWarningStatus(PregnancyCheckUpWeek checkUpWeek) async => Success(motherWarningStatusList);
  @override
  Future<Result<int>> getPregnancyCheckId(int pregnancyId, int week) async => Success(1);
  @override
  Future<Result<bool>> savePregnancyCheckId(PregnancyCheckUpId checkUpId) async => Success(true);

  @override
  Future<Result<List<MotherChartMenuData>>> getMotherPregnancyEvalGraphMenu() async => Success(motherPregEvalGraphMenuList);
  @override
  Future<Result<List<MotherChartMenuData>>> getMotherWeightGraphMenu() async => Success(motherWeightGraphMenuList);
}


/*
mixin MotherFoodRecomRepo {
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(int pregnancyWeekAge);
}

class MotherFoodRecomRepoDummy with MotherFoodRecomRepo {
  MotherFoodRecomRepoDummy._();
  static final obj = MotherFoodRecomRepoDummy._();

  @override
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(int pregnancyWeekAge) async => Success(dummyFoodRecomList(pregnancyWeekAge));
}
 */
