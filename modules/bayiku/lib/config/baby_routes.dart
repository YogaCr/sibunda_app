import 'package:bayiku/di/baby_vm_di.dart';
import 'package:bayiku/ui/chart/baby_chart_page.dart';
import 'package:bayiku/ui/chart/baby_growth_chart_menu_page.dart';
import 'package:bayiku/ui/check_form/baby_check_form_page.dart';
import 'package:bayiku/ui/home/baby_home_page.dart';
import 'package:bayiku/ui/immunization/baby_immunization_page.dart';
import 'package:bayiku/ui/immunization/baby_immunization_popup_page.dart';
import 'package:bayiku/ui/neonatal_service/neonatal_service_page.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/model/immunization_data.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/arch/ui/widget/form_faker_enabler.dart';
import 'package:common/config/_config.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/providers.dart';
import 'package:common/util/navigations.dart' as nav_ext;
import 'package:common/value/const_values.dart';
import 'package:flutter/material.dart';

class BabyRoutes extends ModuleRoute {
  BabyRoutes._() : super(GlobalRoutes.manager);
  static final obj = BabyRoutes._();

  @override
  SibRoute get entryPoint => babyHomePage;

  @override
  String get name => GlobalRoutes.bayiku;

  @override
  Set<SibRoute> get routes => {
    babyHomePage,
  };

  static final babyHomePage = SibRoute("BabyHomePage", BabyHomePage, (ctx) => MainFrame(
    body: BabyHomePage().inVmProvider([
          (ctx) => BabyVmDi.obj.babyHomeVm(context: ctx),
    ]),
  ));
  static final babyCheckPage = _BabyCheckFormPage.obj;
  static final neonatalServicePage = _BabyNeonantalServicePageRoute.obj;

  static final babyImmunizationPage = _BabyImmunizationPageRoute.obj;
  static final growthChartMenuVm = _BabyGrowthChartPageRoute.obj;
  static final chartPageRoute = _BabyChartPageRoute.obj;

  // ================= POPUP ================
  static final immunizationPopup = _BabyImmunizationPopupRoute.obj;
}


class _BabyCheckFormPage {
  _BabyCheckFormPage._();
  static final obj = _BabyCheckFormPage._();

  void go({
    required BuildContext context,
    required BabyFormMenuData formData,
    required ProfileCredential babyCredential,
  }) {
    final route = SibRoute("BabyCheckFormPage", BabyCheckFormPage, (ctx) {
      //final FormGroupInterceptor? interceptor = ConfigUtil.formInterceptor;
      return MainFrame(
          body: FormFakerEnabler(
            showInDefault: TestUtil.isDummy,
            builder: (ctx, interceptor) => BabyCheckFormPage(interceptor: interceptor,).inVmProvider([
                  (ctx) => BabyVmDi.obj.babyCheckFormVm(
                    context: ctx,
                    babyCredential: babyCredential,
                  ),
            ]),
          )
      );
    });
    route.goToPage(context, args: { Const.KEY_DATA: formData });
  }
}

class _BabyNeonantalServicePageRoute {
  _BabyNeonantalServicePageRoute._();
  static final obj = _BabyNeonantalServicePageRoute._();

  void go({
    required BuildContext context,
    required BabyFormId checkUpId,
  }) {
    final route = SibRoute("NeonatalServicePage", NeonatalServicePage, (ctx) {
      //final FormGroupInterceptor? interceptor = ConfigUtil.formInterceptor;
      return MainFrame(
        body: FormFakerEnabler(
          showInDefault: TestUtil.isDummy,
          //interceptor: interceptor,
          builder: (ctx, interceptor) => NeonatalServicePage(interceptor: interceptor,).inVmProvider([
                (ctx) => BabyVmDi.obj.neonatalServiceVm(
                  context: ctx,
                  checkUpId: checkUpId,
                ),
          ]),
        ),
      );
    });
    route.goToPage(context);
  }
}


class _BabyImmunizationPopupRoute {
  _BabyImmunizationPopupRoute._();
  static final obj = _BabyImmunizationPopupRoute._();

  /// Returns future String. String is for date confirmation. If null, then
  /// it means the confirmation is not successful.
  Future<BabyImmunizationPopupResult?> popup({
    required BuildContext context,
    required ImmunizationData immunization,
    required ProfileCredential babyCredential,
  }) {
    final _route = SibRoute("BabyImmunizationPopup", BabyImmunizationPopupPage, (ctx) => MainFrame(
      body: BabyImmunizationPopupPage().inVmProvider([
            (ctx) => BabyVmDi.obj.immunizationPopupVm(
              context: ctx,
              immunization: immunization,
              babyCredential: babyCredential,
            ),
      ]),
    ));
    return _route.showAsDialog<BabyImmunizationPopupResult>(context);
  }
  void backPage(BuildContext context, BabyImmunizationPopupResult? date) {
    nav_ext.backPage(context, result: date);
  }
}

class _BabyChartPageRoute {
  _BabyChartPageRoute._();
  static final obj = _BabyChartPageRoute._();

  void go({
    required BuildContext context,
    required BabyChartType type,
    required ProfileCredential babyCredential,
  }) {
    final route = SibRoute("BabyChartPage", BabyChartPage, (ctx) => MainFrame(
      body: BabyChartPage().inVmProvider([
            (ctx) => BabyVmDi.obj.chartVm(
              context: ctx,
              babyCredential: babyCredential,
            ),
      ]),
    ));
    route.goToPage(context, args: { Const.KEY_DATA: type });
  }
}

class _BabyImmunizationPageRoute {
  _BabyImmunizationPageRoute._();
  static final obj = _BabyImmunizationPageRoute._();

  void go({
    required BuildContext context,
    required ProfileCredential babyCredential,
  }) {
    final route = SibRoute("BabyImmunizationPage", BabyImmunizationPage, (ctx) => MainFrame(
      body: BabyImmunizationPage().inVmProvider([
            (ctx) => BabyVmDi.obj.babyImmunizationVm(
              context: ctx,
              babyCredential: babyCredential,
            ),
      ]),
    ));
    route.goToPage(context);
  }
}

class _BabyGrowthChartPageRoute {
  _BabyGrowthChartPageRoute._();
  static final obj = _BabyGrowthChartPageRoute._();

  void go({
    required BuildContext context,
    required ProfileCredential babyCredential,
  }) {
    final route = SibRoute("BabyGrowthChartMenuVm", BabyGrowthChartMenuPage, (ctx) => MainFrame(
      body: BabyGrowthChartMenuPage().inVmProvider([
            (ctx) => BabyVmDi.obj.growthChartMenuVm(
              context: ctx,
              babyCredential: babyCredential,
            ),
      ]),
    ));
    route.goToPage(context);
  }
}