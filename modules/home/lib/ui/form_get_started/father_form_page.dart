
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';

class FatherFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.fill_father_data,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(imgUrl: "ic_profile.png")
            .withMargin(EdgeInsets.only(top: 10)),
        FormVmGroupObserver<FatherFormVm>(
          showHeader: false,
          onSubmit: (ctx, success) => success
              ? HomeRoutes.doMotherHavePregnancyPage.goToPage(context)
              : showSnackBar(ctx, "Terjadi kesalahan"),
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            child: Icon(Icons.arrow_forward_rounded,),
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: canProceed == true ? null : () => showSnackBar(context, "Masih ada yg blum valid",),
          ),
        ),
      ],
    ).insideScroll();
  }
}
