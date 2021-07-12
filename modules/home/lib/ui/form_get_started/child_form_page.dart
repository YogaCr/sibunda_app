
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';

class ChildFormPage extends StatelessWidget {
  final PageController? pageControll;
  final PageController innerPageControll = PageController();
  final LiveData<int>? childCount;
  final int defaultChildCount = 1;

  ChildFormPage({
    this.pageControll,
    this.childCount,
  });

  @override
  Widget build(BuildContext context) {
    /*
    final childCount = getArgs<int>(context, Const.KEY_DATA) ?? 1;
    if(childCount < 0) {
      throw "Can't have list with negative int, `childCount` = '$childCount'";
    }
     */

    final vm = ViewModelProvider.of<ChildFormVm>(context)
      //..childCount.value = childCount
      ..onSaveBatch.observeForever((canProceed) {
        if(canProceed == true) {
          if(pageControll != null) {
            pageControll!.jumpToPage(pageControll!.page!.toInt() +1);
          } else {
            HomeRoutes.newAccountConfirmPage.goToPage(context);
          }
        }
      });

    if(childCount != null) {
      childCount!.observe(vm.childCount, (count) {
        vm.childCount.value = count;
      });
      if(childCount!.value != null) {
        vm.childCount.value = childCount!.value;
      }
    } else {
      vm.childCount.value = defaultChildCount;
    }

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      innerPageControll.jumpToPage(0);
      innerPageControll.notifyListeners();
    });

    innerPageControll.addListener(() {
      final page = innerPageControll.page;
      if(page != null) {
        int pageInt;
        if(page == (pageInt = page.toInt())) {
          vm.currentPage.value = pageInt;
        }
      }
    });

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: innerPageControll,
      children: List.generate(
        childCount?.value ?? defaultChildCount,
        (index) => _ChildSingleFormPage(
          page: index,
          pageControll: innerPageControll,
        ),
      ),
    );
  }
}

class _ChildSingleFormPage extends StatelessWidget {
  final PageController pageControll;
  final int page;

  _ChildSingleFormPage({
    required this.page,
    required this.pageControll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.fill_child_data,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick().withMargin(EdgeInsets.only(top: 10)),
        TxtLink(
          Strings.skip,
          onTap: () => showSnackBar(context, "dipencet"),
        ),
        FormVmGroupObserver<ChildFormVm>(
          showHeader: false,
          onPreSubmit: (ctx, canProceed) {
            if(canProceed != true) {
              showSnackBar(ctx, Strings.there_still_invalid_fields);
            }
          },
          onSubmit: (ctx, success) {
            if(success) {
              //showSnackBar(context, "Berhasil", backgroundColor: Colors.green);
              pageControll.animateToPage(
                pageControll.page!.toInt() +1,
                duration: Duration(milliseconds: 600,),
                curve: Curves.easeOut,
              );
            } else {
              showSnackBar(context, "Terjadi kesalahan",);
            }
          },
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            child: Icon(Icons.arrow_forward_rounded,),
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: null, //canProceed == true ? null : () => showSnackBar(context, "Masih ada yg blum valid",),
          ),
        ),
      ],
    ).insideScroll();
  }
}