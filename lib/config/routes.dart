import 'package:common/config/routes.dart';
import 'package:common/ui/page/frames.dart';
import 'package:flutter/material.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:common/di/_di.dart';
import 'package:sibunda_app/ui/page/_page.dart';
import 'package:common/bloc/bloc_extension.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:sibunda_app/ui/page/form_get_started/children_count_page.dart';
import 'package:sibunda_app/ui/page/form_get_started/father_data_page.dart';
import 'package:sibunda_app/ui/page/form_get_started/mother_data_page.dart';
import 'package:sibunda_app/ui/page/form_get_started/mother_hpl_page.dart';
import 'package:sibunda_app/ui/page/form_get_started/do_mother_have_pregnancy_page.dart';
import 'package:sibunda_app/ui/page/home/home_page.dart';
import 'package:sibunda_app/ui/page/home/notif_and_message_page.dart';

class SibRoutes {
  SibRoutes._();

  static void backPage(BuildContext context) => Navigator.pop(context);

  static final splashPage = SibRoute("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage(),
    padding: EdgeInsets.all(20),
  ));
  static final signInPage = SibRoute("SignInPage", SignInPage, (ctx) => PlainBackFrame(
    body: SignInPage()
        .inBlocProvider<LoginFormBloc>((ctx) => LoginFormBloc(RepoDi.getAuthRepo())),
    padding: EdgeInsets.all(20),
  ));
  static final signUpPage = SibRoute("SignUpPage", SignUpPage, (ctx) => PlainBackFrame(
    body: SignUpPage().inBlocProvider<SignUpFormBloc>((ctx) => SignUpFormBloc(RepoDi.getAuthRepo())),
    padding: EdgeInsets.all(20),
  ));
  static final homePage_old = SibRoute("HomePage_old", HomePage_Old, (ctx) => MainFrame(
    body: HomePage_Old().inBlocProvider<LogoutFormBloc>((ctx) => LogoutFormBloc(RepoDi.getAuthRepo())),
    padding: EdgeInsets.all(20),
  ));
  static final homePage = SibRoute("HomePage", HomePage, (ctx) => MainFrame(
    body: HomePage().inBlocProvider<LogoutFormBloc>((ctx) => LogoutFormBloc(RepoDi.getAuthRepo())),
    padding: EdgeInsets.all(20),
  ));
  static final notifAndMessagePage = SibRoute("NotifAndMessagePage", HomePage, (ctx) => TopBarTabFrame(
    title: "Notifikasi",
    tabs: [
      Tab(text: "Notifikasi",),
      Tab(text: "Pesan",),
    ],
    tabViews: [
      HomeNotifPage(),
      HomeMessagePage(),
    ],
  ));

  static final motherDataPage = SibRoute("MotherDataPage", MotherDataPage, (ctx) => MainFrame(
    body: MotherDataPage().inBlocProvider<MotherFormBloc>((ctx) => MotherFormBloc(RepoDi.getMotherRepo())),
    padding: EdgeInsets.all(20),
  ));
  static final fatherDataPage = SibRoute("FatherDataPage", FatherDataPage, (ctx) => MainFrame(
    body: FatherDataPage().inBlocProvider<FatherFormBloc>((ctx) => FatherFormBloc(RepoDi.getFatherRepo())),
    padding: EdgeInsets.all(20),
  ));
  static final doMotherHavePregnancyPage = SibRoute("DoMotherHavePregnancyPage", DoMotherHavePregnancyPage, (ctx) => MainFrame(
    body: DoMotherHavePregnancyPage(), //.inBlocProvider<FatherFormBloc>((ctx) => FatherFormBloc(DataConfig.defaultFamilyRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final motherHplPage = SibRoute("MotherHplPage", MotherHplPage, (ctx) => MainFrame(
    body: MotherHplPage(), //.inBlocProvider<FatherFormBloc>((ctx) => FatherFormBloc(DataConfig.defaultFamilyRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final childrenCountPage = SibRoute("ChildrenCountPage", ChildrenCountPage, (ctx) => MainFrame(
    body: ChildrenCountPage().inBlocProvider<ChildFormBloc>((ctx) => ChildFormBloc(RepoDi.getChildRepo())),
    padding: EdgeInsets.all(20),
  ));
}