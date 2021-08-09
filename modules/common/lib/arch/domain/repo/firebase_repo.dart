import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin FirebaseRepo {
  Future<Result<bool>> saveFcmToken(String token);
  Future<Result<String>> getFcmToken();
}

class FirebaseRepoImpl with FirebaseRepo {
  final SharedPreferences _sharedPref;

  FirebaseRepoImpl({
    required SharedPreferences sharedPref,
  }):
    _sharedPref = sharedPref
  ;

  @override
  Future<Result<bool>> saveFcmToken(String token) async {
    try {
      final res = await _sharedPref.setString(Const.KEY_FCM_TOKEN, token);
      return Success(res);
    } catch(e, stack) {
      final msg = "Error calling `saveToken()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
  @override
  Future<Result<String>> getFcmToken() async {
    try {
      final res = _sharedPref.getString(Const.KEY_FCM_TOKEN);
      if(res == null) {
        final msg = "Can't get FCM token";
        prine(msg);
        return Fail(msg: msg);
      }
      return Success(res);
    } catch(e, stack) {
      final msg = "Error calling `getToken()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
}


class FirebaseRepoDummy with FirebaseRepo {
  FirebaseRepoDummy._();
  static final obj = FirebaseRepoDummy._();

  @override
  Future<Result<String>> getFcmToken() async => Success(Const.DUMMY_FCM_TOKEN);

  @override
  Future<Result<bool>> saveFcmToken(String token) async => Success(true);
}