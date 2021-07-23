import 'package:common/test/__common_test_const.dart';
import 'package:common/util/data_mapper.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:covid19/di/covid_vm_di.dart';
import 'package:covid19/ui/check/covid_check_vm.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

final _faker = Faker();
late CovidCheckVm _vm;

main() async {
  await ConfigUtil.init();
  _vm = CovidVmDi.checkVm();

  _group1();
  print("");
}


_group1() {
  group("Covid VM Submit Test", () {
    setUpAll(() async {
      _vm.init();
      await Future.delayed(Duration(seconds: 2));
    });

    setUp(() async {
      assert(_vm.isFormReady.value == true);
      assert(_vm.fieldGroupList.first.value != null);

      _vm.resetResponses();

      final allNull = _vm.responseGroupList.every((element) => element.entries.every((element) => element.value.response.value == null));
      prind("allNull = $allNull");
      //prind("_vm.getResponseMap() after reset = ${_vm.getResponseMap()}");
      assert(allNull);
    });

    tearDown(() async {
      final map = <String, String>{};
      for(final fieldData in _vm.fieldGroupList.first.value!.data) {
        final i = _faker.randomGenerator.integer(2);
        map[fieldData.key] = getBinaryAnswerYesNoStr(i);
      }

      prind("map = $map");

      _vm.patchResponse([map]);

      await Future.delayed(Duration(milliseconds: 500));

      prind("_vm.responseGroupList = ${_vm.responseGroupList}");
      assert(_vm.canProceed.value == true);

      await _vm.submit();
      assert(_vm.onSubmit.value is Success<String>);
    });

    test("_submitMotherTest", () async {
      prinw("_submitMotherTest ==========");
      await _submitMotherTest();
      prinw("_submitMotherTest ========== end");
    });

    print("");

    test("_submitBabyTest", () async {
      prinw("_submitBabyTest ==========");
      await _submitBabyTest();
      prinw("_submitBabyTest ========== end");
    });
  });
}

_submitMotherTest() async {
  _vm.isMother = true;
}
_submitBabyTest() async {
  _vm.isMother = false;
}