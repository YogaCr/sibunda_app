import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/mother_hpl_vm.dart';

class MotherHplPage extends StatelessWidget {
  final PageController? pageControll;
  final bool onlySinglePage;
  MotherHplPage({
    this.pageControll,
    this.onlySinglePage = true,
  });

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<MotherHplVm>(context);

    vm.onSubmit.observeForever((success) {
      if(success == true) {
        _moveToNext(context);
      } else {
        showSnackBar(context, Strings.error_occurred_when_saving_data);
      }
    });

    final now = DateTime.now();
    //DateTime? hplDate;
    //DateTime? hphtDate;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Strings.mother_children_data,
          style: SibTextStyles.header1,
        ),
        Text("Sudah tahu kapan HPL Bunda?"),
        TxtInputUnderline(
          readOnly: true,
          textController: vm.hplTxtControl,
          overText: "Masukkan hari perkiraan menurut dokter Bunda",
          onSuffixIconClick: () async {
            final hplDate = await showDatePicker(
              context: context,
              initialDate: vm.hpl.value ?? now,
              firstDate: DateTime(now.year -1),
              lastDate: DateTime(now.year +1),
            );
            if(hplDate != null) {
              vm.setHpl(hplDate);
            }
          },
        ),
        Text("Atau"),
        //Spacer(flex: 1,),
        Text("Yuk hitung HPL Bunda"),
        TxtInputUnderline(
          readOnly: true,
          textController: vm.hphtTxtControl,
          overText: "Masukkan HPHT Bunda",
          onSuffixIconClick: () async {
            final hphtDate = await showDatePicker(
              context: context,
              initialDate: vm.hpht.value ?? now,
              firstDate: DateTime(now.year -1),
              lastDate: DateTime(now.year +1),
            );
            if(hphtDate != null) {
              vm.setHpht(hphtDate);
            }
          },
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(SibDimensWidget.std_radius_circular),
            side: BorderSide(color: Manifest.theme.colorPrimary, width: 1.5),
          ),
          child: Column(
            children: [
              Text(
                "Hari perkiraan lahir bayi Bunda adalah:",
                style: SibTextStyles.size_min_1_grey,
              ),
              LiveDataObserver<String>(
                liveData: vm.hplResTxt,
                builder: (ctx, data) => Text(
                  data ?? "-",
                  style: SibTextStyles.size_0_colorPrimary,
                ),
              ),
            ],
          ).withMargin(EdgeInsets.all(SibDimens.std_padding)),
        ),
        Builder(
          builder: (ctx) {
            final submitBtnBuilder = (ctx, canProceed) {
              return TxtBtn(
                Strings.save,
                color: canProceed == true ? Manifest.theme.colorPrimary : grey,
                onTap: () => canProceed == true
                    ? vm.proceed()
                    : showSnackBar(ctx, Strings.there_still_invalid_fields), //canProceed != true ? null : () => _moveToNext(context),
              );
            };
            return AsyncVmObserver<MotherHplVm, bool>(
              liveDataGetter: (vm) => vm.canProceed,
              preAsyncBuilder: (BuildContext ctx, String key) {
                if(key == MotherHplVm.proceedKey) {
                  return defaultLoading();
                }
              },
              postAsyncBuilder: (BuildContext ctx, String key) {
                if(key == MotherHplVm.proceedKey) {
                  return submitBtnBuilder(ctx, true);
                }
              },
              builder: submitBtnBuilder,
            );
          },
        ),
      ],
    ).withMargin(EdgeInsets.only(right: 24, left: 24));
  }

  void _moveToNext(BuildContext context) {
    if(!onlySinglePage) {
      pageControll == null
          ? HomeRoutes.childrenCountPage.goToPage(context)
          : pageControll!.animateToPage(
        pageControll!.page!.toInt() +1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else {
      backPage(context, result: true);
    }
  }
}