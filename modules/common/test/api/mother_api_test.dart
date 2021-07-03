import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/value/const_values.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/common_test_const.dart';

late KehamilankuApi _api;
late int _checkId;
late PregnancyCheck _checkModel;

main() async {
  _api = KehamilankuApi(CommonTestConst.dummySession);

  _group1();
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
  final checkMap = _checkModel.toJson();
  checkMap[Const.KEY_TRIMESTER_ID] = 1;
  final body = PregnancyCheckBody.fromJson(checkMap);
  final res = await _api.sendPregnancyCheckForm(body);
  prinr("res = $res");
  _checkId = res.checkupId.id;
  assert(res.code == 200);
}
_showCheckTest() async {
  final body = PregnancyShowCheckBody(checkId: _checkId);
  final res = await _api.getPregnancyCheckForm(body);
  final resMap = res.toJson();
  prinr("resMap = $resMap");

  resMap.remove(Const.KEY_TRIMESTER_ID);

  assert(resMap == _checkModel.toJson());
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