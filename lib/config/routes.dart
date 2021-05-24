import 'package:common/config/routes.dart';
import 'package:common/ui/page/frames.dart';
import 'package:flutter/material.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:sibunda_app/ui/page/_page.dart';
import 'package:common/bloc/bloc_extension.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:common/config/data.dart';
import 'package:sibunda_app/ui/page/father_data_page.dart';
import 'package:sibunda_app/ui/page/mother_data_page.dart';

class SibRoutes {
  SibRoutes._();

  static final splashPage = SibRoute("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage(),
    padding: EdgeInsets.all(20),
  ));
  static final signInPage = SibRoute("SignInPage", SignInPage, (ctx) => PlainBackFrame(
    body: SignInPage()
        .inBlocProvider<LoginFormBloc>((ctx) => LoginFormBloc(DataConfig.defaultAuthRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final signUpPage = SibRoute("SignUpPage", SignUpPage, (ctx) => PlainBackFrame(
    body: SignUpPage().inBlocProvider<SignUpFormBloc>((ctx) => SignUpFormBloc(DataConfig.defaultAuthRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final homePage = SibRoute("HomePage", HomePage, (ctx) => MainFrame(
    body: HomePage().inBlocProvider<LogoutFormBloc>((ctx) => LogoutFormBloc(DataConfig.defaultAuthRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final motherDataPage = SibRoute("MotherDataPage", HomePage, (ctx) => MainFrame(
    body: MotherDataPage().inBlocProvider<MotherFormBloc>((ctx) => MotherFormBloc(DataConfig.defaultFamilyRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final fatherDataPage = SibRoute("FatherDataPage", HomePage, (ctx) => MainFrame(
    body: FatherDataPage().inBlocProvider<FatherFormBloc>((ctx) => FatherFormBloc(DataConfig.defaultFamilyRepo)),
    padding: EdgeInsets.all(20),
  ));
}