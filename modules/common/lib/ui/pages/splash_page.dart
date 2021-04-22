
import 'package:common/res/themes/themes.dart';
import 'package:common/ui/pages/sign_in_page.dart';
import 'package:common/ui/widget/basic_widgets.dart';
import 'package:common/util/functions/nav_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/material.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'frames.dart';

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
        onTap: () => goToPage(context, (ctx) {
          //showSnackBar(context, "Kuy login");
          return SignInPage().framed(padding: EdgeInsets.all(20));
        }),
      ).withMargin(EdgeInsets.only(top: 50)),
      Text(
        "Bunda belum punya akun?",
        style: SibTextStyles.regular_grey,
        textAlign: TextAlign.center,
      ).withMargin(EdgeInsets.only(top: 20)),
      TxtLink(
        "Daftar Disini Yuk",
        onTap: () => showSnackBar(context, "Masuk bro", backgroundColor: Colors.green),
      ).withMargin(EdgeInsets.only(top: 5)),
    ],
  );
}
