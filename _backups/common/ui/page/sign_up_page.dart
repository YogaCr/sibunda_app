
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
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
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
          Strings.make_new_mother_account,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(imgUrl: "ic_profile.png", package: "common",)
            .withMargin(EdgeInsets.only(top: 10)),
        BlocFormBuilder<SignUpFormBloc>(
          builders: [
            (context, formState, i) => TxtInput(
              label: Strings.name,
              textController: bloc.nameTextController,
              textValidator: (txt) => bloc.isNameValid.value = txt.isNotEmpty,
              errorText: Strings.please_enter_your_name,
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_NAME] != null,
            ),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.email,
              textController: bloc.emailTextController,
              textValidator: (txt) => bloc.isEmailValid.value = bloc.isEmailAvailable.value && EmailValidator.validate(txt),
              errorTextGenerator: () => bloc.isEmailValid.value
                  ? null : bloc.isEmailAvailable.value
                  ? Strings.please_type_correct_email : Strings.email_has_already_registered,
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_EMAIL] != null,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.password,
              isTypePassword: true,
              textController: bloc.pswdTextController,
              textValidator: (txt) => bloc.isPswdValid.value = txt.length >= 8,
              errorText: Strings.password_at_least_8,
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_PSWD] != null,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.password_re,
              isTypePassword: true,
              textController: bloc.rePswdTextController,
              textValidator: (txt) => bloc.isRePswdValid.value,
              errorText: Strings.password_re_does_not_match,
              initIsTxtValid: formState is! OnInvalidForm || formState.errorMap[Const.KEY_RE_PSWD] != null,
            ).withMargin(EdgeInsets.only(top: 20)),
          ],
        ).withMargin(EdgeInsets.only(top: 30)),
        BlocBuilder<SignUpFormBloc, BlocFormState>(
          builder: (ctx, formState) {
            if(formState is OnSuccessEndForm) {
              SibRoutes.motherDataPage.goToPage(context);
/*
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) =>
                  SibRoutes.homePage.goToPage(ctx, clearPrevs: true));
 */
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
    ).insideScroll();
  }
}