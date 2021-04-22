
import 'package:common/configs/routes.dart';
import 'package:common/res/themes/themes.dart';
import 'package:common/ui/widget/basic_widgets.dart';
import 'package:common/ui/widget/intermediate_widgets.dart';
import 'package:common/util/auth.dart';
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

  String? existingPrevEmail;

  var isNameValid = false;
  var isEmailValid = false;
  var isEmailAvailable = true;
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
              isEmailAvailable = txt != existingPrevEmail;
              isEmailValid = isEmailAvailable && EmailValidator.validate(txt);
            }),
            errorText: isEmailValid
                ? null
                : isEmailAvailable
                  ? "Mohon masukan email yang benar."
                  : "Email sudah ada.",
          ).withMargin(EdgeInsets.only(top: 20)),
          //Spacer(),
          TxtInput(
            label: "Password",
            isTypePassword: true,
            textController: pswdTextController,
            onChanged: (txt) => setState(() {
              isPswdValid = txt.length >= 8;
            }),
            errorText: isPswdValid ? null : "Panjang password minimal 8 karakter.",
          ).withMargin(EdgeInsets.only(top: 20)),
          //Spacer(),
          TxtInput(
            label: "Konfirmasi Password",
            isTypePassword: true,
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
          onPressed: () async {
            if(canProceed){
              final response = await AuthService.signUp(nameTextController.text, emailTextController.text, pswdTextController.text);
              var errorMsg = "Ada error bro!";
              if(response.statusCode == 200){
                final response2 = await AuthService.login(emailTextController.text, pswdTextController.text);
                if(response2.statusCode == 200){
                  Routes.homePage.goToPage(context, clearPrevs: true);
                  return;
                } else {
                  errorMsg = "$errorMsg \nDi login, msg= ${response2.message}";
                }
              } else {
                if(response.statusCode == 500){
                  final data = response.data.toString();
                  if(data.contains("duplicate key value violates unique constraint")){
                    errorMsg = "Email ${emailTextController.text} sudah ada.";
                    setState(() {
                      isEmailValid = false;
                      isEmailAvailable = false;
                      existingPrevEmail = emailTextController.text;
                    });
                  } else {
                    errorMsg = "code= ${response.statusCode} message= ${response.message}";
                  }
                }
                //errorMsg = "$errorMsg \nDi signup, msg= ${response.message}";
              }
              showSnackBar(context, errorMsg);
            } else {
              showSnackBar(context, "Mohon cek isian yang salah.");
            }
          }
      ).withMargin(EdgeInsets.only(top: 30)),
    ],
  ).insideScroll();
}