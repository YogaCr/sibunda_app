import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/times.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/config/kehamilanku_keys.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_vm.dart';

class PregnancyImmunizationPopupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<PregnancyImmunizationPopupVm>(context)
      ..init();

    return SingleChildScrollView(
      child: FormVmGroupObserver<PregnancyImmunizationPopupVm>(
        vm: vm,
        onPreSubmit: (ctx, canProceed) {
          if(canProceed != true) {
            showSnackBar(ctx, "Terdapat beberapa isian yang belum valid");
          }
        },
        onSubmit: (ctx, success) async {
          if(success) {
            await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
              content: PopupSuccess(
                msg: "Data Imunisasi Bunda berhasil disimpan",
                actionMsg: "Kembali ke menu",
                onActionClick: () => Navigator.pop(context), //() => backPage(context, backStep: 2),
              ),
            )); //showSnackBar(ctx, "Berhasil bro", backgroundColor: Colors.green)
            //final dateStr = syncFormatTime(vm.date.value!);
            final dateStr = vm.date.value!.toString();
            KehamilankuRoutes.immunizationPopup.backPage(ctx, dateStr);
            //showSnackBar(ctx, "Berhasil mengonfirmasi");
          } else {
            showSnackBar(ctx, "Terjadi kesalahan saat mengonfirmasi");
          }
        },
        submitBtnBuilder: (ctx, canProceed) => TxtBtn(
          "Konfirmasi Imunisasi",
          key: KehamilankuKeys.home_btnImmunizationSubmission,
          color: canProceed == true ? Manifest.theme.colorPrimary : grey,
        ),
      ),
    );
  }
}