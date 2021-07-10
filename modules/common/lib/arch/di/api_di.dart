import 'package:common/arch/data/remote/api/auth_api.dart';
import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/api/covid_api.dart';
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:common/arch/data/remote/api/home_api.dart';
import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/di/config_di.dart';

class ApiDi {
  ApiDi._();

  static AuthApi? _authApi;
  static AuthApi get authApi => _authApi ??= AuthApi();

  static KehamilankuApi get kehamilankuApi => KehamilankuApi(VarDi.session);
  static BabyApi get babyApi => BabyApi(VarDi.session);
  static CovidApi get covidApi => CovidApi(VarDi.session);
  static DataApi get dataApi => DataApi(VarDi.session);
  static HomeApi get homeApi => HomeApi(VarDi.session);
}