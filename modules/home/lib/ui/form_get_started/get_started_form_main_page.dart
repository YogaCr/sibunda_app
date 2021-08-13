import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/util/navigations.dart';
import 'package:core/domain/model/wrapper.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/ui/form_get_started/get_started_form_main_vm.dart';
import 'package:home/ui/signup/sign_up_page.dart';

import 'child_form_page.dart';
import 'children_count_page.dart';
import 'do_mother_have_pregnancy_page.dart';
import 'father_form_page.dart';
import 'mother_form_page.dart';
import 'mother_hpl_page.dart';
import 'new_account_confirmation_page.dart';

// ignore: must_be_immutable
class GetStartedFormMainPage extends StatelessWidget {
  final pageControl = PageController();
  final nestedPageControl = MutableLiveData<PageController>();
  //final LiveData<int> page = MutableLiveData(0);
  final FormGroupInterceptor? interceptor;
  final newAccountPageOnBackPressedContainer = Var<void Function()?>(null);

  late GetStartedFormMainVm vm;

  GetStartedFormMainPage({
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {
    vm = ViewModelProvider.of<GetStartedFormMainVm>(context);

    pageControl.addListener(_onPageChange);

    return ViewModelProvider(
      creators: [
        (ctx) => vm.signUpFormVm,
        (ctx) => vm.motherVm,
        (ctx) => vm.fatherVm,
        (ctx) => vm.childVm,
        (ctx) => vm.doMotherHavePregnancyVm,
        (ctx) => vm.motherHplVm,
        (ctx) => vm.childrenCountVm,
        (ctx) => vm,
      ],
      child: Stack(
        children: [
          PageView(
            controller: pageControl,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SignUpPage(
                pageControll: pageControl,
                interceptor: interceptor,
              ),
              MotherFormPage(
                pageControll: pageControl,
                interceptor: interceptor,
              ),
              FatherFormPage(
                pageControll: pageControl,
                interceptor: interceptor,
              ),
              DoMotherHavePregnancyPage(pageControll: pageControl,), //3
              MotherHplPage(
                pageControll: pageControl,
                onlySinglePage: false,
              ),
              ChildrenCountPage(pageControll: pageControl,), //5
              ChildFormPage(
                pageControll: pageControl,
                nestedPageControll: nestedPageControl,
                interceptor: interceptor,
                onlySinglePage: false,
                //childCount: vm.childrenCountVm.childrenCount,
              ),
              NewAccountConfirmPage(
                pageControll: pageControl,
                onBackPressedContainer: newAccountPageOnBackPressedContainer,
              ), //7
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 50,
              height: 50,
              child: InkWell(
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                onTap: () {
                  prind("GetStartedFormPage pageControl.page= ${pageControl.page}");
                  if(pageControl.page == 7) {
                    final onBackPressed = newAccountPageOnBackPressedContainer.value;
                    prind("GetStartedFormPage onBackPressed= $onBackPressed");
                    if(onBackPressed != null) {
                      onBackPressed();
                      return;
                    }
                  }
                  if(nestedPageControl.value == null) {
                    if(!_scrollBackward(pageControl)) {
                      backPage(context);
                    }
                  } else {
                    if(!_scrollBackward(nestedPageControl.value!)) {
                      nestedPageControl.value = null;
                      if(!_scrollBackward(pageControl)) {
                        backPage(context);
                      }
                    }
                  }
                },
              ),
            ),
          ), //Back
        ],
      ),
    );
  }

  void _onPageChange() {
    if(vm.isActive) {
      final page = pageControl.page;
      if(page != null) {
        int pageInt;
        if(page == (pageInt = page.toInt())) {
          switch(pageInt) {
            case 1: // for mother data page
              vm.motherVm.isDataPresent.value = true;
              break;
            case 2: // for father data page
              vm.fatherVm.isDataPresent.value = true;
              break;
          }
        }
      }
    } else {
      pageControl.removeListener(_onPageChange);
    }
  }

  /// Returns `true` if [controller] is not in page 0 currently
  /// and successfully scroll backward.
  bool _scrollBackward(PageController controller) {
    final page = controller.page?.toInt();
    if(page != null) {
      if(page > 0) {
        final dest = page != 5 // '5' is the index of `ChildrenCountPage`.
            || !vm.doMotherHavePregnancyVm.isHplDeleted
            ? page-1
            : page-2; // if the current page is at `ChildrenCountPage` (page=5) and hpl is deleted,
                  // then skip the previous page relative to `ChildrenCountPage` (that is `MotherHplPage`).

        controller.animateToPage(
          dest,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}