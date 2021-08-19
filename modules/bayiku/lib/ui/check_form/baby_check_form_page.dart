import 'package:bayiku/config/baby_routes.dart';
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/adapter/form_warning_adp.dart';
import 'package:common/arch/ui/adapter/top_bar_item_list_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
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
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

import 'baby_check_form_vm.dart';

class BabyCheckFormPage extends StatelessWidget {
  //final scrollCtrl = ScrollController();
  final pageController = PageController();
  final FormGroupInterceptor? interceptor;

  BabyCheckFormPage({
    this.interceptor,
  });

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
            interceptor: interceptor,
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
  final FormGroupInterceptor? interceptor;

  _MonthlyCheckFormPage({
    required this.month,
    required this.year,
    required this.vm,
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {

    return BelowTopBarScrollContentArea(
      controller: scrollControl,
      slivers: [SliverList(delegate: SliverChildListDelegate.fixed([
        LiveDataObserver<int>(
          liveData: vm.currentMonth,
          builder: (ctx, month) {
            if(month != this.month) return defaultLoading();

            Widget getAnalysis({
              required LiveData<List<FormWarningStatus>> liveData,
              required String header,
              required String btnTxt,
              required void Function()? onTap,
            }) => LiveDataObserver<List<FormWarningStatus>>(
              liveData: liveData,
              builder: (ctx, data) {
                if(data == null) return defaultLoading();
                if(data.isEmpty) return defaultEmptyWidget();
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 5,),
                      child: Text(
                        header,
                        style: SibTextStyles.size_0_bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FormWarningList(data),
                    SizedBox(height: 10,),
                    TxtBtn(
                      btnTxt,
                      onTap: onTap,
                    ),
                  ],
                );
              },
            );

            final growthAnalysis = getAnalysis(
              liveData: vm.growthWarningList,
              header: "Informasi Hasil Pemeriksaan Pertumbuhan",
              btnTxt: "Lihat Grafik Pertumbuhan Bayi",
              onTap: () => BabyRoutes.growthChartMenuVm.go(
                context: context,
                babyCredential: vm.credential,
              ),
            );
            final devAnalysis = getAnalysis(
              liveData: vm.devWarningList,
              header: "Informasi Hasil Pemeriksaan Perkembangan",
              btnTxt: "Lihat Grafik Perkembangan Bayi",
              onTap: () => BabyRoutes.chartPageRoute.go(
                context: context,
                babyCredential: vm.credential,
                type: BabyChartType.dev,
              ),
            );

            final children = <Widget>[
              growthAnalysis, devAnalysis,
            ];

            if(year == 1 && month == 0) {
              children.insert(0, MultiLiveDataObserver(
                liveDataList: [vm.formAnswer, vm.onSubmit,],
                builder: (ctx, dataList) {
                  final checkUpId = (dataList[0] as BabyMonthlyFormBody?)?.toFormId();
                  prind("_MonthlyCheckFormPage checkUpId= $checkUpId dataList[1]= ${dataList[1]}");
                  return checkUpId != null //&& dataList[1] is Success<String>
                      ? _NeonatalServicePanel(checkUpId)
                      : defaultEmptyWidget();
                },
              ),);
            }

            return Column(
              children: children,
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: FormVmGroupObserver<BabyCheckFormVm>(
            vm: vm,
            interceptor: interceptor,
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
                ));
                if(res == true) {
                  if(year == 1 && month == 0) {
                    vm.getBabyFormAnswer(forceLoad: true,);
                  }
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
  final BabyFormId checkUpId;
  _NeonatalServicePanel(this.checkUpId);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,),
      child: ItemPanelWithButton(
        img: ImgData(
          link: "bayiku_neonatal.png",
          package: GlobalRoutes.common,
          src: ImgSrc.asset,
        ),
        title: "Selamat untuk Kelahiran si Kecil ya Bun",
        action: "Isi Pelayanan Neonatus",
        onBtnClick: () => BabyRoutes.neonatalServicePage.go(
          context: context,
          checkUpId: checkUpId,
        ),
      ),
    );
  }
}