
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/ui.dart';
import 'package:common/arch/ui/widget/img_pick.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/signup/sign_up_vm.dart';

import 'sign_up_vm.dart';


class SignUpPage extends StatelessWidget {
  final PageController? pageControll;
  SignUpPage({ this.pageControll });

  @override
  Widget build(BuildContext context) {
    //final bloc = ViewModelProvider.of<SignUpFormBloc>(context);
    //final vm = ViewModelProvider.of<SignUpFormVm>(context);
    return Column(
      children: [
        Text(
          Strings.make_new_mother_account,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(placeholderImg: dummyImg_profile,)
            .withMargin(EdgeInsets.only(top: 10, bottom: 20,)),
        FormVmGroupObserver<SignUpFormVm>(
          onSubmit: (ctx, success) {
            if(success) {
              if(pageControll != null) {
                pageControll!.jumpToPage(pageControll!.page!.toInt() +1);
              } else {
                HomeRoutes.motherFormPage.goToPage(context);
              }
            } else {
              showSnackBar(context, "Gagal", backgroundColor: Colors.red);
            }
          },
          preSubmitBtnBuilder: (ctx, key) => Container(
            padding: EdgeInsets.all(10),
            color: Colors.yellow,
            child: Text("Sending..."),
          ),
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: null, //canProceed == true ? null : () => showSnackBar(context, "Ada yg blum valid",),
            child: Icon(Icons.arrow_forward_rounded),
          ),
        ),
      ],
    ).insideScroll();
  }
}