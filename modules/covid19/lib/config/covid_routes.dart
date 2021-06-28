import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/providers.dart';
import 'package:covid19/di/covid_vm_di.dart';
import 'package:covid19/ui/home/covid_home_page.dart';

class CovidRoutes extends ModuleRoute {
  CovidRoutes._() : super(GlobalRoutes.manager);
  static final obj = CovidRoutes._();

  @override
  SibRoute get entryPoint => covidHomePage;

  @override
  String get name => GlobalRoutes.covid19;

  @override
  Set<SibRoute> get routes => {
    covidHomePage,
  };

  static final covidHomePage = SibRoute("CovidHomePage", CovidHomePage, (ctx) => MainFrame(
    body: CovidHomePage().inVmProvider([
      (ctx) => CovidVmDi.covidHomeVm,
    ]),
  ));
}