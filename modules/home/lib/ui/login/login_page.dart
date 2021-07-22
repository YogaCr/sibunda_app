
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60,),
                  child: SibImages.get(
                    "logo_app_color.png",
                    package: "common",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain
                  ),
                ),
                Text(
                  Strings.welcome_mother,
                  style: SibTextStyles.header1,
                ).withMargin(EdgeInsets.only(top: 60)),
              ],
            )
        ),
        FormVmGroupObserver<LoginFormVm>(
          showHeader: false,
          onSubmit: (ctx, success) => success
              ? HomeRoutes.homePage.goToPage(context, clearPrevs: true,)
              : showSnackBar(ctx, "Terjadi kesalahan"),
          submitBtnBuilder: (ctx, canProceed) => Container(
            margin: EdgeInsets.symmetric(vertical: 10,),
            child: FloatingActionButton(
              backgroundColor: canProceed == true ? pink_300 : grey,
              child: Icon(
                Icons.arrow_forward_rounded,
              ),
              onPressed: canProceed == true ? null : () => showSnackBar(context, "Ada yg blum valid"),
            ),
          ),
        ),
        Text(
          Strings.not_have_account,
          style: SibTextStyles.regular_grey,
        ).withMargin(EdgeInsets.only(top: 30)),
        TxtLink(
          Strings.register_here,
          onTap: () => HomeRoutes.getStartedFormMainPage.goToPage(context), //HomeRoutes.signUpPage.goToPage(context),
        ).withMargin(EdgeInsets.only(top: 10)),
      ],
    ).insideScroll();
  }
}