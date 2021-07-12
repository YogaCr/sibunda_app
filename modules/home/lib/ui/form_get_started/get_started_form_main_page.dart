import 'package:common/util/navigations.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/view_model.dart';
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

class GetStartedFormMainPage extends StatelessWidget {
  final pageControl = PageController();
  final LiveData<int> page = MutableLiveData(0);

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<GetStartedFormMainVm>(context);

    return ViewModelProvider(
      creators: [
        (ctx) => vm.signUpFormVm,
        (ctx) => vm.motherVm,
        (ctx) => vm.fatherVm,
        (ctx) => vm.childVm,
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
              SignUpPage(pageControll: pageControl,),
              MotherFormPage(pageControll: pageControl,),
              FatherFormPage(pageControll: pageControl,),
              DoMotherHavePregnancyPage(pageControll: pageControl,),
              MotherHplPage(pageControll: pageControl,),
              ChildrenCountPage(pageControll: pageControl,),
              ChildFormPage(
                pageControll: pageControl,
                childCount: vm.childrenCountVm.childrenCount,
              ),
              NewAccountConfirmPage(),
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
                  final page = pageControl.page?.toInt();
                  if(page != null) {
                    if(page >= 0) {
                      pageControl.animateToPage(
                        page -1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
                    } else {
                      backPage(context);
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
}