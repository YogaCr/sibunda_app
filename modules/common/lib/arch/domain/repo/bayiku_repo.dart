import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/local/source/check_up_local_source.dart';
import 'package:common/arch/data/local/source/pregnancy_local_source.dart';
import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/data/remote/model/baby_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/baby_neonatal_form_api_model.dart';
import 'package:common/arch/data/remote/model/baby_overview_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

mixin MyBabyRepo {
  Future<Result<Map<int, String>>> getBabyNik();
  Future<Result<List<BabyOverlayData>>> getBornBabyOverlayData(String motherNik);
  Future<Result<List<BabyOverlayData>>> getUnbornBabyOverlayData(String motherNik);
  //Future<Result<List<Profile>>> getBabyProfiles();
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyGrowthWarningStatus({
    required int yearId,
    required int month,
  });
  Future<Result<List<FormWarningStatus>>> getBabyDevWarningStatus({
    required int yearId,
    required int month,
  });
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu();
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu(int babyId);
  Future<Result<List<BabyChartMenuData>>> getBabyGrowthGraphMenu();
  Future<Result<List<BabyChartMenuData>>> getBabyDevGraphMenu();
  Future<Result<bool>> saveBabyMonthlyCheck(BabyMonthlyFormBody body);
  Future<Result<BabyMonthlyFormBody>> getBabyMonthlyCheck({
    required int yearId,
    required int month,
  });
  Future<Result<bool>> saveBabyCheckUpId({
    required int babyId,
    required int month,
    required int id,
  });
  Future<Result<int>> getBabyCheckUpId({
    required int babyId,
    required int month,
  });
  //Future<Result<Map<String, dynamic>>> getBabyMonthlyCheck(BabyMonthlyFormBody body);
  Future<Result<bool>> saveNeonatalServiceForm({
    required int page,
    required Map<String, dynamic> formData,
  });

  Future<Result<AllNeonatalForm>> getNeonatalServiceAnswer({
    required int yearId,
    required int month,
  });
  Future<Result<Neonatal6HourForm?>> getNeonatal6HourAnswer({
    required int yearId,
    required int month,
  });
  Future<Result<NeonatalKn1Form?>> getNeonatalKn1Answer({
    required int yearId,
    required int month,
  });
  Future<Result<NeonatalKn2Form?>> getNeonatalKn2Answer({
    required int yearId,
    required int month,
  });
  Future<Result<NeonatalKn3Form?>> getNeonatalKn3Answer({
    required int yearId,
    required int month,
  });
}


class MyBabyRepoImpl with MyBabyRepo {
  final BabyApi _api;
  final AccountLocalSrc _accountLocalSrc;
  final CheckUpLocalSrc _checkUpLocalSrc;
  final PregnancyLocalSrc _pregnancyLocalSrc;

  MyBabyRepoImpl({
    required BabyApi api,
    required AccountLocalSrc accountLocalSrc,
    required CheckUpLocalSrc checkUpLocalSrc,
    required PregnancyLocalSrc pregnancyLocalSrc,
  }):
    _api = api,
    _accountLocalSrc = accountLocalSrc,
    _checkUpLocalSrc = checkUpLocalSrc,
    _pregnancyLocalSrc = pregnancyLocalSrc
  ;

  @override
  Future<Result<Map<int, String>>> getBabyNik() async {
    try {
      final res = await _accountLocalSrc.getCurrentEmail();
      prind("MyBabyRepoImpl.getBabyNik() res = $res");
      if(res is Success<String>) {
        final email = res.data;
        prind("MyBabyRepoImpl.getBabyNik() email = $email");
        final res2 = await _accountLocalSrc.getChildrenNik(email);
        prind("MyBabyRepoImpl.getBabyNik() res2 = $res2");
        return res2;
      } else {
        return (res as Fail<String>).copy();
      }
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getBabyNik()`", error: e);
    }
  }

  @override
  Future<Result<List<BabyOverlayData>>> getBornBabyOverlayData(String motherNik) async {
    final rawProfs = await _accountLocalSrc.getChildrenProfilesByMotherNik(motherNik);
    if(rawProfs is Success<List<Profile>>) {
      final data = rawProfs.data;
      final list = data.map((e) => BabyOverlayData.fromProfile(e)).toList(growable: false);
      return Success(list);
    } else {
      return (rawProfs as Fail<List<Profile>>).copy();
    }
  }
  @override
  Future<Result<List<BabyOverlayData>>> getUnbornBabyOverlayData(String motherNik) async {
    final pregRes = await _pregnancyLocalSrc.getPregnancyOfUser(motherNik);
    if(pregRes is Success<List<PregnancyEntity>>) {
      final pregs = pregRes.data;
      final nowBornProfiles = <ProfileEntity>[];
      for(final preg in pregs) {
        final prof = await _accountLocalSrc.getProfileByPregnancy(preg);
        if(prof is Success<ProfileEntity>) {
          nowBornProfiles.add(prof.data);
        }
      }
      final emailRes = await _accountLocalSrc.getCurrentEmail();

      //prind("MeyBabyRepo.getUnbornBabyOverlayData() nowBornProfilesRes= $nowBornProfilesRes emailRes= $emailRes");
      if(emailRes is Success<String>) {
        final email = emailRes.data;
        //final nowBornProfiles = nowBornProfilesRes.data;
        final babyOverlays = pregs.map<BabyOverlayData>((preg) {
          final eProf = nowBornProfiles.firstWhereOrNull((profIt) {
            prind("MeyBabyRepo.getUnbornBabyOverlayData() nowBornProfiles.firstWhereOrNull profIt.serverId= ${profIt.serverId} profIt.pregnancyId= ${profIt.pregnancyId} pregs.id= ${preg.id}");
            return profIt.serverId == preg.id || profIt.pregnancyId == preg.id;
          });
          final prof = eProf != null ? Profile.fromEntity(entity: eProf, email: email) : null;
          return BabyOverlayData.fromPregnancyEntity(
            entity: preg,
            profile: prof,
          );
        }).toList(growable: false);

        return Success(babyOverlays);
      } else {
        return Fail(msg: "Can't get profiles or email with `motherNik` of '$motherNik' in `getUnbornBabyOverlayData()`");
      }
    } else {
      return Fail(msg: "Can't get mother hpl with `motherNik` of '$motherNik' in `getUnbornBabyOverlayData()`");
    }
  } //async => Success(dummyBabyOverlayDataList_pregnancy);

  BabyHomeResponse? _homeResponse;
  int _currentMonth = -1;
  int _currentYearId = -1;
  String? _currentBabyNik;
  BabyFormWarningResponse? _formWarningResponse;
  NeonatalResponse? _neonatalResponse;

  @override
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik) async //=> Success(dummyBabyAgeOverview);
///*
  {
    final idRes = await _accountLocalSrc.getChildId(babyNik);
    if(idRes is Success<int>) {
      final id = idRes.data;
      final homeResponse = babyNik != _currentBabyNik || _homeResponse == null
          ? _homeResponse = await _api.getHomeData()
          : _homeResponse!;
      final child = homeResponse.data.firstWhereOrNull((e) => e.id == id);
      if(child == null) {
        final msg = "Can't find `child` with `id` '$id' with `babyNik` '$babyNik'";
        prine(msg);
        return Fail(msg: msg);
      }
      final res = BabyAgeOverview.fromResponse(child);
      return Success(res);
    }
    return (idRes as Fail<int>).copy();
  }
// */
  @override
  Future<Result<List<FormWarningStatus>>> getBabyGrowthWarningStatus({
    required int yearId,
    required int month,
  }) async {
    try {
      if(month != _currentMonth) {
        final body = BabyFormWarningBody(month: month, yearId: yearId);
        _formWarningResponse = await _api.getFormWarning(body);
        _currentMonth = month;
        _currentYearId = yearId;
      }
      final data = _formWarningResponse!.data;
      final list = responseToBabyFormGrowthWarning(data);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getBabyWarningStatus()`", error: e);
    }
  }
  @override
  Future<Result<List<FormWarningStatus>>> getBabyDevWarningStatus({
    required int yearId,
    required int month,
  }) async {
    try {
      if(month != _currentMonth) {
        final body = BabyFormWarningBody(month: month, yearId: yearId);
        _formWarningResponse = await _api.getFormWarning(body);
        _currentMonth = month;
        _currentYearId = yearId;
      }
      final data = _formWarningResponse!.data;
      final list = responseToBabyFormDevWarning(data);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getBabyDevWarningStatus()`", error: e);
    }
  }

  @override
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu() async => Success(babyHomeGraph_ui);

  @override
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu(int babyId) async {
    try {
      final data = _homeResponse = await _api.getHomeData();
      final rawYears = data.data.firstWhereOrNull((e) => e.id == babyId)?.years;
      if(rawYears == null) {
        return Fail(msg: "Can't get `rawYears` with `babyId` of '$babyId'");
      }
      final years = rawYears.map((e) => BabyFormMenuData.fromResponse(e)).toList(growable: false);
      return Success(years);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getBabyFormMenu()`", error: e);
    }
  }

  @override
  Future<Result<List<BabyChartMenuData>>> getBabyGrowthGraphMenu() async => Success(babyGrowthGraphMenuList);

  @override
  Future<Result<List<BabyChartMenuData>>> getBabyDevGraphMenu() async => Success(babyDevGraphMenuList);

  @override
  Future<Result<bool>> saveBabyMonthlyCheck(BabyMonthlyFormBody body) async { //TODO: blum ada checkup id ne.
    try {
      final res = await _api.sendMonthlyForm(body);
      prind("saveBabyMonthlyCheck() res = $res");
      if(res.code != 200) {
        return Fail();
      }
      return Success(true);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `saveBabyMonthlyCheck()`", error: e,);
    }
  }

  @override
  Future<Result<BabyMonthlyFormBody>> getBabyMonthlyCheck({
    required int yearId,
    required int month,
  }) async {
    try {
      final body = BabyGetMonthlyFormBody(yearId: yearId, month: month);
      final res = await _api.getMonthlyForm(body);
      return Success(res);
    } catch(e) {
      return Fail(error: e);
    }
  }

  @override
  Future<Result<bool>> saveBabyCheckUpId({
    required int babyId,
    required int month,
    required int id,
  }) => _checkUpLocalSrc.saveCheckUpId(id: id, period: month, refId: babyId, type: DbConst.TYPE_BABY_CHECK,);

  @override
  Future<Result<int>> getBabyCheckUpId({
    required int babyId,
    required int month,
  }) => _checkUpLocalSrc.getCheckUpId(period: month, refId: babyId);

  @override
  Future<Result<bool>> saveNeonatalServiceForm({
    required int page,
    required Map<String, dynamic> formData,
  }) async {
    try {
      switch(page) {
        case 0: //For 6 hours
          final body = Neonatal6HourFormBody.fromJson(formData);
          await _api.sendNeo6hForm(body);
          break;
        case 1: //For KN1
          final body = NeonatalKn1FormBody.fromJson(formData);
          await _api.sendKn1Form(body);
          break;
        case 2: //For KN2
          final body = NeonatalKn2FormBody.fromJson(formData);
          await _api.sendKn2Form(body);
          break;
        case 3: //For KN3
          final body = NeonatalKn3FormBody.fromJson(formData);
          await _api.sendKn3Form(body);
          break;
        default:
          throw "No such page '$page' in neonatal service page";
      }
      return Success(true);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `saveNeonatalServiceForm()`", error: e,);
    }
  }

  @override
  Future<Result<AllNeonatalForm>> getNeonatalServiceAnswer({
    required int yearId,
    required int month,
  }) async {
    try {
      if(_neonatalResponse == null || yearId != _currentYearId || month != _currentMonth) {
        final body = BabyGetMonthlyFormBody(yearId: yearId, month: month);
        _neonatalResponse = await _api.getNeonatalAnswer(body);
        _currentYearId = yearId;
        _currentMonth = month;
      }
      return Success(AllNeonatalForm.fromResponse(_neonatalResponse!));
    } catch(e, stack) {
      final msg = "Error calling `getNeonatalServiceAnswer()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
  @override
  Future<Result<Neonatal6HourForm?>> getNeonatal6HourAnswer({
    required int yearId,
    required int month,
  }) async {
    try {
      if(_neonatalResponse == null || yearId != _currentYearId || month != _currentMonth) {
        final body = BabyGetMonthlyFormBody(yearId: yearId, month: month);
        _neonatalResponse = await _api.getNeonatalAnswer(body);
        _currentYearId = yearId;
        _currentMonth = month;
      }
      final raw = _neonatalResponse!.data.six_hours;
      return Success(raw == null ? null : Neonatal6HourForm.fromResponse(raw));
    } catch(e, stack) {
      final msg = "Error calling `getNeonatal6HourAnswer()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
  @override
  Future<Result<NeonatalKn1Form?>> getNeonatalKn1Answer({
    required int yearId,
    required int month,
  }) async {
    try {
      if(_neonatalResponse == null || yearId != _currentYearId || month != _currentMonth) {
        final body = BabyGetMonthlyFormBody(yearId: yearId, month: month);
        _neonatalResponse = await _api.getNeonatalAnswer(body);
        _currentYearId = yearId;
        _currentMonth = month;
      }
      final raw = _neonatalResponse!.data.kn_1;
      return Success(raw == null ? null : NeonatalKn1Form.fromResponse(raw));
    } catch(e, stack) {
      final msg = "Error calling `getNeonatalKn1Answer()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
  @override
  Future<Result<NeonatalKn2Form?>> getNeonatalKn2Answer({
    required int yearId,
    required int month,
  }) async {
    try {
      if(_neonatalResponse == null || yearId != _currentYearId || month != _currentMonth) {
        final body = BabyGetMonthlyFormBody(yearId: yearId, month: month);
        _neonatalResponse = await _api.getNeonatalAnswer(body);
        _currentYearId = yearId;
        _currentMonth = month;
      }
      final raw = _neonatalResponse!.data.kn_2;
      return Success(raw == null ? null : NeonatalKn2Form.fromResponse(raw));
    } catch(e, stack) {
      final msg = "Error calling `getNeonatalKn2Answer()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
  @override
  Future<Result<NeonatalKn3Form?>> getNeonatalKn3Answer({
    required int yearId,
    required int month,
  }) async {
    try {
      if(_neonatalResponse == null || yearId != _currentYearId || month != _currentMonth) {
        final body = BabyGetMonthlyFormBody(yearId: yearId, month: month);
        _neonatalResponse = await _api.getNeonatalAnswer(body);
        _currentYearId = yearId;
        _currentMonth = month;
      }
      final raw = _neonatalResponse!.data.kn_3;
      return Success(raw == null ? null : NeonatalKn3Form.fromResponse(raw));
    } catch(e, stack) {
      final msg = "Error calling `getNeonatalKn3Answer()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
}

class MyBabyRepoDummy with MyBabyRepo {
  MyBabyRepoDummy._();
  static final obj = MyBabyRepoDummy._();

  @override
  Future<Result<Map<int, String>>> getBabyNik() async => Success({1:""});
  @override
  Future<Result<List<BabyOverlayData>>> getBornBabyOverlayData(String motherNik) async => Success(dummyBabyOverlayDataList_baby);
  @override
  Future<Result<List<BabyOverlayData>>> getUnbornBabyOverlayData(String motherNik) async => Success(dummyBabyOverlayDataList_pregnancy);
  @override
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik) async => Success(dummyBabyAgeOverview);
  @override
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu() async => Success(babyHomeGraph_ui);
  @override
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu(int babyId) async => Success(babyFormMenuList_ui);
  @override
  Future<Result<List<BabyChartMenuData>>> getBabyGrowthGraphMenu() async => Success(babyGrowthGraphMenuList);
  @override
  Future<Result<List<BabyChartMenuData>>> getBabyDevGraphMenu() async => Success(babyDevGraphMenuList);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyGrowthWarningStatus({
    required int yearId,
    required int month,
  }) async => Success(babyWarningStatusList);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyDevWarningStatus({
    required int yearId,
    required int month,
  }) async => Success(babyWarningStatusList); //TODO: Baby dev form warning: Msh dummy
  @override
  Future<Result<bool>> saveBabyMonthlyCheck(BabyMonthlyFormBody body) async => Success(true);
  @override
  Future<Result<BabyMonthlyFormBody>> getBabyMonthlyCheck({
    required int yearId,
    required int month,
  }) async => Success(babyMonthlyFormBody);
  @override
  Future<Result<bool>> saveNeonatalServiceForm({
    required int page,
    required Map<String, dynamic> formData,
  }) async => Success(true);

  @override
  Future<Result<bool>> saveBabyCheckUpId({
    required int babyId,
    required int month,
    required int id,
  }) async => Success(true);

  @override
  Future<Result<int>> getBabyCheckUpId({
    required int babyId,
    required int month,
  }) async => Success(1);

  @override
  Future<Result<AllNeonatalForm>> getNeonatalServiceAnswer({
    required int yearId,
    required int month,
  }) async => Success(AllNeonatalForm(
    sixHour: null,
    kn1: null,
    kn2: null,
    kn3: null,
  ));
  @override
  Future<Result<Neonatal6HourForm?>> getNeonatal6HourAnswer({
    required int yearId,
    required int month,
  }) async => Success(null);
  @override
  Future<Result<NeonatalKn1Form?>> getNeonatalKn1Answer({
    required int yearId,
    required int month,
  }) async => Success(null);
  @override
  Future<Result<NeonatalKn2Form?>> getNeonatalKn2Answer({
    required int yearId,
    required int month,
  }) async => Success(null);
  @override
  Future<Result<NeonatalKn3Form?>> getNeonatalKn3Answer({
    required int yearId,
    required int month,
  }) async => Success(null);
}



