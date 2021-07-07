import 'package:common/test/__common_test_const.dart';
import 'package:home/di/home_vm_di.dart';
import 'package:home/ui/form_get_started/get_started_form_main_vm.dart';

late GetStartedFormMainVm _vm;

main() async {
  await ConfigUtil.init();
  _vm = HomeVmDi.getStartedFormMainVm;

}