
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/arch/ui/widget/txt_link.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/ui.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/res/string/_string.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/login/login_vm.dart';

class LoginPage extends StatelessWidget {
  final errorMsgController = MutableLiveData<String>();

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
          onSubmit: (ctx, success) {
            if(success) {
              errorMsgController.value = null;
              HomeRoutes.homePage.goToPage(context, clearPrevs: true,);
            } else {
              showSnackBar(ctx, "Terjadi kesalahan");
            }
          },
          onFailSubmitBtnBuilder: (ctx, key, fail, btn) {
            prinw("LoginPage onFailSubmitBtnBuilder: key= $key fail= $fail");
            if(fail.code == 400) {
              errorMsgController.value = Strings.invalid_email_or_pswd;
              showToast(
                msg: Strings.invalid_email_or_pswd,
                len: Toast.LENGTH_LONG,
                bgColor: red,
              );
            }
            return btn;
          },
          submitBtnBuilder: (ctx, canProceed) {
            if(canProceed == true) {
              errorMsgController.value = null;
            }
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10,),
              child: FloatingActionButton(
                backgroundColor: canProceed == true ? pink_300 : grey,
                child: Icon(
                  Icons.arrow_forward_rounded,
                ),
                onPressed: canProceed == true ? null : () => showSnackBar(context, "Ada yg blum valid"),
              ),
            );
          },
        ),
        LiveDataObserver<String>(
          liveData: errorMsgController,
          isLiveDataOwner: true,
          builder: (ctx, msg) => msg?.isNotEmpty == true ? Container(
            margin: EdgeInsets.all(10),
            child: Text(
              msg!,
              style: SibTextStyles.size_0.copyWith(color: red),
            ),
          ) : defaultEmptyWidget(),
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