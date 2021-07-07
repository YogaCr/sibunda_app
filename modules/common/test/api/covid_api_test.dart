import 'package:common/arch/data/remote/api/covid_api.dart';
import 'package:common/arch/data/remote/model/covid_check_api_model.dart';
import 'package:common/arch/di/api_di.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

final _faker = Faker();
late CovidApi _api;
late List<CovidFormDataResponse> _formData;
late CovidCheckFormDataResponse _oneResponse;


main() async {
  await ConfigUtil.init();
  _api = ApiDi.covidApi;

  _group1();
  print("");
}

_group1() {
  group("Covid Overall Test", () {
    test("_getFormData", () async {
      prinw("_getFormData ==========");
      await _getFormData();
      prinw("_getFormData ========== end");
    });

    print("");

    test("_sendFormData", () async {
      prinw("_sendFormData ==========");
      await _sendFormData();
      prinw("_sendFormData ========== end");
    });

    print("");

    test("_getHistory", () async {
      prinw("_getHistory ==========");
      await _getHistory();
      prinw("_getHistory ========== end");
    });

    print("");
  });
}

_getFormData() async {
  final res = await _api.getFormData();
  assert(res.code == 200);
  assert(res.data.isNotEmpty);
  _formData = res.data;

  prinr("res = $res");
}

_sendFormData() async {
  final answers = <CovidCheckQuestionBody>[];
  for(final q in _formData) {
    answers.add(CovidCheckQuestionBody(
      q_id: q.id,
      ans: _faker.randomGenerator.integer(2),
    ));
  }

  final date = DateTime.now().toString();
  final body = CovidCheckFormBody(
    date: date,
    is_ibu: 0,
    anak_id: 2,
    answers: answers,
  );

  final res = await _api.sendFormData(body);
  assert(res.code == 200);
  _oneResponse = res.data;

  prinr("res = $res");
}

_getHistory() async {
  final res = await _api.getHistory();
  assert(res.code == 200);
  assert(res.data.isNotEmpty);

  //final respMap = _oneResponse.toson();
  //final historyMap = _oneResponse.toson();
  assert(res.data.contains(_oneResponse));

  prinr("res = $res");
}

/*
  @GET("/questionnaire")
  Future<CovidFormResponse> getFormData();
  @POST("/checkup")
  Future<CovidCheckFormResponse> sendFormData(@Body() CovidCheckFormBody body);
  @GET("/checkup")
  Future<CovidCheckHistoryResponse> getHistory();
 */