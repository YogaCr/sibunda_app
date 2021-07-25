import 'package:bayiku/di/baby_vm_di.dart';
import 'package:bayiku/ui/neonatal_service/neonatal_service_vm.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

late NeonatalServiceVm _vm;
//final _page = 0;

main() async {
  await ConfigUtil.init();
  _vm = BabyVmDi.neonatalServiceVm(checkUpId: 6);
    //..monthlyCheckUpId = 6;

  _group1();
  print("");
}

_group1() {
  group("Neonatal VM Overall Test", () {
    test("_submitTest_h6", () async {
      prinw("_submitTest_h6 ====================");
      await _submitTest_h6();
      prinw("_submitTest_h6 ==================== end");
    });

    print("");

    test("_submitTest_kn1", () async {
      prinw("_submitTest_kn1 ====================");
      await _submitTest_kn1();
      prinw("_submitTest_kn1 ==================== end");
    });

    print("");

    test("_submitTest_kn2", () async {
      prinw("_submitTest_kn2 ====================");
      await _submitTest_kn2();
      prinw("_submitTest_kn2 ==================== end");
    });

    print("");

    test("_submitTest_kn3", () async {
      prinw("_submitTest_kn3 ====================");
      await _submitTest_kn3();
      prinw("_submitTest_kn3 ==================== end");
    });

    print("");
  });
}


_submitTest_h6() async {
  _vm.initFormInPage(page: 0);

  await Future.delayed(Duration(milliseconds: 500), () async {
    final map = neonatal6HourForm.toJson();
    for(final e in map.entries) {
      if(e.key.startsWith("q_")) {
        map[e.key] = getBinaryAnswerHaveNotStr(e.value);
      }
    }
    map[Const.KEY_DATE] = parseDate(map[Const.KEY_DATE]);
    map[Const.KEY_TIME] = parseTimeOfDay(map[Const.KEY_TIME]);

    _vm.patchResponse([map]);

    await Future.delayed(Duration(milliseconds: 500), () async {
      prind("_vm.responseGroupList = ${_vm.responseGroupList} _vm.currentPage = ${_vm.currentPage}");
      assert(_vm.canProceed.value == true);

      await _vm.submit();
      assert(_vm.onSubmit.value is Success<String>);
    });
  });
}
_submitTest_kn1() async {
  _vm.initFormInPage(page: 1);

  await Future.delayed(Duration(milliseconds: 500), () async {
    final map = neonatalKn1Form.toJson();
    for(final e in map.entries) {
      if(e.key.startsWith("q_")) {
        map[e.key] = getBinaryAnswerHaveNotStr(e.value);
      }
    }
    map[Const.KEY_DATE] = parseDate(map[Const.KEY_DATE]);
    map[Const.KEY_TIME] = parseTimeOfDay(map[Const.KEY_TIME]);

    _vm.patchResponse([map]);

    await Future.delayed(Duration(milliseconds: 500), () async {
      prind("_vm.responseGroupList = ${_vm.responseGroupList}");
      assert(_vm.canProceed.value == true);

      await _vm.submit();
      assert(_vm.onSubmit.value is Success<String>);
    });
  });
}
_submitTest_kn2() async {
  _vm.initFormInPage(page: 2);

  await Future.delayed(Duration(milliseconds: 500), () async {
    final map = neonatalKn2Form.toJson();
    for(final e in map.entries) {
      if(e.key.startsWith("q_")) {
        map[e.key] = getBinaryAnswerHaveNotStr(e.value);
      }
    }
    map[Const.KEY_DATE] = parseDate(map[Const.KEY_DATE]);
    map[Const.KEY_TIME] = parseTimeOfDay(map[Const.KEY_TIME]);

    _vm.patchResponse([map]);

    await Future.delayed(Duration(milliseconds: 500), () async {
      prind("_vm.responseGroupList = ${_vm.responseGroupList}");
      assert(_vm.canProceed.value == true);

      await _vm.submit();
      assert(_vm.onSubmit.value is Success<String>);
    });
  });
}
_submitTest_kn3() async {
  _vm.initFormInPage(page: 3);

  await Future.delayed(Duration(milliseconds: 500), () async {
    final map = neonatalKn3Form.toJson();
    prind("map AWAL = $map");
    for(final e in map.entries) {
      if(e.key.startsWith("q_") && !e.key.startsWith("q_kuning")) {
        map[e.key] = getBinaryAnswerHaveNotStr(e.value);
      }
    }
    prind("map TENGAH = $map");
    //final map = <String, dynamic>{};
    if(map.keys.any((k) => k.startsWith("q_kuning"))) {
      final qKuningKeys = <String>{};
      final checkSet = <int>{};
      int i = 0;
      for(final e in map.entries) {
        if(e.key.startsWith("q_kuning")) {
          qKuningKeys.add(e.key);
          if(e.value == 1) {
            checkSet.add(i);
          }
          i++;
        }
      }
      for(final kuningKey in qKuningKeys) {
        map.remove(kuningKey);
      }
      map["q_kuning"] = checkSet;
      prind("map HAMPIR AKHIR = $map");
    }
    //map[Const.KEY_DATE] = parseDate(map[Const.KEY_DATE]);
    //map[Const.KEY_TIME] = parseTimeOfDay(map[Const.KEY_TIME]);

    prind("map AKHIR = $map");

    _vm.patchResponse([map]);

    await Future.delayed(Duration(milliseconds: 500), () async {
      prind("_vm.responseGroupList = ${_vm.responseGroupList}");
      assert(_vm.canProceed.value == true);

      await _vm.submit();
      assert(_vm.onSubmit.value is Success<String>);
    });
  });
}