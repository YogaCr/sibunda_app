import 'package:bayiku/config/baby_routes.dart';
import 'package:common/config/_config.dart';
import 'package:covid19/config/covid_routes.dart';
import 'package:education/config/education_routes.dart';
import 'package:home/config/home_routes.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';
import 'package:profile/config/profile_routes.dart';

class AppRoutes extends ModuleRoute {
  AppRoutes._(): super(GlobalRoutes.manager) {
    _init();
  }
  static final obj = AppRoutes._();

  void _init() {
    HomeRoutes.obj;
    CovidRoutes.obj;
    KehamilankuRoutes.obj;
    BabyRoutes.obj;
    EducationRoutes.obj;
    ProfileRoutes.obj;
  }

  @override
  SibRoute get entryPoint => HomeRoutes.splashPage;

  @override
  String get name => GlobalRoutes.app;

  @override
  Set<SibRoute> get routes => {};
}