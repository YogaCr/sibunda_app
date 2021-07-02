import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/providers.dart';
import 'package:common/util/navigations.dart' as nav_ext;
import 'package:common/value/const_values.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/di/kehamilanku_vm_di.dart';
import 'package:kehamilanku/ui/chart/mother_chart_page.dart';
import 'package:kehamilanku/ui/chart/mother_preg_eval_chart_menu_page.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_page.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_page.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_page.dart';
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
    immunizationPage,
    chartPage._route,
  };


  static final kehamilankuHomePage = SibRoute("KehamilankuHomePage", KehamilankuHomePage, (ctx) => MainFrame(
    body: KehamilankuHomePage().inVmProvider([
      (ctx) => KehamilankuVmDi.kehamilankuHomeVm,
    ]),
  ));
  static final pregnancyCheckPage = _PregnancyCheckPageRoute.obj;
  static final immunizationPage = SibRoute("PregnancyImmunizationPage", PregnancyImmunizationPage, (ctx) => MainFrame(
    body: PregnancyImmunizationPage().inVmProvider([
      (ctx) => KehamilankuVmDi.immunizationVm,
    ]),
  ));

  static final pregEvalChartMenuPage = SibRoute("MotherPregEvalChartMenuPage", MotherPregEvalChartMenuPage, (ctx) => MainFrame(
    body: MotherPregEvalChartMenuPage().inVmProvider([
      (ctx) => KehamilankuVmDi.pregEvalChartMenuVm,
    ]),
  ));
  static final chartPage = _MotherChartPageRoute.obj;

  // ================= POPUP ================
  static final immunizationPopup = _PregnancyImmunizationPopupRoute.obj;
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

class _PregnancyImmunizationPopupRoute {
  _PregnancyImmunizationPopupRoute._();
  static final obj = _PregnancyImmunizationPopupRoute._();
/*
  final SibRoute _route = SibRoute("PregnancyImmunizationPopup", PregnancyImmunizationPopupPage, (ctx) => MainFrame(
    body: PregnancyImmunizationPopupPage().inVmProvider([
          (ctx) => KehamilankuVmDi.immunizationVm,
    ]),
  ));
 */
  /// Returns future String. String is for date confirmation. If null, then
  /// it means the confirmation is not successful.
  Future<String?> popup(BuildContext context, ImmunizationData immunization) {
    //_route.goToPage(context, args: {Const.KEY_TRIMESTER : data});
    final _route = SibRoute("PregnancyImmunizationPopup", PregnancyImmunizationPopupPage, (ctx) => MainFrame(
      body: PregnancyImmunizationPopupPage().inVmProvider([
            (ctx) => KehamilankuVmDi.immunizationPopupVm(immunization),
      ]),
    ));
    return _route.showAsDialog<String>(context);
  }
  void backPage(BuildContext context, String? date) {
    nav_ext.backPage(context, result: date);
  }
}


class _MotherChartPageRoute {
  _MotherChartPageRoute._();
  static final obj = _MotherChartPageRoute._();

  final _route = SibRoute("MotherChartPage", MotherChartPage, (ctx) => MainFrame(
    body: MotherChartPage().inVmProvider([
      (ctx) => KehamilankuVmDi.motherChartVm,
    ]),
  ));

  void go(BuildContext context, MotherChartType type) {
    _route.goToPage(context, args: { Const.KEY_DATA: type });
  }
}