import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_vm.dart';

//TODO: PregnancyImmunizationPopupPage: taruh ke route.
class PregnancyImmunizationPopupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<PregnancyImmunizationPopupVm>(context)
      ..init();

    return FormVmGroupObserver<PregnancyImmunizationPopupVm>(
      vm: vm,
      onPreSubmit: (ctx, canProceed) {
        if(canProceed != true) {
          showSnackBar(ctx, "Terdapat beberapa isian yang belum valid");
        }
      },
      onSubmit: (ctx, success) => success
          ? backPage(ctx)
          : showSnackBar(ctx, "Terjadi kesalahan saat mengonfirmasi"),
      submitBtnBuilder: (ctx, canProceed) => TxtBtn(
        "Konfirmasi Imunisasi",
        color: canProceed == true ? Manifest.theme.colorPrimary : grey,
      ),
    );
  }
}