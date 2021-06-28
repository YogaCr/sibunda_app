import 'package:bayiku/config/baby_routes.dart';
import 'package:common/config/_config.dart';
import 'package:home/config/home_routes.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';

class AppRoutes extends ModuleRoute {
  AppRoutes._(): super(GlobalRoutes.manager) {
    _init();
  }
  static final obj = AppRoutes._();

  void _init() {
    HomeRoutes.obj;
    KehamilankuRoutes.obj;
    BabyRoutes.obj;
  }

  @override
  SibRoute get entryPoint => HomeRoutes.homePage;

  @override
  String get name => GlobalRoutes.app;

  @override
  Set<SibRoute> get routes => {};
}