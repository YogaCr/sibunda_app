
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:sibunda_app/config/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/material.dart';
import 'package:common/util/functions/ui_ext.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Column(
    //clipBehavior: Clip.none,
    children: [
      Images.get("ilstr_mother_pregnant_process.png", fit: BoxFit.fill)
          .withMargin(EdgeInsets.symmetric(horizontal: 50).copyWith(top: 70)),
      Text(
        "Siap Jadi Asisten Bunda",
        style: SibTextStyles.header1,
      ).withMargin(EdgeInsets.only(top: 50)),
      Text(
        "Dengan aplikasi kami, Bunda akan serasa memiliki asisten untuk merawat buah hati",
        style: SibTextStyles.regular_grey,
        textAlign: TextAlign.center,
      ).withMargin(EdgeInsets.only(top: 30)),
      TxtBtn(
        "Mulai Dari Sekarang",
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTap: () => SibRoutes.signInPage.goToPage(context),
      ).withMargin(EdgeInsets.only(top: 50)),
      Text(
        "Bunda belum punya akun?",
        style: SibTextStyles.regular_grey,
        textAlign: TextAlign.center,
      ).withMargin(EdgeInsets.only(top: 20)),
      TxtLink(
        "Daftar Disini Yuk",
        onTap: () => SibRoutes.signUpPage.goToPage(context),
      ).withMargin(EdgeInsets.only(top: 5)),
    ],
  );
}
