

import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_warning_api_model.dart';
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/util/data_mapper.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/annotation/data_annotation.dart';

import '../dummy_data.dart';

mixin PregnancyRepo {
  // ====== Home ==========
  Future<Result<List<MotherHomeBabyData>>> getMotherHomeData(String motherNik);
  Future<Result<List<MotherTrimester>>> getMotherTrimester();
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(String motherNik, int pregnancyWeekAge);
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(String motherNik);

  // ====== Check ==========
  Future<Result<int>> getPregnancyCheckId(String motherNik, int week);
  Future<Result<bool>> savePregnancyCheckId(PregnancyCheckUpId checkUpId);
  Future<Result<PregnancyCheck>> getPregnancyCheck(PregnancyCheckUpId checkUpId);
  Future<Result<bool>> savePregnancyCheck(String motherNik, PregnancyCheck data, int trimesterId);
  /// Returns null if there's no available [PregnancyBabySize] for [pregnancyWeekAge].
  Future<Result<PregnancyBabySize?>> getPregnancyBabySize(PregnancyCheckUpId checkUpId);
  Future<Result<List<FormWarningStatus>>> getMotherWarningStatus(PregnancyCheckUpId checkUpId);

  // ====== Chart ==========
  Future<Result<List<MotherChartMenuData>>> getMotherPregnancyEvalGraphMenu();
  Future<Result<List<MotherChartMenuData>>> getMotherWeightGraphMenu();
}


class PregnancyRepoImpl with PregnancyRepo {
  final KehamilankuApi _api;
  PregnancyRepoImpl(this._api);

  // ====== Home ==========
  /// We only use 1 home data because in endpoint only serve for one.
  MotherHomeBabyData? _homeData;

  @override
  Future<Result<List<MotherHomeBabyData>>> getMotherHomeData(@notUsedYet String motherNik) async {
    try {
      final res = await _api.getHomeData();
      final rawHomeData = res.data.first;
      _homeData = MotherHomeBabyData.fromResponse(rawHomeData);
      return Success([_homeData!]);
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<List<MotherTrimester>>> getMotherTrimester() async {
    if(_homeData == null) {
      @mayChangeInFuture
      final motherNik = "";
      final res = await getMotherHomeData(motherNik);
      if(res is Fail<List<MotherHomeBabyData>>) {
        return Fail();
      }
    }
    return Success(_homeData!.trimesterList);
  }
  @override
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(String motherNik, int pregnancyWeekAge) async {
    final res = await getMotherHomeData(motherNik);
    if(res is Fail<List<MotherHomeBabyData>>) {
      return Fail();
    }
    return Success(_homeData!.foodRecomList);
  }
  @override
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(String motherNik) async {
    final res = await getMotherHomeData(motherNik);
    if(res is Fail<List<MotherHomeBabyData>>) {
      return Fail();
    }
    VarDi.pregnancyWeek.value = _homeData!.pregnancyAge.weekAge;
    return Success(_homeData!.pregnancyAge);
  }

  PregnancyCheckBody? _checkBody;
  PregnancyCheckFormWarningDataResponse? _checkUpAnalysis;
  PregnancyCheckUpId? _currentCheckUpId;

  // ====== Check ==========
  @override //TODO: dummy in impl
  Future<Result<int>> getPregnancyCheckId(String motherNik, int week) async => Success(1);
  @override //TODO: dummy in impl
  Future<Result<bool>> savePregnancyCheckId(PregnancyCheckUpId checkUpId) async => Success(true);
  @override
  Future<Result<PregnancyCheck>> getPregnancyCheck(PregnancyCheckUpId checkUpId) async {
    try {
      final checkId = checkUpId.id;
      final body = PregnancyShowCheckBody(checkId: checkId);
      _checkBody = await _api.getPregnancyCheckForm(body);
      return Success(PregnancyCheck.fromResponse(_checkBody!));
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<bool>> savePregnancyCheck(
    String motherNik, PregnancyCheck data, int trimesterId,
  ) async {
    final body = PregnancyCheckBody.fromModel(model: data, trimesterId: trimesterId);
    try {
      final res = await _api.sendPregnancyCheckForm(body);
      final res2 = await savePregnancyCheckId(PregnancyCheckUpId.fromResponse(
        motherNik: motherNik,
        week: data.pregnancyAge,
        response: res.checkupId,
      ));
      if(res2 is! Success<bool>) {
        return Fail();
      }
      return res2;
    } catch(e) {
      return Fail();
    }
  }
  /// Returns null if there's no available [PregnancyBabySize] for [pregnancyWeekAge].
  @override
  Future<Result<PregnancyBabySize?>> getPregnancyBabySize(PregnancyCheckUpId checkUpId) async {
    if(checkUpId != _currentCheckUpId) {
      try {
        final checkId = checkUpId.id;
        final body = PregnancyShowCheckBody(checkId: checkId);
        _checkUpAnalysis = (await _api.getPregnancyCheckWarning(body)).data;
        //_checkBody = await _api.getPregnancyCheckWarning(body);
      } catch(e) {
        return Fail();
      }
      _currentCheckUpId = checkUpId;
    }
    if(_checkUpAnalysis!.fetusGrowth.desc == null) {
      return Success(null);
    }
    return Success(PregnancyBabySize.fromResponse(_checkUpAnalysis!.fetusGrowth));
  }
  @override
  Future<Result<List<FormWarningStatus>>> getMotherWarningStatus(PregnancyCheckUpId checkUpId) async {
    if(checkUpId != _currentCheckUpId) {
      try {
        final checkId = checkUpId.id;
        final body = PregnancyShowCheckBody(checkId: checkId);
        _checkUpAnalysis = (await _api.getPregnancyCheckWarning(body)).data;
        //_checkBody = await _api.getPregnancyCheckWarning(body);
      } catch(e) {
        return Fail();
      }
      _currentCheckUpId = checkUpId;
    }
    return Success(responseToMotherFormWarning(_checkUpAnalysis!));
  }

  // ====== Chart ==========
  @override @notDummy
  Future<Result<List<MotherChartMenuData>>> getMotherPregnancyEvalGraphMenu() async => Success(motherPregEvalGraphMenuList);
  @override @notDummy
  Future<Result<List<MotherChartMenuData>>> getMotherWeightGraphMenu() async => Success(motherWeightGraphMenuList);
}


class MotherPregnancyRepoDummy with PregnancyRepo {
  MotherPregnancyRepoDummy._();
  static final obj = MotherPregnancyRepoDummy._();

  @override
  Future<Result<List<MotherHomeBabyData>>> getMotherHomeData(String motherNik) async => Success(motherHomeData);
  @override
  Future<Result<List<MotherTrimester>>> getMotherTrimester() async => Success(dummyTrimesterList);
  @override
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(String motherNik, int pregnancyWeekAge) async => Success(dummyFoodRecomList(pregnancyWeekAge));
  @override
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(String motherNik) async => Success(dummyPregnancyAgeOverview);

  @override
  Future<Result<PregnancyCheck>> getPregnancyCheck(PregnancyCheckUpId checkUpId) async => Success(dummyPregnancyCheck(checkUpId.week));
  @override
  Future<Result<bool>> savePregnancyCheck(String motherNik, PregnancyCheck data, int trimester) async => Success(true);
  @override
  Future<Result<PregnancyBabySize?>> getPregnancyBabySize(PregnancyCheckUpId checkUpId) async => Success(dummyPregnancyBabySize(checkUpId.week));
  @override
  Future<Result<List<FormWarningStatus>>> getMotherWarningStatus(PregnancyCheckUpId checkUpId) async => Success(motherWarningStatusList);
  @override
  Future<Result<int>> getPregnancyCheckId(String motherNik, int week) async => Success(1);
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
