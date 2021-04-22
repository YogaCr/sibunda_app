
import 'package:common/ui/pages/frames.dart';
import 'package:common/ui/pages/home_page.dart';
import 'package:common/ui/pages/sign_in_page.dart';
import 'package:common/ui/pages/sign_up_page.dart';
import 'package:common/ui/pages/splash_page.dart';
import 'package:common/util/functions/nav_ext.dart' as NavExt;
import 'package:flutter/cupertino.dart';

class Routes {
  Routes._();

  static final splashPage = Route("SplashPage", SplashPage, (ctx) => NoAppBarFrame(
    body: SplashPage(),
    padding: EdgeInsets.all(20),
  ));
  static final signInPage = Route("SignInPage", SignInPage, (ctx) => PlainBackFrame(
    body: SignInPage(),
    padding: EdgeInsets.all(20),
  ));
  static final signUpPage = Route("SignUpPage", SignUpPage, (ctx) => PlainBackFrame(
    body: SignUpPage(),
    padding: EdgeInsets.all(20),
  ));
  static final homePage = Route("HomePage", HomePage, (ctx) => MainFrame(
    body: HomePage(),
    padding: EdgeInsets.all(20),
  ));
}


class Route {
  final String name;
  final Type klass;
  final Widget Function(BuildContext) builder;
  const Route(this.name, this.klass, this.builder);

  void goToPage(BuildContext context, {bool clearPrevs = false,}){
    NavExt.goToPage(context, builder, clearPrevs: clearPrevs);
  }
}