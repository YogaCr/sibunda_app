import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/config/routes.dart';
import 'package:common/util/providers.dart';
import 'package:education/di/education_vm_di.dart';
import 'package:education/ui/home/education_home_page.dart';

class EducationRoutes extends ModuleRoute {
  EducationRoutes._() : super(GlobalRoutes.manager);
  static final obj = EducationRoutes._();

  @override
  SibRoute get entryPoint => educationHomePage;

  @override
  String get name => GlobalRoutes.education;

  @override
  Set<SibRoute> get routes => {};

  static final educationHomePage = SibRoute("EducationHomePage", EducationHomePage, (ctx) => MainFrame(
    body: EducationHomePage().inVmProvider([
      (ctx) => EducationVmDi.educationHomeVm,
    ]),
  ));
}