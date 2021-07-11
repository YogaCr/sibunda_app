import 'package:bayiku/config/baby_routes.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/ui/adapter/form_warning_adp.dart';
import 'package:common/arch/ui/adapter/top_bar_item_list_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:common/value/enums.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data_observer.dart';
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
      ..yearId = formMenu.id;

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: 500));
      pageController.jumpToPage(0);
      pageController.notifyListeners();
    });

    //vm.currentMonth = monthStart;

    //vm.currentWeek.value = startWeek;
    //vm.initPage(week: startWeek);
    //vm.currentTrimesterId = trimester.id;

    pageController.addListener(() {
      final page = pageController.page;
      //prind("pageController page= $page double = ${pageController.page}");
      if(page != null) {
        //prind("pageController MASUK ===========");
        int pageInt;
        if(page == (pageInt = page.toInt())) {
          final month = pageInt +monthStart;
          prind("pageController MASUK =========== INT page= $page month = $month");
          vm.initFormDataInMonth(month: month);
        }
      }
    });

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
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
            month: index +monthStart,
            year: formMenu.year,
          )),
        ),
      ),
    );
  }
}

class _MonthlyCheckFormPage extends StatelessWidget {
  final int month;
  final int year;
  final BabyCheckFormVm vm;
  final scrollControl = ScrollController();

  _MonthlyCheckFormPage({
    required this.month,
    required this.year,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {

    return BelowTopBarScrollContentArea(
      controller: scrollControl,
      slivers: [SliverList(delegate: SliverChildListDelegate.fixed([
        year == 1 && month == 0 ? MultiLiveDataObserver(
          liveDataList: [vm.formAnswer, vm.onSubmit,],
          builder: (ctx, dataList) => dataList[0] != null || dataList[1] is Success<String>
              ? _NeonatalServicePanel()
              : defaultEmptyWidget(),
        ) : defaultEmptyWidget(),
        LiveDataObserver<List<FormWarningStatus>>(
          liveData: vm.warningList,
          predicate: (data) => vm.currentMonth.value == month,
          initBuilder: (ctx) => defaultEmptyWidget(),
          builder: (ctx, data) => Container(
            margin: EdgeInsets.only(top: 20, bottom: 5,),
            child: data?.isNotEmpty == true ? Text(
              "Informasi Hasil Pemeriksaan Pertumbuhan",
              style: SibTextStyles.size_0_bold,
              textAlign: TextAlign.center,
            ) : null,
          ),
        ),
      ])),
      LiveDataObserver<List<FormWarningStatus>>(
        liveData: vm.warningList,
        predicate: (data) => vm.currentMonth.value == month,
        initBuilder: (ctx) => SliverToBoxAdapter(child: defaultLoading(),),
        builder: (ctx, data) => data != null
            ? FormWarningSliverList(data)
            : SliverToBoxAdapter(child: defaultLoading(),),
      ),
      SliverList(delegate: SliverChildListDelegate.fixed([
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: FormVmGroupObserver<BabyCheckFormVm>(
            vm: vm,
            imgPosition: RelativePosition.below,
            predicate: () => vm.currentMonth.value == month,
                //|| vm.currentMonth.value == month -1
                //|| vm.currentMonth.value == month +1,
            onPreSubmit: (ctx, valid) => valid == true
                ? showSnackBar(ctx, "Submitting", backgroundColor: Colors.green)
                : showSnackBar(ctx, "There still invalid fields"),
            onSubmit: (ctx, success) async {
              if(success) {
                final res = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
                  content: PopupSuccess(
                    msg: "Data Pemeriksaan Bayi berhasil disimpan",
                    actionMsg: "Lihat hasil pemeriksaan",
                    onActionClick: () => Navigator.pop(context, true), //() => backPage(context, backStep: 2),
                  ),
                )); //showSnackBar(ctx, "Berhasil bro", backgroundColor: Colors.green)
                if(res == true) {
                  vm.getWarningList(forceLoad: true,);
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
              Strings.submit_check_form,
              color: canProceed == true ? Manifest.theme.colorPrimary : Colors.grey,
            ),
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
      withTopOffset: true,
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