import 'package:common/arch/ui/page/frames.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/providers.dart';
import 'package:flutter/material.dart';
import 'package:home/di/home_vm_di.dart';
import 'package:home/ui/form_get_started/child_form_page.dart';
import 'package:home/ui/form_get_started/children_count_page.dart';
import 'package:home/ui/form_get_started/do_mother_have_pregnancy_page.dart';
import 'package:home/ui/form_get_started/father_form_page.dart';
import 'package:home/ui/form_get_started/mother_form_page.dart';
import 'package:home/ui/form_get_started/mother_hpl_page.dart';
import 'package:home/ui/splash/splash_page.dart';
import 'package:home/ui/login/login_page.dart';
import 'package:home/ui/signup/sign_up_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static final splashPage = SibRoute("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage(),
    padding: EdgeInsets.all(20),
  ));
  static final signUpPage = SibRoute("SignUpPage", SignUpPage, (ctx) =>  PlainBackFrame(
    body: SignUpPage().inVmProvider([
      (ctx) => HomeVmDi.signUpFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final loginPage = SibRoute("LoginPage", LoginPage, (ctx) =>  PlainBackFrame(
    body: LoginPage().inVmProvider([
      (ctx) => HomeVmDi.loginFormVm,
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
    body: DoMotherHavePregnancyPage(), //.inVmProvider([(ctx) => HomeVmDi.childFormVm,]),
    padding: EdgeInsets.all(20),
  ));
  static final motherHplPage = SibRoute("MotherHplPage", MotherHplPage, (ctx) =>  PlainBackFrame(
    body: MotherHplPage(), //.inVmProvider([(ctx) => HomeVmDi.childFormVm,]),
    padding: EdgeInsets.all(20),
  ));
  static final childFormPage = SibRoute("ChildFormPage", ChildFormPage, (ctx) =>  PlainBackFrame(
    body: ChildFormPage().inVmProvider([
      (ctx) => HomeVmDi.childFormVm,
    ]),
    padding: EdgeInsets.all(20),
  ));
  static final childrenCountPage = SibRoute("ChildrenCountPage", ChildrenCountPage, (ctx) =>  PlainBackFrame(
    body: ChildrenCountPage(), //.inVmProvider([(ctx) => HomeVmDi.childFormVm,]),
    padding: EdgeInsets.all(20),
  ));
}