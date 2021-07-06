import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/api/baby_api.dart';
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

mixin MyBabyRepo {
  Future<Result<String>> getBabyNik();
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyWarningStatus(String babyNik, int month);
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu();
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu();
  Future<Result<List<BabyChartMenuData>>> getBabyGrowthGraphMenu();
  Future<Result<List<BabyChartMenuData>>> getBabyDevGraphMenu();
  Future<Result<bool>> saveNeonatalServiceForm({
    required int page,
    required Map<String, dynamic> formData,
  });
}


class MyBabyRepoImpl with MyBabyRepo {
  final BabyApi _api;
  final AccountLocalSrc _accountLocalSrc;
  MyBabyRepoImpl({
    required BabyApi api,
    required AccountLocalSrc accountLocalSrc,
  }):
    _api = api,
    _accountLocalSrc = accountLocalSrc
  ;

  @override
  Future<Result<String>> getBabyNik() async {
    final res = await _accountLocalSrc.getCurrentEmail();
    if(res is Success<String>) {
      final email = res.data;
      return await _accountLocalSrc.getChildNik(email);
    } else {
      return res as Fail<String>;
    }
  }

  BabyHomeResponse? _homeResponse;
  int _currentMonth = -1;
  BabyFormWarningResponse? _formWarningResponse;

  @override
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik) async => Success(dummyBabyAgeOverview);
  Future<Result<List<FormWarningStatus>>> getBabyWarningStatus(String babyNik, int month) async {
    if(month != _currentMonth) {
      final body = BabyFormWarningBody(monthId: month);
      _formWarningResponse = await _api.getFormWarning(body);
      _currentMonth = month;
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
  }

  @override
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu() async => Success(babyHomeGraph_ui);

  @override
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu() async {
    final data = _homeResponse = await _api.getHomeData();
    final rawYears = data.data.first.years;
    final years = rawYears.map((e) => BabyFormMenuData.fromResponse(e)).toList(growable: false);
    return Success(years);
  }

  @override
  Future<Result<List<BabyChartMenuData>>> getBabyGrowthGraphMenu() async => Success(babyGrowthGraphMenuList);

  @override
  Future<Result<List<BabyChartMenuData>>> getBabyDevGraphMenu() async => Success(babyDevGraphMenuList);

  @override
  Future<Result<bool>> saveNeonatalServiceForm({
    required int page,
    required Map<String, dynamic> formData,
  }) async {
    switch(page) {
      case 0: //For 6 hours
        final body = Neonatal6HourFormBody.fromJson(formData);
        await _api.sendNeo6hForm(body);
        break;
      case 1: //For KN1
        final body = NeonatalKn1n2FormBody.fromJson(formData);
        await _api.sendKn1Form(body);
        break;
      case 2: //For KN2
        final body = NeonatalKn1n2FormBody.fromJson(formData);
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
  }
}

class MyBabyRepoDummy with MyBabyRepo {
  MyBabyRepoDummy._();
  static final obj = MyBabyRepoDummy._();

  @override
  Future<Result<String>> getBabyNik() async => Success("");
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
  Future<Result<List<FormWarningStatus>>> getBabyWarningStatus(String babyNik, int month) async =>
      Success(motherWarningStatusList);

  @override
  Future<Result<bool>> saveNeonatalServiceForm({
    required int page,
    required Map<String, dynamic> formData,
  }) async => Success(true);
}



