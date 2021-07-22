

import 'package:common/arch/data/remote/api/auth_api.dart';
import 'package:common/arch/data/remote/model/login_api_model.dart';
import 'package:common/arch/data/remote/model/logout_api_model.dart';
import 'package:common/arch/data/remote/model/register_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/util/net.dart';
import 'package:common/util/times.dart';
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
    signup: _signupData,
    children: [child],
    father: father,
    mother: mother,
    motherHpl: getHpl(),
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

