import 'package:common/arch/ui/page/frames.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/config/_config.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/providers.dart';
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
  HomeRoutes._(): super(GlobalRoutes.manager);
  static final obj = HomeRoutes._();

  @override
  SibRoute get entryPoint => splashPage;
  @override
  final String name = GlobalRoutes.home;
  @override
  Set<SibRoute> get routes => {
    introPage, signUpPage, loginPage,
    motherFormPage, fatherFormPage, childFormPage,
    doMotherHavePregnancyPage, motherHplPage, childrenCountPage,
    homePage, homeNotifAndMessagePage,
  };

  static final splashPage = SibRoute("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage().inVmProvider([
          (ctx) => HomeVmDi.splashVm,
    ]),
  ), onPreBuild: (ctx) async {
    await TestUtil.initSession();
  });
  static final introPage = SibRoute("IntroPage", IntroPage, (ctx) => NoAppBarFrame(
    body: IntroPage(),
    padding: EdgeInsets.all(20),
  ));
  static final loginPage = SibRoute("LoginPage", LoginPage, (ctx) =>  MainFrame(
    body: LoginPage().inVmProvider([
      (ctx) => HomeVmDi.loginFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));

  static final getStartedFormMainPage = SibRoute("GetStartedFormMainPage", GetStartedFormMainPage, (ctx) {
    final FormGroupInterceptor? interceptor = FormGroupInterceptor();
    return MainFrame(
      body: FormFaker(
        interceptor: interceptor,
        child: GetStartedFormMainPage(interceptor: interceptor,).inVmProvider([
              (ctx) => HomeVmDi.getStartedFormMainVm,
        ]),
      ),
    );
  });
  //============ Get started forms ==========
  static final signUpPage = SibRoute("SignUpPage", SignUpPage, (ctx) =>  PlainBackFrame(
    body: SignUpPage().inVmProvider([
          (ctx) => HomeVmDi.signUpFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final motherFormPage = SibRoute("MotherFormPage", MotherFormPage, (ctx) =>  PlainBackFrame(
    body: MotherFormPage().inVmProvider([
      (ctx) => HomeVmDi.motherFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final fatherFormPage = SibRoute("FatherFormPage", FatherFormPage, (ctx) =>  PlainBackFrame(
    body: FatherFormPage().inVmProvider([
      (ctx) => HomeVmDi.fatherFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final doMotherHavePregnancyPage = SibRoute("DoMotherHavePregnancyPage", DoMotherHavePregnancyPage, (ctx) =>  PlainBackFrame(
    body: DoMotherHavePregnancyPage().inVmProvider([
      (ctx) => HomeVmDi.doMotherHavePregnancyVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final motherHplPage = SibRoute("MotherHplPage", MotherHplPage, (ctx) =>  PlainBackFrame(
    body: MotherHplPage().inVmProvider([
      (ctx) => HomeVmDi.motherHplVm,
    ]), //.inVmProvider([(ctx) => HomeVmDi.childFormVm,]),
    padding: EdgeInsets.all(20),
  ));
  static final childrenCountPage = SibRoute("ChildrenCountPage", ChildrenCountPage, (ctx) =>  PlainBackFrame(
    body: ChildrenCountPage().inVmProvider([
          (ctx) => HomeVmDi.childrenCountVm,
    ]), //.inVmProvider([(ctx) => HomeVmDi.childFormVm,]),
    padding: EdgeInsets.all(20),
  ));
  static final childFormPage = SibRoute("ChildFormPage", ChildFormPage, (ctx) =>  PlainBackFrame(
    body: ChildFormPage().inVmProvider([
      (ctx) => HomeVmDi.childFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final newAccountConfirmPage = SibRoute("NewAccountConfirmPage", NewAccountConfirmPage, (ctx) =>  PlainBackFrame(
    body: NewAccountConfirmPage().inVmProvider([
      (ctx) => HomeVmDi.getStartedFormMainVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  //============ Get started forms ========== end

  static final homePage = SibRoute("HomePage", HomePage, (ctx) =>  MainFrame(
    body: HomePage().inVmProvider([
      (ctx) => HomeVmDi.homeVm,
    ]), //.inVmProvider([(ctx) =
  ));
  static final homeNotifAndMessagePage = SibRoute("HomeNotifAndMessagePage", HomeNotifAndMessagePage, (ctx) =>  MainFrame(
    body: HomeNotifAndMessagePage().inVmProvider([
      (ctx) => HomeVmDi.notifAndMessageVm,
    ]), //.inVmProvider([(ctx) => H
  ));
}