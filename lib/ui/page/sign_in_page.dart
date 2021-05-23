
import 'package:common/bloc/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/config/routes.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:sibunda_app/ui/page/sign_up_page.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:common/util/functions/nav_ext.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/ui/page/frames.dart';
import 'package:common/ui/widget/bloc/BlocFormBuilder.dart';
import 'package:common/res/string/_string.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
/*
  final emailTextController = TextEditingController();
  final pswdTextController = TextEditingController();

  var isEmailValid = false;
  var isPswdValid = false;
  var isInit = false;
  bool get canProceed => isEmailValid && isPswdValid;
 */

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginFormBloc>(context);
    return Column(
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
        BlocFormBuilder<LoginFormBloc>(
          builders: [
            (ctx, formState) => TxtInput(
              label: "Email",
              textController: bloc.emailTextController,
              textValidator: (txt) => bloc.isEmailValid = EmailValidator.validate(txt),
              errorText: "Mohon masukan email yang benar.",
            ).withMargin(EdgeInsets.only(top: 70)),
            (ctx, formState) => TxtInput(
              label: "Password",
              isTypePassword: true,
              textController: bloc.pswdTextController,
              textValidator: (txt) => bloc.isPswdValid = txt.length >= 8,
              errorText: "Panjang password minimal 8 karakter.",
            ).withMargin(EdgeInsets.only(top: 20)),
          ],
        ),
        BlocBuilder(
          builder: (ctx, formState) {
            if(formState is OnSuccessEndForm) {
              SibRoutes.homePage.goToPage(context, clearPrevs: true);
            } else if (formState is OnErrorSubmission) {
              showSnackBar(context, Strings.wrong_email_or_password);
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
                  if(canProceed){
                    final response = await AuthService.login(emailTextController.text, pswdTextController.text);
                    if(response.statusCode == 200){
                      SibRoutes.homePage.goToPage(context, clearPrevs: true);
                    } else {
                      showSnackBar(context, "Email atau password tidak sesuai \n${response.message}");
                    }
                    //showSnackBar(context, "Ntab bro", backgroundColor: Colors.green);
                  } else {
                  }
 */
                }
            ).withMargin(EdgeInsets.only(top: 30));
          }
        ),
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
    );//.insideScroll();
  }
}