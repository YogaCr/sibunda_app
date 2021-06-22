import 'package:common/arch/ui/widget/form_generic_vm_observer.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/ui.dart';
import 'package:flutter/material.dart';

import 'baby_check_form_vm.dart';

class BabyCheckFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FormGenericVmObserver<BabyCheckFormVm>(
      onSubmit: (success) => success
          ? showSnackBar(context, "Sukses",backgroundColor: Colors.green)
          : showSnackBar(context, "Gagal"),
      submitBtnBuilder: (ctx, canProceed) => Container(
        padding: EdgeInsets.all(10),
        color: canProceed == true ? Manifest.theme.colorPrimary : Colors.grey,
        child: Text("submit"),
      ),
    );
  }
}