import 'package:common/arch/data/remote/api/auth_api.dart';
import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/api/covid_api.dart';
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:common/arch/data/remote/api/home_api.dart';
import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/di/config_di.dart';

class ApiDi {
  ApiDi._();

  static ApiDiObj obj = ApiDiObjImpl();
}


abstract class ApiDiObj {
  AuthApi get authApi;

  KehamilankuApi get kehamilankuApi;
  BabyApi get babyApi;
  CovidApi get covidApi;
  DataApi get dataApi;
  HomeApi get homeApi;
}

class ApiDiObjImpl extends ApiDiObj {
  AuthApi? _authApi;
  @override
  AuthApi get authApi => _authApi ??= AuthApi();

  @override
  KehamilankuApi get kehamilankuApi => KehamilankuApi(VarDi.session);
  @override
  BabyApi get babyApi => BabyApi(VarDi.session);
  @override
  CovidApi get covidApi => CovidApi(VarDi.session);
  @override
  DataApi get dataApi => DataApi(VarDi.session);
  @override
  HomeApi get homeApi => HomeApi(VarDi.session);
}