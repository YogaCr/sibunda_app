import 'package:bayiku/di/baby_vm_di.dart';
import 'package:bayiku/ui/check_form/baby_check_form_page.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:bayiku/ui/home/baby_home_page.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/providers.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/material.dart';

class BabyRoutes extends ModuleRoute {
  BabyRoutes._() : super(GlobalRoutes.manager);
  static final obj = BabyRoutes._();

  @override
  SibRoute get entryPoint => babyHomePage;

  @override
  String get name => GlobalRoutes.bayiku;

  @override
  Set<SibRoute> get routes => {
    babyHomePage,
    babyCheckPage._route,
  };

  static final babyHomePage = SibRoute("BabyHomePage", BabyHomePage, (ctx) => MainFrame(
    body: BabyHomePage().inVmProvider([
          (ctx) => BabyVmDi.babyHomeVm,
    ]),
  ));
  static final babyCheckPage = _BabyCheckFormPage.obj;
}


class _BabyCheckFormPage {
  _BabyCheckFormPage._();
  static final obj = _BabyCheckFormPage._();

  final SibRoute _route = SibRoute("BabyCheckFormPage", BabyCheckFormPage, (ctx) => MainFrame(
    body: BabyCheckFormPage().inVmProvider([
          (ctx) => BabyVmDi.babyCheckFormVm,
    ]),
  ));

  void go(BuildContext context, BabyFormMenuData formData) {
    _route.goToPage(context, args: { Const.KEY_DATA: formData });
  }
}