import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'covid_check_baby_vm.dart';

class CovidCheckBabyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<CovidCheckBabyVm>(context)
        ..init();

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Menu Cek Covid-19 Untuk Bayi",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,),
        child: BelowTopBarScrollContentArea([
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,),
                child: ItemPanelWithButton(
                  title: "Jangan lupa jaga kesehatan dan rutin cuci tangan ya Bunda",
                  action: "",
                  img: dummyImg,
                ),
              ),
              FormVmGroupObserver<CovidCheckBabyVm>(
                vm: vm,
                onPreSubmit: (ctx, canProceed) {
                  if(canProceed != true) {
                    showSnackBar(ctx, Strings.there_still_invalid_fields);
                  }
                },
                onSubmit: (ctx, success) => success
                    ? showSnackBar(ctx, Strings.form_submission_success, backgroundColor: Colors.green)
                    : showSnackBar(ctx, Strings.form_submission_fail),
                submitBtnBuilder: (ctx, canProceed) => TxtBtn(
                  "Simpan Data Pemeriksaan",
                  color: canProceed == true ? Manifest.theme.colorPrimary : grey,
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}