// User and Auth related repository.

import 'package:common/config/_config.dart';
import 'package:common/value/const_values.dart';
import 'package:common/data/Result.dart';
import 'package:common/data/model/auth_data.dart';
import 'package:common/util/_util.dart';
import 'package:common/config/network.dart';
import 'package:common/data/dummy_data.dart';

mixin AuthRepo {
  Future<Result<bool>> signup(SignUpData data);
  Future<Result<SessionData>> login(LoginData data);
  Future<Result<bool>> logout(String accessToken);
}

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
      return Fail(message: resp.message, data: resp.data, code: resp.statusCode);
    }
  }

  @override
  Future<Result<bool>> signup(SignUpData data) async {
    final resp = await Auth.signUp(data.name, data.email, data.password);
    if(resp.statusCode == 200) {
      return Success(true, 200);
    } else {
      return Fail(message: resp.message, data: resp.data, code: resp.statusCode);
    }
  }

  Future<Result<bool>> logout(String accessToken) async {
    final resp = await Auth.logout(accessToken);
    if(resp.statusCode == 200) {
      return Success(true, 200);
    } else {
      return Fail(message: resp.message, data: resp.data, code: resp.statusCode);
    }
  }
}


class AuthDummyRepo with AuthRepo {
  static AuthDummyRepo? _instance;

  factory AuthDummyRepo() => _instance ??= AuthDummyRepo._();
  AuthDummyRepo._();

  @override
  Future<Result<SessionData>> login(LoginData data) async => Success(dummySessionData1);

  @override
  Future<Result<bool>> signup(SignUpData data) async => Success(true, 200);

  Future<Result<bool>> logout(String accessToken) async => Success(true, 200);
}