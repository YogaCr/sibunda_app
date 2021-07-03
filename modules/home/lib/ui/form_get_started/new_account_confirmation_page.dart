import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/img_pick.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/get_started_form_main_vm.dart';


class NewAccountConfirmPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<GetStartedFormMainVm>(context);
    vm.onSubmit.observeForever((success) {
      if(success == true) {
        HomeRoutes.homePage.goToPage(context);
        showSnackBar(context, Strings.welcome_mother, backgroundColor: Colors.green);
      } else {
        showSnackBar(context, Strings.form_submission_fail);
      }
    });
    return Column(
      children: [
        Text(
          Strings.confirm_new_account,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick().withMargin(EdgeInsets.only(top: 10)),
        TxtBtn(
          Strings.make_new_mother_account,
          color: green_calm,
          onTap: () => vm.sendData(),
        ),
      ],
    ).insideScroll();
  }
}