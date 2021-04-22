
import 'package:common/res/themes/themes.dart';
import 'package:common/ui/widget/basic_widgets.dart';
import 'package:common/ui/widget/intermediate_widgets.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final pswdTextController = TextEditingController();
  final rePswdTextController = TextEditingController();

  var isNameValid = false;
  var isEmailValid = false;
  var isPswdValid = false;
  var isRePswdValid = false;
  var isInit = false;
  bool get canProceed => isNameValid && isEmailValid && isPswdValid &&isRePswdValid;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        "Buat Akun Baru Bunda",
        style: SibTextStyles.header1,
      ).withMargin(EdgeInsets.only(top: 60)),
      ImgPick(imgUrl: "ic_profile.png")
       .withMargin(EdgeInsets.only(top: 10)),
      Column(
        children: [
          TxtInput(
            label: "Nama",
            textController: nameTextController,
            onChanged: (txt) => setState(() {
              isNameValid = txt.isNotEmpty;
            }),
            errorText: isNameValid ? null : "Mohon masukan nama Anda.",
          ),
          //Spacer(),
          TxtInput(
            label: "Email",
            textController: emailTextController,
            onChanged: (txt) => setState(() {
              isEmailValid = EmailValidator.validate(txt);
            }),
            errorText: isEmailValid ? null : "Mohon masukan email yang benar.",
          ).withMargin(EdgeInsets.only(top: 20)),
          //Spacer(),
          TxtInput(
            label: "Password",
            textController: pswdTextController,
            onChanged: (txt) => setState(() {
              isPswdValid = txt.length >= 8;
            }),
            errorText: isPswdValid ? null : "Panjang password minimal 8 karakter.",
          ).withMargin(EdgeInsets.only(top: 20)),
          //Spacer(),
          TxtInput(
            label: "Konfirmasi Password",
            textController: rePswdTextController,
            onChanged: (txt) => setState(() {
              isRePswdValid = txt == pswdTextController.text;
            }),
            errorText: isRePswdValid ? null : "Password konfirmasi tidak sama.",
          ).withMargin(EdgeInsets.only(top: 20)),
        ],
      ).withMargin(EdgeInsets.only(top: 30)),
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
    ],
  ).insideScroll();
}