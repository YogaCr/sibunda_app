
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/arch/ui/widget/picker_icon_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';

class FatherFormPage extends StatelessWidget {
  final PageController? pageControll;
  final FormGroupInterceptor? interceptor;

  FatherFormPage({
    this.pageControll,
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.fill_father_data,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick().withMargin(EdgeInsets.only(top: 10)),
        FormVmGroupObserver<FatherFormVm>(
          showHeader: false,
          interceptor: interceptor,
          pickerIconBuilder: (group, key, data) {
            if(group == 0) {
              switch(key) {
                case Const.KEY_BIRTH_PLACE:
                  return CityPickerIcon(
                    onItemSelected: (city) async {
                      data.value = city;
                    },
                  );
              }
            }
          },
          onSubmit: (ctx, success) {
            if(success) {
              if(pageControll != null) {
                pageControll!.jumpToPage(pageControll!.page!.toInt() +1);
              } else {
                HomeRoutes.doMotherHavePregnancyPage.goToPage(context);
              }
            } else {
              showSnackBar(ctx, "Terjadi kesalahan");
            }
          },
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            child: Icon(Icons.arrow_forward_rounded,),
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: null, //canProceed == true ? null : () => showSnackBar(context, "Masih ada yg blum valid",),
          ),
        ),
      ],
    ).insideScroll();
  }
}
