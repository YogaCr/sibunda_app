import 'package:common/config/routes.dart';
import 'package:common/ui/page/frames.dart';
import 'package:flutter/material.dart';
import 'package:sibunda_app/ui/page/_page.dart';
import 'package:common/bloc/bloc_extension.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:common/config/data.dart';

class SibRoutes {
  SibRoutes._();

  static final splashPage = SibRoute("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage(),
    padding: EdgeInsets.all(20),
  ));
  static final signInPage = SibRoute("SignInPage", SignInPage, (ctx) => PlainBackFrame(
    body: SignInPage().inBlocProvider<LoginFormBloc>((ctx) => LoginFormBloc(DataConfig.defaultAuthRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final signUpPage = SibRoute("SignUpPage", SignUpPage, (ctx) => PlainBackFrame(
    body: SignUpPage().inBlocProvider<SignUpFormBloc>((ctx) => SignUpFormBloc(DataConfig.defaultAuthRepo)),
    padding: EdgeInsets.all(20),
  ));
  static final homePage = SibRoute("HomePage", HomePage, (ctx) => MainFrame(
    body: HomePage(),
    padding: EdgeInsets.all(20),
  ));
}