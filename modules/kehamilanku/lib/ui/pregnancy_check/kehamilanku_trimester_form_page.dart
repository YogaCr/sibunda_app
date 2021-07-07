
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/ui/adapter/form_warning_adp.dart';
import 'package:common/arch/ui/adapter/top_bar_item_list_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_items_kehamilanku.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_vm.dart';

class KehamilankuTrimesterFormPage extends StatelessWidget {
  //final scrollCtrl = ScrollController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final trimester = getArgs<MotherTrimester>(context, Const.KEY_TRIMESTER)!;
    final startWeek = trimester.startWeek;
    final weekCount = trimester.endWeek - startWeek +1;
    final vm = ViewModelProvider.of<KehamilankuCheckFormVm>(context)
      ..init();

    vm.currentWeek.value = startWeek;
    vm.currentTrimesterId = trimester.id;

    pageController.addListener(() {
      final page = pageController.page?.toInt();
      //prind("pageController page= $page double = ${pageController.page}");
      if(page != null) {
        vm.currentWeek.value = page+startWeek;
      }
    });

    final weekList = List.generate(weekCount, (index) => "Minggu ${index + startWeek}");

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
          children: List.generate(weekCount, (index) => _WeeklyFormPage(
            vm: vm,
            week: index+startWeek,
          )),
        ),
      ),
    );
  }
}


class _WeeklyFormPage extends StatelessWidget {
  final int week;
  final KehamilankuCheckFormVm vm;
  _WeeklyFormPage({
    required this.week,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    vm..getPregnancyCheck(week: week, forceLoad: true)
      ..getPregnancyBabySize(pregnancyWeekAge: week, forceLoad: true)
      ..getMotherFormWarningStatus(week: week, forceLoad: true);

    return BelowTopBarScrollContentArea(
      [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            LiveDataObserver<PregnancyBabySize>(
              liveData: vm.pregnancyBabySize,
              builder: (ctx, data) => data != null
                  ? ItemMotherBabySizeOverview.fromData(data)
                  : defaultEmptyWidget(),
            ),
            LiveDataObserver<List<FormWarningStatus>>(
              liveData: vm.formWarningStatusList,
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
          vm: vm,
          liveDataGetter: (vm2) => vm2.formWarningStatusList,
          builder: (ctx, data) => FormWarningSliverList(data ?? List.empty()),
        ),
        //FormWarningSliverList(warningStatusList),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
/*
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                "Form Pemeriksaan Bunda",
                style: SibTextStyles.size_0_bold,
              ),
            ),
 */
            FormVmGroupObserver<KehamilankuCheckFormVm>(
              vm: vm,
              predicate: () => vm.currentWeek.value == week || vm.currentWeek.value == week -1,
              onPreSubmit: (ctx, canProceed) => canProceed == true
                  ? showSnackBar(ctx, "Submitting", backgroundColor: Colors.green)
                  : showSnackBar(ctx, "There still invalid fields"),
              onSubmit: (ctx, success) => success
                  ? showDialog(context: context, builder: (ctx) => AlertDialog(
                    content: PopupSuccess(
                      msg: "Data Pemeriksaan Bunda berhasil disimpan",
                      actionMsg: "Lihat hasil pemeriksaan",
                      onActionClick: () => backPage(context, backStep: 2),
                    ),
                  )) //showSnackBar(ctx, "Berhasil bro", backgroundColor: Colors.green)
                  : showSnackBar(ctx, "Gagal bro"),
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