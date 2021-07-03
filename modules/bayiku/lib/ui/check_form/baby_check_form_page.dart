import 'package:bayiku/config/baby_routes.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/ui/adapter/top_bar_item_list_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:common/value/enums.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

import 'baby_check_form_vm.dart';

class BabyCheckFormPage extends StatelessWidget {
  //final scrollCtrl = ScrollController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final formMenu = getArgs<BabyFormMenuData>(context, Const.KEY_DATA)!;
    final monthStart = formMenu.monthStart;
    final monthCount = formMenu.monthEnd - monthStart +1;

    final monthList = List.generate(monthCount, (index) => "Bulan ${index + monthStart}");

    final vm = ViewModelProvider.of<BabyCheckFormVm>(context)
      ..init();

    vm.currentMonth = monthStart;

    pageController.addListener(() {
      final page = pageController.page?.toInt();
      if(page != null) {
        vm.currentMonth = page+monthStart;
      }
    });

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Form Bayiku",
      topBarChild: SizedBox(
        height: 50,
        child: TopBarItemCenterAlignList(
          dataList: monthList,
          pageController: pageController,
          //onItemClick: (i) => showSnackBar(context, "Dipencet i = $i"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: PageView(
          controller: pageController,
          children: List.generate(monthCount, (index) => _MonthlyCheckFormPage(
            vm: vm,
            month: index+monthStart,
          )),
        ),
      ),
    );
  }
}

class _MonthlyCheckFormPage extends StatelessWidget {
  final int month;
  final BabyCheckFormVm vm;

  _MonthlyCheckFormPage({
    required this.month,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    vm.initFormDataInMonth(month);

    return BelowTopBarScrollContentArea([
      SliverList(delegate: SliverChildListDelegate.fixed([
        month == 1 ? _NeonatalServicePanel() : SizedBox(),
        FormVmGroupObserver<BabyCheckFormVm>(
          vm: vm,
          imgPosition: RelativePosition.below,
          predicate: () => vm.currentMonth == month || vm.currentMonth == month-1,
          onPreSubmit: (ctx, valid) => valid == true
              ? showSnackBar(ctx, "Submitting",backgroundColor: Colors.green)
              : showSnackBar(ctx, "There still invalid fields"),
          onSubmit: (ctx, success) => success
              ? showSnackBar(ctx, "Sukses",backgroundColor: Colors.green)
              : showSnackBar(ctx, "Gagal"),
          submitBtnBuilder: (ctx, canProceed) => Container(
            padding: EdgeInsets.all(10),
            color: canProceed == true ? Manifest.theme.colorPrimary : Colors.grey,
            child: Text("submit"),
          ),
        ),
      ])),
    ]);
  }
}


class _NeonatalServicePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,),
      child: ItemPanelWithButton(
        img: dummyImg, //TODO: _NeonatalServicePanel: img
        title: "Selamat untuk Kelahiran si Kecil ya Bun",
        action: "Isi Pelayanan Neonatus",
        onBtnClick: () => BabyRoutes.neonatalServicePage.goToPage(context),
      ),
    );
  }
}


/*
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

 */