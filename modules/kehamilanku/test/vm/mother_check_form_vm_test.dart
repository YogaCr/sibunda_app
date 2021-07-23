
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kehamilanku/di/kehamilanku_vm_di.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_vm.dart';


final _week = 1;
final _currentTrimesterId = 1;
late KehamilankuCheckFormVm _vm;
late Map<String, dynamic> _sentMap;

main() async {
  await ConfigUtil.init();
  await DbDi.checkUpIdDao.deleteAll();

  _vm = KehamilankuVmDi.checkFormVm()..init();
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
  group("Pregnancy Check VM Overall Test", () {
    test("_submitTest", () async {
      prinw("_submitTest ==========");
      await _submitTest();
      prinw("_submitTest ========== end");
    });
    test("_getAnswerTest", () async {
      prinw("_getAnswerTest ==========");
      await _getAnswerTest();
      prinw("_getAnswerTest ========== end");
    });
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

  await Future.delayed(Duration(milliseconds: 1000), () async {
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

    _sentMap = _vm.getResponseMap();
  });
}

_getAnswerTest() async {
  _vm.resetResponses();

  final allNull = _vm.responseGroupList.every((element) => element.entries.every((element) => element.value.response.value == null));
  prind("allNull = $allNull");
  //prind("_vm.getResponseMap() after reset = ${_vm.getResponseMap()}");
  assert(allNull);

  _vm.getPregnancyCheck(week: _week);

  await Future.delayed(Duration(seconds: 5), () async {
    prind("_vm.responseGroupList = ${_vm.responseGroupList}");

    final gotMap = _vm.getResponse().responseGroups.values.first;

    _sentMap["tanggal_periksa"] = (_sentMap["tanggal_periksa"] as String).split(" ")[0];
    _sentMap["tanggal_periksa_kembali"] = (_sentMap["tanggal_periksa_kembali"] as String).split(" ")[0];
    _sentMap["hpht"] = (_sentMap["hpht"] as String).split(" ")[0];
    _sentMap["hpl"] = (_sentMap["hpl"] as String).split(" ")[0];

    gotMap.remove(Const.KEY_HPHT);
    _sentMap.remove(Const.KEY_HPHT);

    prind("_sentMap = $_sentMap");
    prind("gotMap = $gotMap");

    //expect(actual, matcher)
    assert(mapEquals(_sentMap, gotMap));
    //assert(_vm.canProceed.value == true);
  });
}