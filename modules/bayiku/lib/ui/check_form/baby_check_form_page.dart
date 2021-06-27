import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';

import 'baby_check_form_vm.dart';

class BabyCheckFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<BabyCheckFormVm>(context)
      ..init();
    return FormVmGroupObserver<BabyCheckFormVm>(
      vm: vm,
      onPreSubmit: (valid) => valid == true
          ? showSnackBar(context, "Submitting",backgroundColor: Colors.green)
          : showSnackBar(context, "There still invalid fields"),
      onSubmit: (success) => success
          ? showSnackBar(context, "Sukses",backgroundColor: Colors.green)
          : showSnackBar(context, "Gagal"),
      submitBtnBuilder: (ctx, canProceed) => Container(
        padding: EdgeInsets.all(10),
        color: canProceed == true ? Manifest.theme.colorPrimary : Colors.grey,
        child: Text("submit"),
      ),
    );
/*
    return FormGenericVmObserver<BabyCheckFormVm>(
      onPreSubmit: (valid) => valid == true
          ? showSnackBar(context, "Submitting",backgroundColor: Colors.green)
          : showSnackBar(context, "There still invalid fields"),
      onSubmit: (success) => success
          ? showSnackBar(context, "Sukses",backgroundColor: Colors.green)
          : showSnackBar(context, "Gagal"),
      submitBtnBuilder: (ctx, canProceed) => Container(
        padding: EdgeInsets.all(10),
        color: canProceed == true ? Manifest.theme.colorPrimary : Colors.grey,
        child: Text("submit"),
      ),
    );
 */
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