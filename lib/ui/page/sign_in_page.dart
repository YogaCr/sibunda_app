
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
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:provider/src/provider.dart';

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
                SibImages.get(
                  "logo_app_color.png",
                  package: "common",
                  width: 100,
                  height: 100,
                ),
/*
                Image.asset(
                  SibImages.getDir("logo_app_color.png", packa),
                  color: pink_300,
                  width: 100,
                  height: 100,
                ),
 */
                Text(
                  Strings.welcome_mother,
                  style: SibTextStyles.header1,
                ).withMargin(EdgeInsets.only(top: 60)),
              ],
            )
        ),
        BlocFormBuilder<LoginFormBloc>(
          builders: [
            (ctx, formState, i) => TxtInput(
              label: Strings.email,
              textController: bloc.emailTextController,
              textValidator: (txt) => bloc.isEmailValid.value = EmailValidator.validate(txt),
              errorText: Strings.please_type_correct_email,
            ).withMargin(EdgeInsets.only(top: 70)),
            (ctx, formState, i) => TxtInput(
              label: Strings.password,
              isTypePassword: true,
              textController: bloc.pswdTextController,
              textValidator: (txt) => bloc.isPswdValid.value = txt.length >= 8,
              errorText: Strings.password_at_least_8,
            ).withMargin(EdgeInsets.only(top: 20)),
          ],
        ),
        BlocBuilder<LoginFormBloc, BlocFormState>(
          builder: (ctx, formState) {
            if(formState is OnSuccessEndForm) {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) =>
                  SibRoutes.homePage.goToPage(context, clearPrevs: true));
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
          Strings.not_have_account,
          style: SibTextStyles.regular_grey,
        ).withMargin(EdgeInsets.only(top: 30)),
        TxtLink(
          Strings.register_here,
          onTap: () => SibRoutes.signUpPage.goToPage(context),
/*
          onTap: () => goToPage(context, (ctx) => SignUpPage().framedWithPlainBack(
            padding: EdgeInsets.all(20),
            //onTap: () => showSnackBar(context, "halo Bro back"),
          )),
 */
        ).withMargin(EdgeInsets.only(top: 10)),
      ],
    ).insideScroll();
  }
}