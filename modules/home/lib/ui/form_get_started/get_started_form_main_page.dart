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

//TODO: GetStartedFormMainPage: buat halaman pake Pager tuk form get started.
class GetStartedFormMainPage extends StatelessWidget {
  final pageControl = PageController();

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
              ChildFormPage(pageControll: pageControl,),
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
                onTap: () => pageControl.jumpToPage(pageControl.page!.toInt() -1),
              ),
            ),
          ), //Back
        ],
      ),
    );
  }
}