import 'package:bayiku/ui/check_form/baby_check_form_page.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:common/util/providers.dart';

class BabyRoutes extends ModuleRoute {
  BabyRoutes._() : super(GlobalRoutes.manager);

  @override
  SibRoute get entryPoint => throw UnimplementedError("`BabyRoutes.entryPoint is not implemented yet`");

  @override
  String get name => GlobalRoutes.bayiku;

  @override
  Set<SibRoute> get routes => {};


  static final babyCheckPage = SibRoute("BabyCheckFormPage", BabyCheckFormPage, (ctx) => MainFrame(
    body: BabyCheckFormPage().inVmProvider([
      (ctx) => BabyCheckFormVm(),
    ]),
  ));
}