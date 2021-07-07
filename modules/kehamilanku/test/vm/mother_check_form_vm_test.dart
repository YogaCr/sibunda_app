
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kehamilanku/di/kehamilanku_vm_di.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_vm.dart';


final _week = 1;
final _currentTrimesterId = 1;
late KehamilankuCheckFormVm _vm;

main() async {
  await ConfigUtil.init();

  _vm = KehamilankuVmDi.checkFormVm..init();
  _vm.currentTrimesterId = _currentTrimesterId;

  _group1();
  _cobGroup();
}

_cobGroup() {
  test("cob", () async {
    prind("1");
    await Future.delayed(Duration(seconds: 2), () {
      prinw(3);
    });
  });
}

_group1() {
  test("_submitTest ==========", () async {
    await _submitTest();
  });
}
_submitTest() async {
  final dummy = dummyPregnancyCheck(_week);
  final respMap = dummy.toJson();
  respMap[Const.KEY_VISIT_DATE] = parseDate(respMap[Const.KEY_VISIT_DATE]);
  respMap[Const.KEY_FUTURE_VISIT_DATE] = parseDate(respMap[Const.KEY_FUTURE_VISIT_DATE]);
  respMap[Const.KEY_HPHT] = parseDate(respMap[Const.KEY_HPHT]);
  respMap[Const.KEY_HPL] = parseDate(respMap[Const.KEY_HPL]);

  _vm.patchResponse([respMap]);

  await Future.delayed(Duration(milliseconds: 500), () async {
    prind("_vm.responseGroupList = ${_vm.responseGroupList}");

    assert(_vm.canProceed.value == true);
/*
    bool? canProceed;
    _vm.canProceed.observeForever((_canProceed) {
      prind("_vm.canProceed.observeForever() _canProceed= $_canProceed");
      canProceed = _canProceed;
    });
    bool? isSubmitSuccess;
    _vm.onSubmit.observeForever((success) {
      isSubmitSuccess = success is Success<String>;
    });
 */
    await _vm.submit();

    assert(_vm.onSubmit.value is Success<String>);
  });
/*
  Future.sync(/*Duration(seconds: 1),*/ () async {
    //while(canProceed == null) {}

  });
 */
  //while(canProceed == null) {}

}