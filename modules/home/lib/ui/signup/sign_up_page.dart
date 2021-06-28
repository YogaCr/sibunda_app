
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/ui.dart';
import 'package:common/arch/ui/widget/img_pick.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/signup/sign_up_vm.dart';

import 'sign_up_vm.dart';


class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final bloc = ViewModelProvider.of<SignUpFormBloc>(context);
    return Column(
      children: [
        Text(
          Strings.make_new_mother_account,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(imgUrl: "ic_profile.png", package: "common",)
            .withMargin(EdgeInsets.only(top: 10, bottom: 20,)),
        FormTxtVmObserver<SignUpFormVm>(
          onSubmit: (canProceed) => canProceed
              ? HomeRoutes.motherFormPage.goToPage(context)
              : showSnackBar(context, "Gagal", backgroundColor: Colors.red),
          preSubmitBtnBuilder: (ctx, key) => Container(
            padding: EdgeInsets.all(10),
            color: Colors.yellow,
            child: Text("Sending..."),
          ),
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: canProceed == true ? null : () => showSnackBar(context, "Ada yg blum valid",),
            child: Icon(Icons.arrow_forward_rounded),
          ),
        ),
      ],
    ).insideScroll();
  }
}