import 'dart:io';

import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/di/home_vm_di.dart';
import 'package:home/ui/form_get_started/get_started_form_main_vm.dart';

final _faker = Faker();
late GetStartedFormMainVm _vm;

late SignUpData signUpData;
late AppDatabase _db;

main() async {
  await ConfigUtil.init();
  _vm = HomeVmDi.getStartedFormMainVm;

  await _group1();
  print("");
}

_group1() async {
  group("Get Started Form VM Test", () {
    test("_signUpFormVmTest", () async {
      prinw("_signUpFormVmTest ============");
      await _signUpFormVmTest();
      prinw("_signUpFormVmTest ============ end");
    });

    print("");

    test("_motherVmTest", () async {
      prinw("_motherVmTest ============");
      await _motherVmTest();
      prinw("_motherVmTest ============ end");
    });

    print("");

    test("_fatherVmTest", () async {
      prinw("_fatherVmTest ============");
      await _fatherVmTest();
      prinw("_fatherVmTest ============ end");
    });

    print("");

    test("_childVmTest", () async {
      prinw("_childVmTest ============");
      await _childVmTest();
      prinw("_childVmTest ============ end");
    });

    print("");

    (_db = DbDi.db).deleteAllTable();

    test("_getStartedFormVmSubmitTest", () async {
      prinw("_getStartedFormVmSubmitTest ============");
      await _getStartedFormVmSubmitTest();
      prinw("_getStartedFormVmSubmitTest ============ end");
    });

    print("");
  });
}

_signUpFormVmTest() async {
  //====== signup data ==========
  final email = DateTime.now().millisecondsSinceEpoch.toString() +_faker.internet.email();
  final name = _faker.person.name();
  final pswd = _faker.internet.password();
  final data = SignUpData(name: name, email: email, password: pswd);
  final map = data.toJson;
  map[Const.KEY_RE_PSWD] = pswd;

  prind("map = $map");

  final vm = _vm.signUpFormVm;
  vm.patchResponse([map]);

  await Future.delayed(Duration(milliseconds: 500), () async {
    prind("vm.responseGroupList = ${vm.responseGroupList}");
    assert(vm.canProceed.value == true);

    await vm.submit();
    assert(vm.onSubmit.value is Success<String>);

    signUpData = data;

    final email = signUpData.email;
    final pswd = signUpData.password;

    final file = await File(TestUtil.testOutputDir).writeAsString("$email\n$pswd");
  });
}

_motherVmTest() async {
  final dummy = dummyMother;
  final map = dummy.toJson;
  map[Const.KEY_BIRTH_DATE] = DateTime.parse(map[Const.KEY_BIRTH_DATE]);
  map[Const.KEY_BIRTH_PLACE] = idStringList[_faker.randomGenerator.integer(idStringList.length)];

  final vm = _vm.motherVm;
  vm.patchResponse([map]);

  await Future.delayed(Duration(milliseconds: 500), () async {
    prind("vm.responseGroupList = ${vm.responseGroupList}");
    assert(vm.canProceed.value == true);

    await vm.submit();
    assert(vm.onSubmit.value is Success<String>);
  });
}

_fatherVmTest() async {
  final dummy = dummyFather;
  final map = dummy.toJson;
  map[Const.KEY_BIRTH_DATE] = DateTime.parse(map[Const.KEY_BIRTH_DATE]);
  map[Const.KEY_BIRTH_PLACE] = idStringList[_faker.randomGenerator.integer(idStringList.length)];

  final vm = _vm.fatherVm;
  vm.patchResponse([map]);

  await Future.delayed(Duration(milliseconds: 500), () async {
    prind("vm.responseGroupList = ${vm.responseGroupList}");
    assert(vm.canProceed.value == true);

    await vm.submit();
    assert(vm.onSubmit.value is Success<String>);
  });
}

_childVmTest() async {
  final dummy = dummyChild;
  final map = dummy.toJson;
  map[Const.KEY_BIRTH_DATE] = DateTime.parse(map[Const.KEY_BIRTH_DATE]);
  map[Const.KEY_BIRTH_PLACE] = idStringList[_faker.randomGenerator.integer(idStringList.length)];

  final vm = _vm.childVm;
  vm.patchResponse([map]);

  await Future.delayed(Duration(milliseconds: 500), () async {
    prind("vm.responseGroupList = ${vm.responseGroupList}");
    assert(vm.canProceed.value == true);

    await vm.submit();
    assert(vm.onSubmit.value is Success<String>);
  });
}

_getStartedFormVmSubmitTest() async {
  await _vm.sendData();
  await Future.delayed(Duration(milliseconds: 500), () {
    prind("_vm.onSubmit.value = ${_vm.onSubmit.value}");
    assert(_vm.onSubmit.value == true);
  });
}

/*
  late final SignUpFormVm signUpFormVm;
  late final MotherFormVm motherVm;
  late final FatherFormVm fatherVm;
  late final ChildFormVm childVm;
  late final MotherHplVm motherHplVm;
  late final ChildrenCountVm childrenCountVm;
 */