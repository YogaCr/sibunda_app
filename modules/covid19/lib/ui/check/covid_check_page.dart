import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/picker_icon_widget.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/times.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'covid_check_vm.dart';

class CovidCheckPage extends StatelessWidget {
  final scrollControl = ScrollController();
  final FormGroupInterceptor? interceptor;

  CovidCheckPage({
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {
    final isMother = getArgs<bool>(context, Const.KEY_DATA);
    if(isMother == null) {
      throw "Arg `isMother` is required in `CovidCheckPage`";
    }
    final vm = ViewModelProvider.of<CovidCheckVm>(context)
      ..isMother = isMother
      ..init();

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Menu Cek Covid-19 Untuk ${isMother ? Strings.mother : Strings.baby}",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,),
        child: BelowTopBarScrollContentArea(
          controller: scrollControl,
          slivers: [SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,),
                child: ItemPanelWithButton(
                  title: "Jangan lupa jaga kesehatan dan rutin cuci tangan ya Bunda",
                  action: "",
                  img: imgCovidFormOverview,
                ),
              ),
              LiveDataObserver<FormWarningStatus>(
                liveData: vm.result,
                builder: (ctx, data) => data != null
                    ? Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10,),
                  child: Column(
                    children: [
                      Text(
                        "Informasi Hasil Pemeriksaan Covid -19",
                        style: SibTextStyles.size_0_bold,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Tanggal : ${syncFormatTime(DateTime.now())}",
                        style: SibTextStyles.size_min_1_grey,
                      ),
                      SizedBox(height: 15,),
                      ItemFormWarningStatus.fromData(data),
                    ],
                  ),
                ) : defaultEmptyWidget(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15,),
                child: FormVmGroupObserver<CovidCheckVm>(
                  vm: vm,
                  interceptor: interceptor,
                  showHeaderMap: isMother ? null : {
                    0: false,
                  },
                  pickerIconBuilder: (group, key, data) {
                    if(!isMother && group == 0 && key == Const.KEY_BABY_NAME) {
                      return BabyPickerIcon(
                        onItemSelected: (baby) => data.value = baby,
                      );
                    }
                  },
                  onPreSubmit: (ctx, canProceed) {
                    if(canProceed != true) {
                      showSnackBar(ctx, Strings.there_still_invalid_fields);
                    }
                  },
                  onSubmit: (ctx, success) async {
                    if(success) {
                      final res = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
                        content: PopupSuccess(
                          msg: "Data Pemeriksaan Covid berhasil disimpan",
                          actionMsg: "Lihat hasil pemeriksaan",
                          onActionClick: () => Navigator.pop(context, true), //() => backPage(context, backStep: 2),
                        ),
                      )); //showSnackBar(ctx, "Berhasil bro", backgroundColor: Colors.green)
                      if(res == true) {
                        scrollControl.animateTo( 0,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeOut,
                        );
                      }
                    } else {
                      showSnackBar(ctx, Strings.form_submission_fail);
                    }
                  },
                  submitBtnBuilder: (ctx, canProceed) => TxtBtn(
                    "Simpan Data Pemeriksaan",
                    color: canProceed == true ? Manifest.theme.colorPrimary : grey,
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}