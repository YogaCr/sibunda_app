
import 'package:common/res/themes/themes.dart';
import 'package:common/ui/pages/sign_up_page.dart';
import 'package:common/ui/widget/basic_widgets.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:common/util/functions/nav_ext.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/ui/pages/frames.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  State createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailTextController = TextEditingController();
  final pswdTextController = TextEditingController();

  var isEmailValid = false;
  var isPswdValid = false;
  var isInit = false;
  bool get canProceed => isEmailValid && isPswdValid;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Images.getDir("logo_app_color.png"),
              color: pink_300,
              width: 100,
              height: 100,
            ),
            Text(
              "Selamat Datang Bunda!",
              style: SibTextStyles.header1,
            ).withMargin(EdgeInsets.only(top: 60)),
          ],
        )
      ),
      TxtInput(
        label: "Email",
        textController: emailTextController,
        onChanged: (txt) => setState(() {
          isEmailValid = EmailValidator.validate(txt);
        }),
        errorText: isEmailValid ? null : "Mohon masukan email yang benar.",
      ).withMargin(EdgeInsets.only(top: 70)),
      TxtInput(
        label: "Password",
        textController: pswdTextController,
        onChanged: (txt) => setState(() {
          isPswdValid = txt.length >= 8;
        }),
        errorText: isPswdValid ? null : "Panjang password minimal 8 karakter.",
      ).withMargin(EdgeInsets.only(top: 20)),
      FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_rounded,
        ),
        backgroundColor: canProceed ? pink_300 : grey,
        onPressed: () {
          if(canProceed){
            showSnackBar(context, "Ntab bro", backgroundColor: Colors.green);
          } else {
            showSnackBar(context, "Ada yg salah bro");
          }
        }
      ).withMargin(EdgeInsets.only(top: 30)),
      Text(
        "Bunda belum punya akun?",
        style: SibTextStyles.regular_grey,
      ).withMargin(EdgeInsets.only(top: 30)),
      TxtLink(
        "Daftar Disini Yuk",
        onTap: () => goToPage(context, (ctx) => SignUpPage().framedWithPlainBack(
          padding: EdgeInsets.all(20),
          //onTap: () => showSnackBar(context, "halo Bro back"),
        )),
      ).withMargin(EdgeInsets.only(top: 10)),
    ],
  );
}