import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/data/remote/model/baby_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/baby_immunization_api_model.dart';
import 'package:common/arch/data/remote/model/baby_neonatal_form_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/common_test_const.dart';

final _faker = Faker();
late BabyApi _api;
late BabyMonthlyFormBody _growthForm;
final int _month = 5;
late int _yearId;
late int _growthFormMonth;
late int _growthFormId;
late int _childId;
late List<BabyCheckDevFormDataResponse> _devQuestions;


main() async {
  _api = BabyApi(await CommonTestConst.getDummySession());

  _group1();
  print("");
  _group2();
  print("");
}

_group1() {
  prinw("Baby Overall Test ========");

  group("Baby Overall Test", () {
    test("_getHomeData", () async {
      prinw("_getHomeData ========");
      await _getHomeData();
      prinw("_getHomeData ======== end");
    });
    print("");
    test("_getDevFormData", () async {
      prinw("_getDevFormData ========");
      await _getDevFormData();
      prinw("_getDevFormData ======== end");
    });

    print("");

    test("_sendMonthlyForm", () async {
      prinw("_sendMonthlyForm ========");
      await _sendMonthlyForm();
      prinw("_sendMonthlyForm ======== end");
    });
    print("");
    test("_getShowMonthlyForm", () async {
      prinw("_getShowMonthlyForm ========");
      await _getShowMonthlyForm();
      prinw("_getShowMonthlyForm ======== end");
    });

    print("");

    test("_getFormWarning", () async {
      prinw("_getFormWarning ========");
      await _getFormWarning();
      prinw("_getFormWarning ======== end");
    });

    print("");

    test("_sendNeo6hForm", () async {
      prinw("_sendNeo6hForm ========");
      await _sendNeo6hForm();
      prinw("_sendNeo6hForm ======== end");
    });
    print("");
    test("_sendKn1Form", () async {
      prinw("_sendKn1Form ========");
      await _sendKn1Form();
      prinw("_sendKn1Form ======== end");
    });
    print("");
    test("_sendKn2Form", () async {
      prinw("_sendKn2Form ========");
      await _sendKn2Form();
      prinw("_sendKn2Form ======== end");
    });
    print("");
    test("_sendKn3Form", () async {
      prinw("_sendKn3Form ========");
      await _sendKn3Form();
      prinw("_sendKn3Form ======== end");
    });

    print("");

    test("_getImmunization", () async {
      prinw("_getImmunization ========");
      await _getImmunization();
      prinw("_getImmunization ======== end");
    });
    print("");
    test("_sendImmunization", () async {
      prinw("_sendImmunization ========");
      await _sendImmunization();
      prinw("_sendImmunization ======== end");
    });

    print("");

  });
  prinw("Baby Overall Test ======== end");
}

_group2() {
  prinw("Baby Chart Test ========");

  try {
    _childId;
  } catch(e) {
    _childId = 1;
  }

  group("Baby Chart Test", () {
    test("_getWeightChart", () async {
      prinw("_getWeightChart ========");
      await _getWeightChart();
      prinw("_getWeightChart ======== end");
    });

    print("");

    test("_getLenChart", () async {
      prinw("_getLenChart ========");
      await _getLenChart();
      prinw("_getLenChart ======== end");
    });

    print("");

    test("_getWeightToLenChart", () async {
      prinw("_getWeightToLenChart ========");
      await _getWeightToLenChart();
      prinw("_getWeightToLenChart ======== end");
    });

    print("");

    test("_getHeadCircumChart", () async {
      prinw("_getHeadCircumChart ========");
      await _getHeadCircumChart();
      prinw("_getHeadCircumChart ======== end");
    });

    print("");

    test("_getBmiChart", () async {
      prinw("_getBmiChart ========");
      await _getBmiChart();
      prinw("_getBmiChart ======== end");
    });

    print("");
  });

  prinw("Baby Chart Test ======== end");
}


_getHomeData() async {
  final res = await _api.getHomeData();
  final resMap = res.toJson();
  prinr("resMap = $resMap");
  assert(res.code == 200);
  _childId = res.data.first.id;
  _yearId = res.data.first.years.first.id;
}

_getDevFormData() async {
  final res = await _api.getDevFormData(_month);
  final resMap = res.map((e) => e.toJson());
  prinr("resMap = $resMap");

  _devQuestions = res;
  //assert(res.isNotEmpty);
}

_sendMonthlyForm() async {
  final devQ = _devQuestions.map((e) => BabyMonthlyDevFormBody(
    q_id: e.id,
    ans: _faker.randomGenerator.integer(2),
  )).toList(growable: false);

  final dummy = babyGrowthCheck;
  final body = BabyMonthlyFormBody.fromModel(dummy, yearId: _yearId, month: _month, perkembangan_ans: devQ);
  prind("body = ${body.toJson()}");
  final res = await _api.sendMonthlyForm(body);
  prinr("res = $res");
  assert(res.code == 200);
  _growthForm = body;
  _growthFormMonth = _month;
}
_getShowMonthlyForm() async {
  final body = BabyGetMonthlyFormBody(yearId: _yearId, month: _growthFormMonth);
  final res = await _api.getMonthlyForm(body);

  final resMap = res.toJson();
  prinr("res = $resMap");

  assert(res.id != null);

  resMap.remove("id");
  resMap.remove("perkembangan_ans");

  final sentMap = _growthForm.toJson();
  sentMap.remove("id");
  sentMap.remove("perkembangan_ans");

  prinr("resMap = $resMap");
  prinr("sentMap = $sentMap");

  assert(mapEquals(sentMap, resMap));

  _growthFormId = res.id!;
}

_getFormWarning() async {
  final body = BabyFormWarningBody(month: _month, yearId: _yearId);
  final res = await _api.getFormWarning(body);
  final resMap = res.toJson();
  prinr("res = $resMap");

  assert(res.code == 200);
}

_sendNeo6hForm() async {
  final dummy = neonatal6HourForm;
  final body = Neonatal6HourFormBody.fromModel(dummy, monthly_checkup_id: _growthFormId);
  prind("body = ${body.toJson()}");
  final res = await _api.sendNeo6hForm(body);
  prinr("res = $res");
  assert(res.code == 200);
}
_sendKn1Form() async {
  final dummy = neonatalKn1Form;
  final body = NeonatalKn1FormBody.fromModel(dummy, monthly_checkup_id: _growthFormId);
  prind("body = ${body.toJson()}");
  final res = await _api.sendKn1Form(body);
  prinr("res = $res");
  assert(res.code == 200);
}
_sendKn2Form() async {
  final dummy = neonatalKn2Form;
  final body = NeonatalKn2FormBody.fromModel(dummy, monthly_checkup_id: _growthFormId);
  prind("body = ${body.toJson()}");
  final res = await _api.sendKn2Form(body);
  prinr("res = $res");
  assert(res.code == 200);
}
_sendKn3Form() async {
  final dummy = neonatalKn3Form;
  final body = NeonatalKn3FormBody.fromModel(dummy, monthly_checkup_id: _growthFormId);
  prind("body = ${body.toJson()}");
  final res = await _api.sendKn3Form(body);
  prinr("res = $res");
  assert(res.code == 200);
}

_getImmunization() async {
  final res = await _api.getImmunization(1);
  final resMap = res.toJson();
  prinr("resMap = $resMap");
  assert(res.code == 200);
}
_sendImmunization() async {
  final data = babyImmunizationList.firstWhere((e) => e.date != null);
  final body = BabyCreateImmunizationBody.fromModel(data: data, immunizationId: 1, pic: "pic");
  final res = await _api.sendImmunization(body);
  prinr("res = $res");
  assert(res.code == 200);
}

_getWeightChart() async {
  final res = await _api.getWeightChart(_childId);
  prinr("res = ${res.map((e) => e.toJson()).toList()}");
  assert(res.isNotEmpty);
}
_getLenChart() async {
  final res = await _api.getLenChart(_childId);
  prinr("res = ${res.map((e) => e.toJson()).toList()}");
  assert(res.isNotEmpty);
}
_getWeightToLenChart() async {
  final res = await _api.getWeightToLenChart(_childId);
  prinr("res = ${res.map((e) => e.toJson()).toList()}");
  assert(res.isNotEmpty);
}
_getHeadCircumChart() async {
  final res = await _api.getHeadCircumChart(_childId);
  prinr("res = ${res.map((e) => e.toJson()).toList()}");
  assert(res.isNotEmpty);
}
_getBmiChart() async {
  final res = await _api.getBmiChart(_childId);
  prinr("res = ${res.map((e) => e.toJson()).toList()}");
  assert(res.isNotEmpty);
}

/*
  @GET("/overview")
  Future<BabyHomeResponse> getHomeData();

  @GET("/perkembangan-questionnaire/{month}")
  Future<List<BabyCheckDevFormDataResponse>> getDevFormData(@Path("month") int month,);

  @POST("/show-monthly-report")
  Future<BabyMonthlyFormBody> getMonthlyForm(@Body() BabyGetMonthlyFormBody body,);
  @POST("/create-monthly-report")
  Future<CommonResponse> sendMonthlyForm(@Body() BabyMonthlyFormBody body,);

  @POST("/show-monthly-report-analysis")
  Future<BabyFormWarningResponse> getFormWarning(@Body() BabyFormWarningBody body,);

  @POST("//create-neonatus-6-hours")
  Future<CommonResponse> sendNeo6hForm(@Body() Neonatal6HourFormBody body,);
  @POST("/create-neonatus-kn1")
  Future<CommonResponse> sendKn1Form(@Body() NeonatalKn1n2FormBody body,);
  @POST("/create-neonatus-kn2")
  Future<CommonResponse> sendKn2Form(@Body() NeonatalKn1n2FormBody body,);
  @POST("/create-neonatus-kn3")
  Future<CommonResponse> sendKn3Form(@Body() NeonatalKn3FormBody body,);

  @GET("/immunization/{id}")
  Future<BabyImmunizationResponse> getImmunization(@Path("id") int childId);
  @POST("/immunization")
  Future<CommonResponse> sendImmunization(@Body() BabyCreateImmunizationBody body);


  //============ Chart ==========

  @GET("/graph/bb-usia/{child_id}")
  Future<List<BabyWeightChartData>> getWeightChart(@Path("child_id") int childId,);
  @GET("/graph/pb-usia/{child_id}")
  Future<List<BabyLenChartData>> getLenChart(@Path("child_id") int childId,);
  @GET("/graph/bb-pb/{child_id}")
  Future<List<BabyWeightToLenChartData>> getWeightToLenChart(@Path("child_id") int childId,);
  @GET("/graph/lingkar-kepala/{child_id}")
  Future<List<BabyHeadCircumChartData>> getHeadCircumChart(@Path("child_id") int childId,);
  @GET("/graph/imt/{child_id}")
  Future<List<BabyBmiChartData>> getBmiChart(@Path("child_id") int childId,);
 */