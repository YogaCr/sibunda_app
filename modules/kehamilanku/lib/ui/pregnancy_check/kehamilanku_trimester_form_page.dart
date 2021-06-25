
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/ui/adapter/form_warning_adp.dart';
import 'package:common/arch/ui/adapter/top_bar_item_list_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_items_kehamilanku.dart';
import 'package:common/arch/ui/widget/form_txt_vm_observer.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_vm.dart';

class KehamilankuTrimesterFormPage extends StatelessWidget {
  
  final scrollCtrl = ScrollController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final trimester = getArgs<MotherTrimester>(context, Const.KEY_TRIMESTER)!;
    final startWeek = trimester.startWeek;
    final weekCount = trimester.endWeek - startWeek +1;
    final vm = ViewModelProvider.of<KehamilankuCheckFormVm>(context)
    ..getPregnancyCheck(motherNik: "", week: 1)
    ..getPregnancyBabySize(pregnancyWeekAge: 1)
    ..getMotherFormWarningStatus(motherNik: "", week: 1);

    final weekList = List.generate(weekCount, (index) => "Minggu ${index + startWeek}");
/*
    final weekList = List.generate(20, (index) => "Minggu $index");
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
 */

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Trimester ${trimester.trimester}",

      topBarChild: SizedBox(
        height: 50,
        child: TopBarItemCenterAlignList(
          dataList: weekList,
          pageController: pageController,
          onItemClick: (i) => showSnackBar(context, "Dipencet i = $i"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: PageView(
          controller: pageController,
          children: List.generate(weekCount, (index) => _WeeklyFormPage(index +trimester.startWeek)),
        ),
      ),
    );
  }
}


class _WeeklyFormPage extends StatelessWidget {
  final int week;
  _WeeklyFormPage(this.week);

  @override
  Widget build(BuildContext context) {
    return BelowTopBarScrollContentArea(
      [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            AsyncVmObserver<KehamilankuCheckFormVm, PregnancyBabySize>(
              liveDataGetter: (vm2) => vm2.pregnancyBabySize,
              builder: (ctx, data) => ItemMotherBabySizeOverview.fromData(data),
            ),
            AsyncVmObserver<KehamilankuCheckFormVm, List<FormWarningStatus>>(
              liveDataGetter: (vm2) => vm2.formWarningStatusList,
              builder: (ctx, data) => Container(
                margin: EdgeInsets.only(top: 20, bottom: 5,),
                child: data?.isNotEmpty == true ? Text(
                  "Informasi Hasil Pemeriksaan",
                  style: SibTextStyles.size_0_bold,
                ) : null,
              ),
            ),
          ]),
        ),
        AsyncVmObserver<KehamilankuCheckFormVm, List<FormWarningStatus>>(
          liveDataGetter: (vm2) => vm2.formWarningStatusList,
          builder: (ctx, data) => FormWarningSliverList(data ?? List.empty()),
        ),
        //FormWarningSliverList(warningStatusList),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                "Form Pemeriksaan Bunda",
                style: SibTextStyles.size_0_bold,
              ),
            ),
            FormTxtVmObserver<KehamilankuCheckFormVm>(
              onSubmit: (canProceed) => canProceed
                  ? showSnackBar(context, "Berhasil bro", backgroundColor: Colors.green)
                  : showSnackBar(context, "Gagal bro"),
              submitBtnBuilder: (ctx, canProceed) => Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TxtBtn(
                  "Simpan Data Pemeriksaan",
                  color: canProceed == true ? pink_300 : grey,
                ),
              ),
            ),
            //BlocMultiFieldFormBuilder<PregnancyCheckBloc>.defaultInputField(),
          ]),
        ),
      ],
    );
  }
}