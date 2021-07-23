import 'package:bayiku/di/baby_vm_di.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

final _faker = Faker();
late BabyCheckFormVm _vm;
final int _month = 17;
final int _yearId = 8;
late Map<String, dynamic> _sentResp;

main() async {
  await ConfigUtil.init();
  _vm = BabyVmDi.babyCheckFormVm(babyCredential: ProfileCredential(id: 1, nik: "nik"))
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
    test("_getAnswerTest", () async {
      prinw("_getAnswerTest ==============");
      await _getAnswerTest();
      prinw("_getAnswerTest ============== end");
    });
  });
}

_submitTest() async {
  _vm.initFormDataInMonth(month: _month);

  await Future.delayed(Duration(seconds: 3), () async {
    prind("AWAL _vm.responseGroupList = ${_vm.responseGroupList}");

    final growthMap = babyMonthlyFormBody.toJson();
    final respsList = <Map<String, dynamic>>[growthMap];
    if(_vm.responseGroupList.length > 1) {
      final devMap = <String, dynamic>{};
      respsList.add(devMap);
      growthMap.remove(Const.KEY_PERKEMBANGAN_ANS); // = devList;
      for(final e in _vm.responseGroupList[1].entries) {
        final i = _faker.randomGenerator.integer(2);
        devMap[e.key] = getBinaryAnswerYesNoStr(i);
      }
    }

    _vm.patchResponse(respsList);

    await Future.delayed(Duration(milliseconds: 500), () async {
      prind("_vm.responseGroupList = ${_vm.responseGroupList}");
      assert(_vm.canProceed.value == true);

      await _vm.submit();
      assert(_vm.onSubmit.value is Success<String>);

      _sentResp = _vm.getResponse().responseGroups.values.first;
      //_sentResp = _vm.getResponseMap();
    });
  });
}

_getAnswerTest() async {
  _vm.resetResponses();

  final allNull = _vm.responseGroupList.every((element) => element.entries.every((element) => element.value.response.value == null));
  prind("allNull = $allNull");
  //prind("_vm.getResponseMap() after reset = ${_vm.getResponseMap()}");
  assert(allNull);

  _vm.getBabyFormAnswer();

  await Future.delayed(Duration(seconds: 3), () async {
    prind("_vm.responseGroupList = ${_vm.responseGroupList}");

    final gotMap = _vm.getResponse().responseGroups.values.first;

    prind("_sentResp = $_sentResp");
    prind("gotMap = $gotMap");

    assert(mapEquals(_sentResp, gotMap));
    //assert(_vm.canProceed.value == true);

    //await _vm.submit();
    //assert(_vm.onSubmit.value is Success<String>);
  });
}