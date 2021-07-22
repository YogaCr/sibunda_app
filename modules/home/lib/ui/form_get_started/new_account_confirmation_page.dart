import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/img_pick.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/get_started_form_main_vm.dart';


class NewAccountConfirmPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imgSize = screenSize.width /2;

    final vm = ViewModelProvider.of<GetStartedFormMainVm>(context)
      ..onSubmit.observeForever((success) {
        if(success != true) {
          showSnackBar(context, Strings.form_submission_fail);
        }
      })
      ..onLogin.observeForever((success) {
        if(success == true) {
          HomeRoutes.homePage.goToPage(context);
          showSnackBar(context, Strings.welcome_mother, backgroundColor: Colors.green);
        } else {
          showSnackBar(context, Strings.form_submission_fail);
        }
      });

    final nameLiveData = MutableLiveData<String>();
    vm.signUpFormVm.isFormReady.observeForever((isFormReady) {
      if(isFormReady == true) {
        nameLiveData.value = vm.signUpFormVm.responseGroupList.first[Const.KEY_NAME]?.response.value;
      }
    });
    if(vm.signUpFormVm.isFormReady.value == true) {
      nameLiveData.value = vm.signUpFormVm.responseGroupList.first[Const.KEY_NAME]?.response.value;
    }

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            Strings.confirm_new_account,
            style: SibTextStyles.header1,
          ).withMargin(EdgeInsets.only(top: 60)),
        ),
        //ImgPick().withMargin(EdgeInsets.only(top: 10)),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: SibImages.resolve(
                  dummyImg_profile,
                  width: imgSize,
                  height: imgSize,
                ),
              ),
              Text(
                Strings.welcome_mother,
                style: SibTextStyles.header1.copyWith(
                    fontWeight: FontWeight.normal,
                ),
              ).withMargin(EdgeInsets.only(top: 15)),
              LiveDataObserver<String>(
                liveData: nameLiveData,
                builder: (ctx, name) => Text(
                  name ?? "<null>",
                  style: SibTextStyles.header1,
                ).withMargin(EdgeInsets.only(top: 10)),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TxtBtn(
            Strings.make_new_mother_account,
            color: green_calm,
            onTap: () => vm.sendData(),
          ),
        ).withMargin(EdgeInsets.only(bottom: 55)),
      ],
    ); //.insideScroll();
  }
}