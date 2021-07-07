import 'dart:io';

import 'package:common/test/__common_test_const.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/di/home_vm_di.dart';
import 'package:home/ui/login/login_vm.dart';

late LoginFormVm _vm;

main() async {
  await ConfigUtil.init();
  _vm = HomeVmDi.loginFormVm;

  _group1();
  print("");
}

_group1() {
  prinw("Login VM Test ===========");

  group("Login VM Test", () {
    test("_loginTest", () async {
      prinw("_loginTest ===========");
      await _loginTest();
      prinw("_loginTest =========== end");
    });

    prin("");
  });

  prinw("Login VM Test =========== end");
}

_loginTest() async {
  final fileStr = File(TestUtil.testOutputDir).readAsStringSync().split("\n");
  final email = fileStr[0];
  final pswd = fileStr[1];

  final map = {
    Const.KEY_EMAIL: email,
    Const.KEY_PSWD: pswd,
  };

  _vm.patchResponse([map]);

  await Future.delayed(Duration(milliseconds: 500), () async {
    prind("_vm.responseGroupList = ${_vm.responseGroupList}");
    assert(_vm.canProceed.value == true);

    await _vm.submit();
    assert(_vm.onSubmit.value is Success<String>);
  });
}