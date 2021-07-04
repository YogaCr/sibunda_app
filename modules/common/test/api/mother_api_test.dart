import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_immunization_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/value/const_values.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/common_test_const.dart';

late KehamilankuApi _api;
late int _checkId;
late PregnancyCheck _checkModel;

main() async {
  _api = KehamilankuApi(await CommonTestConst.getDummySession());

  _group1();
  print("");
  _group2();
  print("");
}

_group1() {
  prinw("Mother Overall ========");

  group("Mother Overall", () {
    test("HomeTest", () async {
      prinw("HomeTest ========");
      await _homeTest();
      prinw("HomeTest ======== end");
    });

    print("");

    test("_sendCheckTest", () async {
      prinw("_sendCheckTest ========");
      await _sendCheckTest();
      prinw("_sendCheckTest ======== end");
    });

    print("");

    test("_showCheckTest", () async {
      prinw("_showCheckTest ========");
      await _showCheckTest();
      prinw("_showCheckTest ======== end");
    });

    print("");

    test("_getWarningTest", () async {
      prinw("_getWarningTest ========");
      await _getWarningTest();
      prinw("_getWarningTest ======== end");
    });

    print("");

    test("_getImmunizationTest", () async {
      prinw("_getImmunizationTest ========");
      await _getImmunizationTest();
      prinw("_getImmunizationTest ======== end");
    });

    print("");


    test("_sendImmunizationTest", () async {
      prinw("_sendImmunizationTest ========");
      await _sendImmunizationTest();
      prinw("_sendImmunizationTest ======== end");
    });

    print("");

  });

  prinw("Mother Overall ======== end");
}

_homeTest() async {
  final res = await _api.getHomeData();
  prinr("res = $res");
  assert(res.code == 200);
}
_sendCheckTest() async {
  _checkModel = dummyPregnancyCheck(1);
  //final checkMap = _checkModel.toJson();
  //checkMap[Const.KEY_TRIMESTER_ID] = 1;
  final body = PregnancyCheckBody.fromModel(model: _checkModel, trimesterId: 1);
  final res = await _api.sendPregnancyCheckForm(body);
  prinr("res = $res");
  _checkId = res.checkupId.id;
  assert(res.code == 200);
}
_showCheckTest() async {
  final body = PregnancyShowCheckBody(checkId: _checkId);
  final res = await _api.getPregnancyCheckForm(body);
  final resMap = res.toJson();
  final modelMap = _checkModel.toJson();

  resMap.remove(Const.KEY_TRIMESTER_ID);
  resMap.remove(Const.KEY_HPHT);
  modelMap.remove(Const.KEY_HPHT);

  prinr("resMap = $resMap");
  prinr("modelMap = $modelMap");

  prind("resMap.runtimeType= ${resMap.runtimeType}");
  prind("modelMap.runtimeType= ${modelMap.runtimeType}");

  assert(mapEquals(resMap, modelMap));
}
_getWarningTest() async {
  final body = PregnancyShowCheckBody(checkId: _checkId);
  final res = await _api.getPregnancyCheckWarning(body);
  prinr("res = $res");
  assert(res.code == 200);
}
_getImmunizationTest() async {
  final res = await _api.getPregnancyImmunization();
  prinr("res = $res");
  assert(res.isNotEmpty);
}
_sendImmunizationTest() async {
  final data = motherImmunizationList.firstWhere((element) => element.date != null);
  final body = PregnancyCreateImmunizationBody.fromModel(data: data, immunizationId: 1, pic: "pic");
  final res = await _api.sendPregnancyImmunization(body);
  prinr("res = $res");
  assert(res.code == 200);
}




_group2() {
  prinw("Mother Chart Group ========");

  group("Mother Chart Group", () {
    test("_getTfuChart", () async {
      prinw("_getTfuChart ========");
      await _getTfuChart();
      prinw("_getTfuChart ======== end");
    });

    print("");

    test("_getDjjChart", () async {
      prinw("_getDjjChart ========");
      await _getDjjChart();
      prinw("_getDjjChart ======== end");
    });

    print("");

    test("_getMapChart", () async {
      prinw("_getMapChart ========");
      await _getMapChart();
      prinw("_getMapChart ======== end");
    });

    print("");

    test("_getWeightChart", () async {
      prinw("_getWeightChart ========");
      await _getWeightChart();
      prinw("_getWeightChart ======== end");
    });

    print("");
  });

  prinw("Mother Chart Group ======== end");
}

_getTfuChart() async {
  final res = await _api.getPregnancyTfuChart();
  final map = res.map((e) => e.toJson());
  prind("res map = $map");
}

_getDjjChart() async {
  final res = await _api.getPregnancyDjjChart();
  final map = res.map((e) => e.toJson());
  prind("res map = $map");
}

_getMapChart() async {
  final res = await _api.getPregnancyMapChart();
  final map = res.map((e) => e.toJson());
  prind("res map = $map");
}

_getWeightChart() async {
  final res = await _api.getPregnancyWeightChart();
  final map = res.map((e) => e.toJson());
  prind("res map = $map");
}

/*
@GET("/overview")
Future<PregnancyHomeResponse> getHomeData();
@POST("/create-weekly-report")
Future<PregnancyCreateCheckResponse> sendPregnancyCheckForm(@Body() PregnancyCheckBody body);
@POST("/show-weekly-report")
Future<PregnancyCheckBody> getPregnancyCheckForm(@Body() PregnancyShowCheckBody body);
@POST("/show-weekly-report-analysis")
Future<PregnancyCheckFormWarningResponse> getPregnancyCheckWarning(@Body() PregnancyShowCheckBody body);
@GET("/immunization")
Future<List<PregnancyImmunizationResponse>> getPregnancyImmunization();

// ======= Chart =========

@GET("/graph/tfu")
Future<List<PregnancyChartTfuResponse>> getPregnancyTfuChart();
@GET("/graph/djj")
Future<List<PregnancyChartDjjResponse>> getPregnancyDjjChart();
@GET("/graph/map")
Future<List<PregnancyChartMapResponse>> getPregnancyMapChart();
@GET("/graph/weight")
Future<List<PregnancyChartWeightResponse>> getPregnancyWeightChart();
 */