import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/providers.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/di/kehamilanku_vm_di.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_page.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_page.dart';


class KehamilankuRoutes extends ModuleRoute {
  KehamilankuRoutes._() : super(GlobalRoutes.manager);
  static final obj = KehamilankuRoutes._();

  @override
  SibRoute get entryPoint => kehamilankuHomePage;

  @override
  final String name = GlobalRoutes.kehamilanku;

  @override
  Set<SibRoute> get routes => {
    kehamilankuHomePage,
    pregnancyCheckPage._route,
  };


  static final kehamilankuHomePage = SibRoute("KehamilankuHomePage", KehamilankuHomePage, (ctx) => MainFrame(
    body: KehamilankuHomePage().inVmProvider([
      (ctx) => KehamilankuVmDi.kehamilankuHomeVm,
    ]),
  ));
  static final pregnancyCheckPage = _PregnancyCheckPageRoute.obj;
}


class _PregnancyCheckPageRoute {
  _PregnancyCheckPageRoute._();
  static final obj = _PregnancyCheckPageRoute._();

  final SibRoute _route = SibRoute("PregnancyCheckPage", KehamilankuTrimesterFormPage, (ctx) => MainFrame(
    body: KehamilankuTrimesterFormPage().inVmProvider([
          (ctx) => KehamilankuVmDi.checkFormVm,
    ]),
  ));

  void go(BuildContext context, MotherTrimester data) {
    _route.goToPage(context, args: {Const.KEY_TRIMESTER : data});
  }
}