
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/bloc/form_bloc.dart';
import 'package:common/ui/widget/bloc/BlocFormBuilder.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/config/routes.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:email_validator/email_validator.dart' as DartEmailValidator;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/res/string/_string.dart';




//TODO 22 May 2021: Terapkan pattern provider atau BLOC
class SignUpPage extends StatelessWidget {
/*
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
 */

  @override
  Widget build(BuildContext context) {
    SignUpFormBloc bloc = BlocProvider.of<SignUpFormBloc>(context);
    return Column(
      children: [
        Text(
          "Buat Akun Baru Bunda",
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(imgUrl: "ic_profile.png")
            .withMargin(EdgeInsets.only(top: 10)),
        BlocFormBuilder<SignUpFormBloc>(
          builders: [
            (context, formState) => TxtInput(
              label: "Nama",
              textController: bloc.nameTextController,
              textValidator: (txt) => bloc.isNameValid = txt.isNotEmpty,
              errorText: "Mohon masukan nama Anda.",
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_NAME] != null,
            ),
            //Spacer(),
            (context, formState) => TxtInput(
              label: "Email",
              textController: bloc.emailTextController,
              textValidator: (txt) => bloc.isEmailValid = bloc.isEmailAvailable && DartEmailValidator.EmailValidator.validate(txt),
              errorTextGenerator: () => bloc.isEmailValid
                  ? null : bloc.isEmailAvailable
                  ? "Mohon masukan email yang benar." : "Email sudah ada.",
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_EMAIL] != null,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState) => TxtInput(
              label: "Password",
              isTypePassword: true,
              textController: bloc.pswdTextController,
              textValidator: (txt) => bloc.isPswdValid = txt.length >= 8,
              errorText: "Panjang password minimal 8 karakter.",
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_PSWD] != null,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState) => TxtInput(
              label: "Konfirmasi Password",
              isTypePassword: true,
              textController: bloc.rePswdTextController,
              textValidator: (txt) => bloc.isRePswdValid = txt == bloc.pswdTextController.text,
              errorText: "Password konfirmasi tidak sama.",
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_RE_PSWD] != null,
            ).withMargin(EdgeInsets.only(top: 20)),
          ],
        ).withMargin(EdgeInsets.only(top: 30)),
        BlocBuilder(
          builder: (ctx, formState) {
            if(formState is OnSuccessEndForm) {
              SibRoutes.homePage.goToPage(context, clearPrevs: true);
            } else {
              String? errorMsg;
              if(formState is OnInvalidForm) {
                errorMsg = formState.additionalData?.toString();
              } else if(formState is OnErrorSubmission) {
                errorMsg = "code= ${formState.failure?.code} message= ${formState.failure?.message}";
              }
              if(errorMsg != null)
                showSnackBar(context, errorMsg);
            }
            return FloatingActionButton(
                child: Icon(
                  Icons.arrow_forward_rounded,
                ),
                backgroundColor: bloc.canProceed ? pink_300 : grey,
                onPressed: () async {
                  if(bloc.canProceed) {
                    bloc.submitForm();
                  } else {
                    showSnackBar(context, Strings.please_check_the_wrong_field);
                  }
/*
                  if(bloc.canProceed){
                    final response = await AuthService.signUp(nameTextController.text, emailTextController.text, pswdTextController.text);
                    var errorMsg = "Ada error bro!";
                    if(response.statusCode == 200){
                      final response2 = await AuthService.login(emailTextController.text, pswdTextController.text);
                      if(response2.statusCode == 200){
                        SibRoutes.homePage.goToPage(context, clearPrevs: true);
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
 */
                }
            ).withMargin(EdgeInsets.only(top: 30));
          }),
      ],
    ); //.insideScroll();
  }
}