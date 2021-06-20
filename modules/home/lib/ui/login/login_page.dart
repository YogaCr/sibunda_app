
import 'package:common/arch/ui/widget/form_bloc_observer.dart';
import 'package:common/arch/ui/widget/txt_link.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/ui.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/res/string/_string.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/login/login_vm.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                Text(
                  Strings.welcome_mother,
                  style: SibTextStyles.header1,
                ).withMargin(EdgeInsets.only(top: 60)),
              ],
            )
        ),
        FormVmObserver<LoginFormVm>(
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            backgroundColor: canProceed == true ? pink_300 : grey,
            child: Icon(
              Icons.arrow_forward_rounded,
            ),
            onPressed: canProceed == true ? null : () => showSnackBar(context, "Ada yg blum valid"),
          ),
        ),
        Text(
          Strings.not_have_account,
          style: SibTextStyles.regular_grey,
        ).withMargin(EdgeInsets.only(top: 30)),
        TxtLink(
          Strings.register_here,
          onTap: () => HomeRoutes.signUpPage.goToPage(context),
        ).withMargin(EdgeInsets.only(top: 10)),
      ],
    ).insideScroll();
  }
}