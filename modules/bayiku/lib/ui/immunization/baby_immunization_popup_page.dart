import 'package:bayiku/config/baby_routes.dart';
import 'package:common/arch/ui/model/immunization_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/times.dart';
import 'package:common/util/type_util.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'baby_immunization_popup_vm.dart';

class BabyImmunizationPopupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<BabyImmunizationPopupVm>(context)
      ..init();

    return SingleChildScrollView(
      child: FormVmGroupObserver<BabyImmunizationPopupVm>(
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
                msg: "Data Imunisasi Bayi berhasil disimpan",
                actionMsg: "Kembali ke menu",
                onActionClick: () => Navigator.pop(context), //() => backPage(context, backStep: 2),
              ),
            ));

            final date = vm.responseGroupList[0][Const.KEY_IMMUNIZATION_DATE]!.response.value! as DateTime;
            final noBatch = vm.responseGroupList[0][Const.KEY_NO_BATCH]!.response.value.toString();

            final res = BabyImmunizationPopupResult(
              date: syncFormatTime(date),
              noBatch: noBatch,
            );
            BabyRoutes.immunizationPopup.backPage(ctx, res);
            showSnackBar(ctx, "Berhasil mengonfirmasi");
          } else {
            showSnackBar(ctx, "Terjadi kesalahan saat mengonfirmasi");
          }
        },
        submitBtnBuilder: (ctx, canProceed) => TxtBtn(
          "Konfirmasi Imunisasi",
          color: canProceed == true ? Manifest.theme.colorPrimary : grey,
        ),
      ),
    );
  }
}