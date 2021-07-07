import 'package:bayiku/di/baby_vm_di.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

final _faker = Faker();
late BabyCheckFormVm _vm;
final int _month = 3;
final int _yearId = 7;

main() async {
  await ConfigUtil.init();
  _vm = BabyVmDi.babyCheckFormVm
    ..yearId = _yearId;

  _group1();
  print("");
}


_group1() {
  group("Baby VM Overall Group", () {
    test("_submitTest", () async {
      prinw("_submitTest ==============");
      await _submitTest();
      prinw("_submitTest ============== end");
    });
  });
}

_submitTest() async {
  _vm.initFormDataInMonth(_month);

  await Future.delayed(Duration(seconds: 1), () async {
    prind("AWAL _vm.responseGroupList = ${_vm.responseGroupList}");

    final growthMap = babyMonthlyFormBody.toJson();
    final respsList = <Map<String, dynamic>>[growthMap];
    if(_vm.responseGroupList.length > 1) {
      final devMap = <String, dynamic>{};
      respsList.add(devMap);
      growthMap.remove(Const.KEY_PERKEMBANGAN_ANS); // = devList;
      for(final e in _vm.responseGroupList[1].entries) {
        devMap[e.key] = _faker.randomGenerator.integer(2);
      }
    }

    _vm.patchResponse(respsList);

    await Future.delayed(Duration(milliseconds: 500), () async {
      prind("_vm.responseGroupList = ${_vm.responseGroupList}");
      assert(_vm.canProceed.value == true);

      await _vm.submit();
      assert(_vm.onSubmit.value is Success<String>);
    });
  });
}