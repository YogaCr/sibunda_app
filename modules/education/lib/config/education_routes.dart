import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/config/routes.dart';
import 'package:common/util/providers.dart';
import 'package:common/value/const_values.dart';
import 'package:education/di/education_vm_di.dart';
import 'package:education/ui/detail/education_detail_page.dart';
import 'package:education/ui/home/education_home_page.dart';
import 'package:flutter/cupertino.dart';

class EducationRoutes extends ModuleRoute {
  EducationRoutes._() : super(GlobalRoutes.manager) {
    GlobalRoutes.manager.exportRoute(GlobalRoutes.education_detailPage, detailPage._route);
  }

  static final obj = EducationRoutes._();

  @override
  SibRoute get entryPoint => educationHomePage;

  @override
  String get name => GlobalRoutes.education;

  @override
  Set<SibRoute> get routes => {
    educationHomePage,
    detailPage._route,
  };

  static final educationHomePage = SibRoute("EducationHomePage", EducationHomePage, (ctx) => MainFrame(
    body: EducationHomePage().inVmProvider([
      (ctx) => EducationVmDi.obj.educationHomeVm(context: ctx),
    ]),
  ));
  static final detailPage = _EducationDetailPageRoute.obj;
}

class _EducationDetailPageRoute {
  _EducationDetailPageRoute._();
  static final obj = _EducationDetailPageRoute._();

  final _route = SibRoute("EducationDetailPage", EducationDetailPage, (ctx) => MainFrame(
    body: EducationDetailPage().inVmProvider([
      (ctx) => EducationVmDi.obj.educationDetailVm(context: ctx),
    ]),
  ));

  void go(BuildContext context, Tips data) {
    _route.goToPage(context, args: { Const.KEY_DATA: data });
  }
}