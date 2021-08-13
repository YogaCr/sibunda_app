import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/page/frames.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/arch/ui/widget/form_faker_enabler.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/providers.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';
import 'package:home/di/home_vm_di.dart';
import 'package:home/ui/form_get_started/child_form_page.dart';
import 'package:home/ui/form_get_started/children_count_page.dart';
import 'package:home/ui/form_get_started/do_mother_have_pregnancy_page.dart';
import 'package:home/ui/form_get_started/father_form_page.dart';
import 'package:home/ui/form_get_started/get_started_form_main_page.dart';
import 'package:home/ui/form_get_started/mother_form_page.dart';
import 'package:home/ui/form_get_started/mother_hpl_page.dart';
import 'package:home/ui/form_get_started/new_account_confirmation_page.dart';
import 'package:home/ui/home/home_page.dart';
import 'package:home/ui/home/notif_and_message_page.dart';
import 'package:home/ui/intro/intro_page.dart';
import 'package:home/ui/login/login_page.dart';
import 'package:home/ui/signup/sign_up_page.dart';
import 'package:home/ui/splash/splash_page.dart';

class HomeRoutes extends ModuleRoute {
  HomeRoutes._(): super(GlobalRoutes.manager) {
    exportRoute(GlobalRoutes.home_loginPage, HomeRoutes.loginPage);
    exportRoute(
      GlobalRoutes.home_motherFormPage,
      HomeRoutes.motherFormPage.getRoute(),
    );
    exportRoute(
      GlobalRoutes.home_fatherFormPage,
      HomeRoutes.fatherFormPage.getRoute(),
    );
    exportRouteBuilder(
      GlobalRoutes.home_childFormPage,
      (args) => HomeRoutes.childFormPage.getRoute(
        childCount: args[Const.KEY_DATA],
        pregnancyId: args[Const.KEY_PREGNANCY_ID],
      ),
    );
    exportRouteBuilder(
      GlobalRoutes.home_motherHplPage,
      (args) => HomeRoutes.motherHplPage.getRoute(),
    );
  }
  static final obj = HomeRoutes._();

  @override
  SibRoute get entryPoint => splashPage;
  @override
  final String name = GlobalRoutes.home;
  @override
  Set<SibRoute> get routes => {
    introPage, signUpPage, loginPage,
    //motherFormPage, fatherFormPage,
    doMotherHavePregnancyPage, childrenCountPage,
    homePage, homeNotifAndMessagePage,
  };

  static final splashPage = SibRoute("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage().inVmProvider([
          (ctx) => HomeVmDi.obj.splashVm,
    ]),
  ), onPreBuild: (ctx) async {
    await TestUtil.initSession();
  });
  static final introPage = SibRoute("IntroPage", IntroPage, (ctx) => NoAppBarFrame(
    statusBarColor: black_trans_most3,
    body: IntroPage(),
    padding: EdgeInsets.all(20),
  ));
  static final loginPage = SibRoute("LoginPage", LoginPage, (ctx) =>  MainFrame(
    statusBarColor: black_trans_most3,
    body: LoginPage().inVmProvider([
      (ctx) => HomeVmDi.obj.loginFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));

  static final getStartedFormMainPage = SibRoute("GetStartedFormMainPage", GetStartedFormMainPage, (ctx) {
    //final FormGroupInterceptor? interceptor = ConfigUtil.formInterceptor;
    return MainFrame(
      statusBarColor: black_trans_most3,
      body: FormFakerEnabler(
        showInDefault: TestUtil.isDummy,
        //interceptor: interceptor,
        builder: (ctx, interceptor) => GetStartedFormMainPage(interceptor: interceptor,).inVmProvider([
              (ctx) => HomeVmDi.obj.getStartedFormMainVm(context: ctx,),
        ]),
      ),
    );
  });
  //============ Get started forms ==========
  static final signUpPage = SibRoute("SignUpPage", SignUpPage, (ctx) =>  PlainBackFrame(
    body: SignUpPage().inVmProvider([
          (ctx) => HomeVmDi.obj.signUpFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final motherFormPage = _MotherFormPageRoute.obj;
  static final fatherFormPage = _FatherFormPageRoute.obj;
  static final doMotherHavePregnancyPage = SibRoute("DoMotherHavePregnancyPage", DoMotherHavePregnancyPage, (ctx) =>  PlainBackFrame(
    body: DoMotherHavePregnancyPage().inVmProvider([
      (ctx) => HomeVmDi.obj.doMotherHavePregnancyVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final motherHplPage = _MotherHplPageRoute.obj;
  static final childrenCountPage = SibRoute("ChildrenCountPage", ChildrenCountPage, (ctx) =>  PlainBackFrame(
    body: ChildrenCountPage().inVmProvider([
          (ctx) => HomeVmDi.obj.childrenCountVm,
    ]), //.inVmProvider([(ctx) => HomeVmDi.obj.childFormVm,]),
    padding: EdgeInsets.all(20),
  ));
  static final childFormPage = _ChildFormPageRoute.obj;
  static final newAccountConfirmPage = SibRoute("NewAccountConfirmPage", NewAccountConfirmPage, (ctx) =>  PlainBackFrame(
    body: NewAccountConfirmPage().inVmProvider([
      (ctx) => HomeVmDi.obj.getStartedFormMainVm(context: ctx,),
    ]),
    padding: EdgeInsets.all(20),
  ));
  //============ Get started forms ========== end

  static final homePage = SibRoute("HomePage", HomePage, (ctx) =>  MainFrame(
    body: HomePage().inVmProvider([
      (ctx) => HomeVmDi.obj.homeVm(context: ctx),
    ]), //.inVmProvider([(ctx) =
  ));
  static final homeNotifAndMessagePage = SibRoute("HomeNotifAndMessagePage", HomeNotifAndMessagePage, (ctx) =>  MainFrame(
    body: HomeNotifAndMessagePage().inVmProvider([
      (ctx) => HomeVmDi.obj.notifAndMessageVm(context: ctx),
    ]), //.inVmProvider([(ctx) => H
  ));
}


class _MotherFormPageRoute {
  _MotherFormPageRoute._();
  static final obj = _MotherFormPageRoute._();

  SibRoute getRoute() {
    return SibRoute("MotherFormPage", MotherFormPage, (ctx) =>  PlainBackFrame(
      body: MotherFormPage().inVmProvider([
            (ctx) => HomeVmDi.obj.motherFormVm(context: ctx),
      ]),
      padding: EdgeInsets.all(20),
    ));
  }

  void go({
    required BuildContext context,
    bool? canSkip,
  }) {
    final route = getRoute();
    route.goToPage(context, args: {Const.KEY_CAN_SKIP: canSkip});
  }
}
class _FatherFormPageRoute {
  _FatherFormPageRoute._();
  static final obj = _FatherFormPageRoute._();

  SibRoute getRoute() {
    return SibRoute("FatherFormPage", FatherFormPage, (ctx) =>  PlainBackFrame(
      body: FatherFormPage().inVmProvider([
            (ctx) => HomeVmDi.obj.fatherFormVm(context: ctx),
      ]),
      padding: EdgeInsets.all(20),
    ));
  }

  void go({
    required BuildContext context,
    bool? canSkip,
  }) {
    final route = getRoute();
    route.goToPage(context, args: {Const.KEY_CAN_SKIP: canSkip});
  }
}

class _ChildFormPageRoute {
  _ChildFormPageRoute._();
  static final obj = _ChildFormPageRoute._();

  SibRoute getRoute({
    LiveData<int>? childCount,
    ProfileCredential? pregnancyId,
  }) {
    //final interceptor = ConfigUtil.formInterceptor;
    return SibRoute("ChildFormPage", ChildFormPage, (ctx) =>  PlainBackFrame(
      statusBarColor: Manifest.theme.colorBackground,
      padding: EdgeInsets.all(20),
      body: FormFakerEnabler(
        showInDefault: TestUtil.isDummy,
        //interceptor: interceptor,
        builder: (ctx, interceptor) => ChildFormPage(interceptor: interceptor,).inVmProvider([
          (ctx) => HomeVmDi.obj.childFormVm(
            context: ctx,
            childCount: childCount,
            pregnancyId: pregnancyId,
          ),
        ]),
      ),
    ));
  }

  /// Return future `true` if children data in this route is saved successfully.
  Future<bool?> go({
    required BuildContext context,
    LiveData<int>? childCount,
    ProfileCredential? pregnancyId,
  }) => getRoute(
    childCount: childCount,
    pregnancyId: pregnancyId
  ).goToPage(context);
}

class _MotherHplPageRoute {
  _MotherHplPageRoute._();
  static final obj = _MotherHplPageRoute._();

  SibRoute getRoute() => SibRoute("MotherHplPage", MotherHplPage, (ctx) =>  PlainBackFrame(
    statusBarColor: Manifest.theme.colorBackground,
    body: MotherHplPage().inVmProvider([
          (ctx) => HomeVmDi.obj.motherHplVm(context: ctx,),
    ]), //.inVmProvider([(ctx) => HomeVmDi.childFormVm,]),
    padding: EdgeInsets.all(20),
  ));
  /// Return future `true` if HPL data in this route is saved successfully.
  Future<bool?> go({
    required BuildContext context,
  }) => getRoute().goToPage(context);
}