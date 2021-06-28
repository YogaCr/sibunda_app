import 'package:common/config/routes.dart';
import 'package:common/data/model/kehamilanku_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/page/frames.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:common/di/_di.dart';
import 'package:sibunda_app/bloc/home_bloc.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';
import 'package:sibunda_app/bloc/notif_bloc.dart';
import 'package:sibunda_app/di/bloc_di.dart';
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
import 'package:sibunda_app/ui/page/mother/kehamilanku_home_page.dart';
import 'package:sibunda_app/ui/page/mother/kehamilanku_trimester_form_page.dart';

class SibRoutes {
  SibRoutes._();

  static void backPage(BuildContext context) => Navigator.pop(context);

  static final splashPage = SibRoute("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage(),
    padding: EdgeInsets.all(20),
  ));
  static final signInPage = SibRoute("SignInPage", SignInPage, (ctx) => PlainBackFrame(
    body: SignInPage()
        .inBlocProvider<LoginFormBloc>((ctx) => BlocDi.loginFormBloc),
    padding: EdgeInsets.all(20),
  ));
  static final signUpPage = SibRoute("SignUpPage", SignUpPage, (ctx) => PlainBackFrame(
    body: SignUpPage().inBlocProvider<SignUpFormBloc>((ctx) => BlocDi.signUpFormBloc),
    padding: EdgeInsets.all(20),
  ));
  static final homePage_old = SibRoute("HomePage_old", HomePage_Old, (ctx) => MainFrame(
    body: HomePage_Old().inBlocProvider<LogoutFormBloc>((ctx) => BlocDi.logoutFormBloc),
    padding: EdgeInsets.all(20),
  ));
  static final homePage = SibRoute("HomePage", HomePage, (ctx) => MainFrame(
    body: HomePage().inBlocProvider<HomeBloc>((ctx) => BlocDi.homeBloc),
  ));
  static final notifAndMessagePage = SibRoute("NotifAndMessagePage", HomePage, (ctx) => MainFrame(
    body: HomeNotifAndMessagePage().inBlocProvider<NotifBloc>((ctx) => BlocDi.notifBloc),
  ));

  static final motherDataPage = SibRoute("MotherDataPage", MotherDataPage, (ctx) => MainFrame(
    body: MotherDataPage().inBlocProvider<MotherFormBloc>((ctx) => BlocDi.motherFormBloc),
    padding: EdgeInsets.all(20),
  ));
  static final fatherDataPage = SibRoute("FatherDataPage", FatherDataPage, (ctx) => MainFrame(
    body: FatherDataPage().inBlocProvider<FatherFormBloc>((ctx) => BlocDi.fatherFormBloc),
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
    body: ChildrenCountPage().inBlocProvider<ChildFormBloc>((ctx) => BlocDi.childFormBloc),
    padding: EdgeInsets.all(20),
  ));

  static final pregnancyHomePage = SibRoute("", KehamilankuHomePage, (ctx) => MainFrame(
    body: KehamilankuHomePage().inBlocProvider<PregnancyHomeBloc>((ctx) => BlocDi.pregnancyHomeBloc),
  ));

  static final pregnancyCheckPage = PregnancyCheckPageRoute._();
/*
  static final pregnancyCheckPage = SibRoute("", KehamilankuTrimesterFormPage, (ctx) => MainFrame(
    body: MultiBlocProvider(
      child: KehamilankuTrimesterFormPage(),
      providers: [
        BlocProvider(create: (ctx) => BlocDi.pregnancyHomeBloc,),
        BlocProvider(create: (ctx) => BlocDi.pregnancyCheckFormBloc,),
      ],
    ),//.inBlocProvider<PregnancyHomeBloc>((ctx) => BlocDi.pregnancyHomeBloc),
  ));
 */

  //
/*
  static final pregnancyHomePage = SibRoute("", KehamilankuHomePage, (ctx) => TopBarProfileFrame( //NoAppB
    name: 'Ayu',// arFrame
    desc: "21 tahun",
    image: Container(
      color: Colors.green,
    ),
    actionBtn: Icon(Icons.notifications_none_rounded, size: 30, color: Colors.white,),
    onActionBtnClick: (c) => SibRoutes.notifAndMessagePage.goToPage(c), //showSnackBar(c, "Notifikasi"),
//
    body: Expanded(
      child: Container(
        color: grey_calmer,
        child: KehamilankuHomePage().inBlocProvider<PregnancyHomeBloc>((ctx) => BlocDi.pregnancyHomeBloc),
      ),
    ), //
  ));
*/
}

/// Special designed route with [SibRoute] inside it.
/// The purpose of this class is to force outside library to add [MotherTrimester] as a argument to the page.
class PregnancyCheckPageRoute {
  PregnancyCheckPageRoute._();

  final SibRoute _route = SibRoute("KehamilankuTrimesterFormPage", KehamilankuTrimesterFormPage, (ctx) => MainFrame(
    body: MultiBlocProvider(
      child: KehamilankuTrimesterFormPage(),
      providers: [
        BlocProvider(create: (ctx) => BlocDi.pregnancyHomeBloc,),
        BlocProvider(create: (ctx) => BlocDi.pregnancyCheckFormBloc,),
      ],
    ),//.inBlocProvider<PregnancyHomeBloc>((ctx) => BlocDi.pregnancyHomeBloc),
  ));

  void go(BuildContext context, MotherTrimester data) {
    _route.goToPage(context, args: {Const.KEY_TRIMESTER : data});
  }
}