
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/ui.dart';
import 'package:common/arch/ui/widget/img_pick.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/signup/sign_up_vm.dart';

import 'sign_up_vm.dart';


class SignUpPage extends StatelessWidget {
  final PageController? pageControll;
  final FormGroupInterceptor? interceptor;

  SignUpPage({
    this.pageControll,
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<SignUpFormVm>(context);
    return Column(
      children: [
        Text(
          Strings.make_new_mother_account,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        LiveDataObserver<ImgData>(
          liveData: vm.imgProfile,
          builder: (ctx, img) => ImgPick(
            pic: img,
            onImgPick: (file) => vm.imgProfile.value = file != null
                ? ImgData.fromXFile(file) : null,
          ),
        ).withMargin(EdgeInsets.only(top: 10, bottom: 20,)),
        FormVmGroupObserver<SignUpFormVm>(
          showHeader: false,
          vm: vm,
          interceptor: interceptor,
          pickerIconBuilder: (group, key, liveData) {
            if(key == Const.KEY_EMAIL) {
              return LiveDataObserver<bool>(
                liveData: vm.isEmailAvailable,
                builder: (ctx, available) {
                  if(available == null) return defaultLoading(showText: false);
                  return defaultEmptyWidget();
                },
              );
            }
          },
          onSubmit: (ctx, success) {
            if(success) {
              if(pageControll != null) {
                pageControll!.animateToPage(
                  pageControll!.page!.toInt() +1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              } else {
                HomeRoutes.motherFormPage.go(context: context);
              }
            } else {
              showSnackBar(context, "Gagal", backgroundColor: Colors.red);
            }
          },
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: null,
            child: Icon(Icons.arrow_forward_rounded),
          ),
        ),
      ],
    ).insideScroll();
  }
}