import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/providers.dart';
import 'package:common/value/const_values.dart';
import 'package:covid19/di/covid_vm_di.dart';
import 'package:covid19/ui/check/covid_check_page.dart';
import 'package:covid19/ui/home/covid_home_page.dart';
import 'package:flutter/cupertino.dart';

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
    covidCheckPage._route,
  };

  static final covidHomePage = SibRoute("CovidHomePage", CovidHomePage, (ctx) => MainFrame(
    body: CovidHomePage().inVmProvider([
      (ctx) => CovidVmDi.covidHomeVm,
    ]),
  ));
  static final covidCheckPage = _CovidCheckPageRoute.obj;
}

class _CovidCheckPageRoute {
  _CovidCheckPageRoute._();
  static final obj = _CovidCheckPageRoute._();

  final _route = SibRoute("CovidCheckPage", CovidCheckPage, (ctx) => MainFrame(
    body: CovidCheckPage().inVmProvider([
          (ctx) => CovidVmDi.checkVm,
    ]),
  ));

  Future<void> go(BuildContext context, { required bool isMother }) {
    return _route.goToPage(context, args: { Const.KEY_DATA : isMother });
  }
}