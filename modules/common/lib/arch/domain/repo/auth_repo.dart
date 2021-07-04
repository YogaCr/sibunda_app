// User and Auth related repository.

import 'package:common/arch/data/remote/api/auth_api.dart';
import 'package:common/arch/data/remote/model/login_api_model.dart';
import 'package:common/arch/data/remote/model/logout_api_model.dart';
import 'package:common/arch/data/remote/model/register_api_model.dart';
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/annotation/data_annotation.dart';

import '../dummy_data.dart';

mixin AuthRepo {
  Future<Result<bool>> saveSignupData(SignUpData signup);
  Future<Result<bool>> signup({
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required Child child,
  });
  Future<Result<SessionData>> login(LoginData data);
  Future<Result<bool>> logout(SessionData data);
  Future<Result<bool>> saveSession(SessionData data);
  Future<Result<SessionData>> getSession();
}

class AuthRepoImpl with AuthRepo {
  final AuthApi _api;
  AuthRepoImpl(this._api);

  @override
  Future<Result<bool>> saveSignupData(SignUpData signup) async => Success(true); //For now, this is just for gymmic. it is because `SignUpData` is stored together with other get started related data.
  @override
  Future<Result<bool>> signup({
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required Child child,
  }) async {
    final body = RegisterBody(
      signup: signup,
      mother: mother,
      father: father,
      child: child,
    );
    try {
      final res = await _api.register(body);
      return res.code == 200
          ? Success(true, 200)
          : Fail(code: res.code, msg: res.message);
    } catch(e) {
      return Fail();
    }
  }

  @override
  Future<Result<SessionData>> login(LoginData data) async {
    final body = LoginBody(data);
    try {
      final res = await _api.login(body);
      if(res.code != 200) {
        return Fail(code: res.code, msg: res.message);
      }
      final session = SessionData(token: res.data.token, tokenType: res.data.tokenType,);
      return Success(session, 200);
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<bool>> logout(SessionData data) async {
    final body = LogoutBody(data);
    try {
      final res = await _api.logout(body);
      return res.code == 200
          ? Success(true, 200)
          : Fail(code: res.code, msg: res.message);
    } catch(e) {
      return Fail();
    }
  }

  //TODO yg lain
  @override
  Future<Result<bool>> saveSession(SessionData data) {
    VarDi.session = data;
    throw UnimplementedError();
  }
  @override
  Future<Result<SessionData>> getSession() {
    throw UnimplementedError();
  }
}

/*
class AuthApiRepo with AuthRepo {
  static AuthApiRepo? _instance;

  factory AuthApiRepo() => _instance ??= AuthApiRepo._();
  AuthApiRepo._();

  @override
  Future<Result<SessionData>> login(LoginData data) async {
    final resp = await Auth.login(data.email, data.password, NetConfig.CLIENT_SECRET, NetConfig.CLIENT_ID.toString());
    if(resp.statusCode == 200) {
      final token = resp.data["data"][Const.KEY_ACCESS_TOKEN];
      final session = SessionData(token);
      return Success(session);
    } else {
      return Fail(msg: resp.message, data: resp.data, code: resp.statusCode);
    }
  }

  @override
  Future<Result<bool>> signup(SignUpData data) async {
    final resp = await Auth.signUp(data.name, data.email, data.password);
    if(resp.statusCode == 200) {
      return Success(true, 200);
    } else {
      return Fail(msg: resp.message, data: resp.data, code: resp.statusCode);
    }
  }

  Future<Result<bool>> logout(String accessToken) async {
    final resp = await Auth.logout(accessToken);
    if(resp.statusCode == 200) {
      return Success(true, 200);
    } else {
      return Fail(msg: resp.message, data: resp.data, code: resp.statusCode);
    }
  }

  @override
  Future<Result<bool>> saveSession(SessionData data) {
    // TODO: implement saveSession
    throw UnimplementedError();
  }

  @override
  Future<Result<SessionData>> getSession() {
    // TODO: implement getSession
    throw UnimplementedError();
  }
}
 */


class AuthDummyRepo with AuthRepo {
  static AuthDummyRepo? _instance;

  factory AuthDummyRepo() => _instance ??= AuthDummyRepo._();
  AuthDummyRepo._();

  @override
  Future<Result<bool>> saveSignupData(SignUpData signup) async => Success(true);

  @override
  Future<Result<SessionData>> login(LoginData data) async => Success(dummySessionData1);

  @override
  Future<Result<bool>> signup({
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required Child child,
  }) async => Success(true, 200);

  Future<Result<bool>> logout(SessionData data) async => Success(true, 200);

  @override
  Future<Result<SessionData>> getSession() async => Success(dummySessionData1);

  @override
  Future<Result<bool>> saveSession(SessionData data) async => Success(true);
}