

import 'package:common/arch/data/remote/api/auth_api.dart';
import 'package:common/arch/data/remote/model/login_api_model.dart';
import 'package:common/arch/data/remote/model/logout_api_model.dart';
import 'package:common/arch/data/remote/model/register_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/util/net.dart';
import 'package:core/util/_consoles.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

//part 'home_unit_test.g.dart';


late SignUpData _signupData;
late Faker _faker;
late AuthApi _api;
late SessionData _session;


main() async {
  _faker = Faker();
  _api = AuthApi();

  _groupTest();
/*
  prinw("getStartedFormApiTest()");
  await getStartedFormApiTest();
  prinw("getStartedFormApiTest() === end");
 */
}


_groupTest(){
  group("Auth Test", () {
    test("Register Test", () async {
      prinw("getStartedFormApiTest_usingRetrofit()");
      await getStartedFormApiTest_usingRetrofit();
      prinw("getStartedFormApiTest_usingRetrofit() === end");
    });

    print("");

    test("Login Test", () async {
      prinw("loginTest()");
      await loginTest();
      prinw("loginTest() === end");
    });

    print("");

    test("Logout Test", () async {
      prinw("logoutTest()");
      await logoutTest();
      prinw("logoutTest() === end");
    });
  });
}

getStartedFormApiTest_usingRetrofit() async {
  final tag = DateTime.now().microsecondsSinceEpoch.toString();
  _signupData = SignUpData(
    name: _faker.person.name(),
    email: tag +_faker.internet.email(),
    password: _faker.internet.password(),
  );
  final mother = dummyMother;
  final father = dummyFather;
  final child = dummyChild;

  prind("signupData = $_signupData");


  final body = RegisterBody(
    motherHpl: DateTime.now(),
    signup: _signupData,
    children: [child],
    father: father,
    mother: mother,
  );

  final res = await _api.register(body);
  prinr("res = $res");

  assert(res.code == 200);
}

loginTest() async {
  final loginData = LoginData(email: _signupData.email, password: _signupData.password);
  final body = LoginBody(loginData);

  final res = await _api.login(body);
  prinr("res = $res");

  _session = SessionData(token: res.data.token, tokenType: res.data.tokenType);

  assert(res.code == 200);
}

logoutTest() async {
  final body = LogoutBody(_session);

  final res = await _api.logout(body);
  prinr("res = $res");

  assert(res.code == 200);
}


/*
getStartedFormApiTest() async {
  final faker = Faker();
  final tag = DateTime.now().microsecondsSinceEpoch.toString();
  final signupData = SignUpData(
    name: faker.person.name(),
    email: tag +faker.internet.email(),
    password: faker.internet.password(),
  );
  final mother = dummyMother;
  final father = dummyFather;
  final child = dummyChild;

  final url = Const.ENDPOINT_ROOT +"/auth/register";

  prind("signupData = $signupData");

  var signupMap = signupData.toJson;
  var motherMap = mother.toJson;
  var fatherMap = father.toJson;
  var childMap = child.toJson;

  motherMap[Const.KEY_SALARY] = motherMap[Const.KEY_SALARY].toString();
  motherMap[Const.KEY_BIRTH_PLACE] = 1104;
  fatherMap[Const.KEY_SALARY] = fatherMap[Const.KEY_SALARY].toString();
  fatherMap[Const.KEY_BIRTH_PLACE] = 1104;
  childMap[Const.KEY_BIRTH_PLACE] = 1104;

  motherMap = addPrefixToMapKeys(motherMap, "bunda_");
  fatherMap = addPrefixToMapKeys(fatherMap, "ayah_");
  //childMap = addPrefixToMapKeys(childMap, "anak_");

  prind("signupMap= $signupMap");
  prind("motherMap= $motherMap");
  prind("fatherMap= $fatherMap");
  prind("childMap= $childMap");

  final map = <String, dynamic>{
    ...signupMap,
    Const.KEY_RE_PSWD: signupData.password,
    ...motherMap,
    ...fatherMap,
    "anak" : [
      childMap,
    ],
  };

  final dio = Dio();
  final formData = FormData.fromMap(map);

  final response = await dio.post(
    url,
    data: map, options: SibDio.defaultOptions(),
  );
  final resp = SimpleNetResponse.from(response);
  prinr("result = $resp");

  assert(resp.statusCode == 200);
}

 */

/*
@RestApi(baseUrl: "https://api.github.com")
abstract class CobApi {
  factory CobApi(Dio dio, {String? baseUrl}) => _CobApi(dio);
  @GET("/users")
  Future<List<User>> getUsers();
  @GET("/users/{uname}/repos")
  Future<List<Repo>> getRepos(@Path() String uname);
}
 */