import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/model/baby_immunization_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/common_test_const.dart';

late BabyApi _api;

main() async {
  _api = BabyApi(await CommonTestConst.getDummySession());

  _group1();
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

_getHomeData() async {
  final res = await _api.getHomeData();
  final resMap = res.toJson();
  prinr("resMap = $resMap");
  assert(res.code == 200);
}
_getDevFormData() async {
  final res = await _api.getDevFormData(3);
  final resMap = res.map((e) => e.toJson());
  prinr("resMap = $resMap");
  assert(res.isNotEmpty);
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

/*
  @GET("/overview")
  Future<BabyHomeResponse> getHomeData();
  @GET("/perkembangan-questionnaire/{month}")
  Future<List<BabyCheckDevFormDataResponse>> getDevFormData(@Path("month") int month,);
  @GET("/immunization/{id}")
  Future<List<BabyImmunizationResponse>> getImmunization(@Path("id") String childId);
  @POST("/immunization")
  Future<CommonResponse> sendImmunization(@Body() BabyCreateImmunizationBody body);
 */