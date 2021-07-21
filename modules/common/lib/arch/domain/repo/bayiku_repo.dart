import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/local/source/check_up_local_source.dart';
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
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:collection/collection.dart';

mixin MyBabyRepo {
  Future<Result<String>> getBabyNik();
  Future<Result<List<BabyOverlayData>>> getBornBabyOverlayData(String motherNik);
  Future<Result<List<BabyOverlayData>>> getUnbornBabyOverlayData(String motherNik);
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyWarningStatus(String babyNik, int monthId);
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu();
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu();
  Future<Result<List<BabyChartMenuData>>> getBabyGrowthGraphMenu();
  Future<Result<List<BabyChartMenuData>>> getBabyDevGraphMenu();
  Future<Result<bool>> saveBabyMonthlyCheck(BabyMonthlyFormBody body);
  Future<Result<BabyMonthlyFormBody>> getBabyMonthlyCheck({
    required int yearId,
    required int month,
  });
  Future<Result<bool>> saveBabyCheckUpId({
    required String babyNik,
    required int month,
    required int id,
  });
  Future<Result<int>> getBabyCheckUpId({
    required String babyNik,
    required int month,
  });
  //Future<Result<Map<String, dynamic>>> getBabyMonthlyCheck(BabyMonthlyFormBody body);
  Future<Result<bool>> saveNeonatalServiceForm({
    required int page,
    required Map<String, dynamic> formData,
  });
}


class MyBabyRepoImpl with MyBabyRepo {
  final BabyApi _api;
  final AccountLocalSrc _accountLocalSrc;
  final CheckUpLocalSrc _checkUpLocalSrc;

  MyBabyRepoImpl({
    required BabyApi api,
    required AccountLocalSrc accountLocalSrc,
    required CheckUpLocalSrc checkUpLocalSrc,
  }):
    _api = api,
    _accountLocalSrc = accountLocalSrc,
    _checkUpLocalSrc = checkUpLocalSrc
  ;

  @override
  Future<Result<String>> getBabyNik() async {
    try {
      final res = await _accountLocalSrc.getCurrentEmail();
      prind("MyBabyRepoImpl.getBabyNik() res = $res");
      if(res is Success<String>) {
        final email = res.data;
        prind("MyBabyRepoImpl.getBabyNik() email = $email");
        final res2 = await _accountLocalSrc.getChildNik(email);
        prind("MyBabyRepoImpl.getBabyNik() res2 = $res2");
        return res2;
      } else {
        return res as Fail<String>;
      }
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getBabyNik()`", error: e);
    }
  }

  //TODO: getBornBabyOverlayData(): Dummy;
  @override
  Future<Result<List<BabyOverlayData>>> getBornBabyOverlayData(String motherNik) async => Success(dummyBabyOverlayDataList_baby);
  @override
  Future<Result<List<BabyOverlayData>>> getUnbornBabyOverlayData(String motherNik) async => Success(dummyBabyOverlayDataList_pregnancy);

  BabyHomeResponse? _homeResponse;
  int _currentMonthId = -1;
  BabyFormWarningResponse? _formWarningResponse;

  @override
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik) async {
    final idRes = await _accountLocalSrc.getChildId(babyNik);
    if(idRes is Success<int>) {
      final id = idRes.data;
      final homeResponse = _homeResponse ??= await _api.getHomeData();
      final child = homeResponse.data.firstWhereOrNull((e) => e.id == id);
      if(child == null) {
        return Fail(msg: "Can't find `child` with `id` '$id' with `babyNik` '$babyNik'");
      }
      final res = BabyAgeOverview.fromResponse(child);
      return Success(res);
    }
    return (idRes as Fail<int>).copy();
  }
  Future<Result<List<FormWarningStatus>>> getBabyWarningStatus(String babyNik, int monthId) async {
    try {
      if(monthId != _currentMonthId) {
        final body = BabyFormWarningBody(monthId: monthId);
        _formWarningResponse = await _api.getFormWarning(body);
        _currentMonthId = monthId;
      }
      final data = _formWarningResponse!.data;
      final list = <FormWarningStatus>[
        FormWarningStatus.fromBabyResponse(data.weight),
        FormWarningStatus.fromBabyResponse(data.len),
        FormWarningStatus.fromBabyResponse(data.weightToLen),
        FormWarningStatus.fromBabyResponse(data.headCircum),
        FormWarningStatus.fromBabyResponse(data.imt),
      ];
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getBabyWarningStatus()`", error: e);
    }
  }

  @override
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu() async => Success(babyHomeGraph_ui);

  @override
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu() async {
    try {
      final data = _homeResponse = await _api.getHomeData();
      final rawYears = data.data.first.years;
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
    required String babyNik,
    required int month,
    required int id,
  }) => _checkUpLocalSrc.saveCheckUpId(id: id, period: month, nik: babyNik);

  @override
  Future<Result<int>> getBabyCheckUpId({
    required String babyNik,
    required int month,
  }) => _checkUpLocalSrc.getCheckUpId(period: month, nik: babyNik);

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
}

class MyBabyRepoDummy with MyBabyRepo {
  MyBabyRepoDummy._();
  static final obj = MyBabyRepoDummy._();

  @override
  Future<Result<String>> getBabyNik() async => Success("");
  @override
  Future<Result<List<BabyOverlayData>>> getBornBabyOverlayData(String motherNik) async => Success(dummyBabyOverlayDataList_baby);
  @override
  Future<Result<List<BabyOverlayData>>> getUnbornBabyOverlayData(String motherNik) async => Success(dummyBabyOverlayDataList_pregnancy);
  @override
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik) async => Success(dummyBabyAgeOverview);
  @override
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu() async => Success(babyHomeGraph_ui);
  @override
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu() async => Success(babyFormMenuList_ui);
  @override
  Future<Result<List<BabyChartMenuData>>> getBabyGrowthGraphMenu() async => Success(babyGrowthGraphMenuList);
  @override
  Future<Result<List<BabyChartMenuData>>> getBabyDevGraphMenu() async => Success(babyDevGraphMenuList);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyWarningStatus(String babyNik, int monthId) async =>
      Success(motherWarningStatusList);
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
    required String babyNik,
    required int month,
    required int id,
  }) async => Success(true);

  @override
  Future<Result<int>> getBabyCheckUpId({
    required String babyNik,
    required int month,
  }) async => Success(1);
}



