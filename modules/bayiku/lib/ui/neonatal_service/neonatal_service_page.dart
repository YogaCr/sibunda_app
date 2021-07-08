import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/ui/adapter/top_bar_item_list_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/config/manifest.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/enums.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'neonatal_service_vm.dart';



class NeonatalServicePage extends StatelessWidget {
  //final scrollCtrl = ScrollController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final pageList = babyNeonatalServicePages;

    final vm = ViewModelProvider.of<NeonatalServiceVm>(context)
      ..init();

    pageController.addListener(() {
      final page = pageController.page?.toInt();
      if(page != null) {
        vm.initFormInPage(page); // = page;
      }
    });

    return TopBarTitleAndBackFrame(
      isScroll: true,
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

  _FormPage({
    required this.page,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    //vm.initFormInPage(page);

    return BelowTopBarScrollContentArea([
      SliverList(delegate: SliverChildListDelegate.fixed([
        FormVmGroupObserver<NeonatalServiceVm>(
          vm: vm,
          imgPosition: RelativePosition.above,
          predicate: () => vm.currentPage == page || vm.currentPage == page-1,
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