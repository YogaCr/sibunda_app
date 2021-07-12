import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/ui/adapter/top_bar_item_list_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/arch/ui/widget/txt_btn.dart';
import 'package:common/config/manifest.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/enums.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'neonatal_service_vm.dart';



class NeonatalServicePage extends StatelessWidget {
  //final scrollCtrl = ScrollController();
  final pageController = PageController();
  final FormGroupInterceptor? interceptor;

  NeonatalServicePage({
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {
    final pageList = babyNeonatalServicePages;

    final vm = ViewModelProvider.of<NeonatalServiceVm>(context);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: 500));
      pageController.jumpToPage(0);
      pageController.notifyListeners();
    });

    pageController.addListener(() {
      final page = pageController.page;
      if(page != null) {
        int pageInt;
        if(page == (pageInt = page.toInt())) {
          vm.initFormInPage(page: pageInt); // = page;
        }
      }
    });

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Form Bayiku",
      topBarChild: SizedBox(
        height: 50,
        child: TopBarItemCenterAlignList(
          dataList: pageList,
          pageController: pageController,
          //onItemClick: (i) => showSnackBar(context, "Dipencet i = $i"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: PageView(
          controller: pageController,
          children: List.generate(pageList.length, (index) => _FormPage(
            interceptor: interceptor,
            vm: vm,
            page: index,
          )),
        ),
      ),
    );
  }
}


class _FormPage extends StatelessWidget {
  final int page;
  final NeonatalServiceVm vm;
  final FormGroupInterceptor? interceptor;

  _FormPage({
    required this.page,
    required this.vm,
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {
    //vm.initFormInPage(page);

    return BelowTopBarScrollContentArea(
      slivers: [SliverList(delegate: SliverChildListDelegate.fixed([
        Container(
          margin: EdgeInsets.only(bottom: 15,),
          child: FormVmGroupObserver<NeonatalServiceVm>(
            vm: vm,
            interceptor: interceptor,
            imgPosition: RelativePosition.above,
            predicate: () => vm.currentPage.value == page, //|| vm.currentPage == page-1,
            onPreSubmit: (ctx, valid) => valid == true
                ? showSnackBar(ctx, "Submitting",backgroundColor: Colors.green)
                : showSnackBar(ctx, "There still invalid fields"),
            onSubmit: (ctx, success)  async {
              if(success) {
                final res = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
                  content: PopupSuccess(
                    msg: "Data Pemeriksaan Bayi berhasil disimpan",
                    actionMsg: "Lihat hasil pemeriksaan",
                    onActionClick: () => Navigator.pop(context, true), //() => backPage(context, backStep: 2),
                  ),
                )); //showSnackBar(ctx, "Berhasil bro", backgroundColor: Colors.green)
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