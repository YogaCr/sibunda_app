// User and Auth related repository.

import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/local/source/check_up_local_source.dart';
import 'package:common/arch/data/local/source/pregnancy_local_source.dart';
import 'package:common/arch/data/remote/api/auth_api.dart';
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:common/arch/data/remote/model/login_api_model.dart';
import 'package:common/arch/data/remote/model/logout_api_model.dart';
import 'package:common/arch/data/remote/model/register_api_model.dart';
import 'package:common/arch/di/api_di.dart';
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:core/util/annotation/data_annotation.dart';

import '../dummy_data.dart';

mixin AuthRepo {
  Future<Result<bool>> saveSignupData(SignUpData signup);
  Future<Result<bool>> signup({
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required List<Child> children,
    required DateTime? motherHpl,
  });
  Future<Result<SessionData>> login(LoginData data);
  Future<Result<bool>> logout(SessionData data);
  Future<Result<bool>> saveSession(SessionData data);
  /// Returns null if user hasn't logged in yet.
  Future<Result<SessionData?>> getSession();
  
  Future<Result<List<BatchProfileServer>>> getBio();
}

// Although it's a repo, but I feel the implementation is like use case.
class AuthRepoImpl with AuthRepo {
  final AuthApi _api;
  DataApi? _dataApi;
  final AccountLocalSrc _localSrc;
  final PregnancyLocalSrc _pregnancyLocalSrc;
  final CheckUpLocalSrc _checkUpLocalSrc;

  AuthRepoImpl({
    required AuthApi api,
    //required DataApi dataApi,
    required AccountLocalSrc localSrc,
    required PregnancyLocalSrc pregnancyLocalSrc,
    required CheckUpLocalSrc checkUpLocalSrc,
  }):
    _api = api,
    //_dataApi = dataApi,
    _localSrc = localSrc,
    _pregnancyLocalSrc = pregnancyLocalSrc,
    _checkUpLocalSrc = checkUpLocalSrc
  ;

  DataApi getDataApi() => _dataApi ??= ApiDi.dataApi;

  @override
  Future<Result<bool>> saveSignupData(SignUpData signup) async => Success(true); //For now, this is just for gymmic. it is because `SignUpData` is stored together with other get started related data.

  /// This method also calls login and downloads mother, father, and children data
  /// for the ids to be saved in local DB.
  @override
  Future<Result<bool>> signup({
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required List<Child> children,
    required DateTime? motherHpl,
  }) async {
    final body = RegisterBody(
      signup: signup,
      mother: mother,
      father: father,
      children: children,
      motherHpl: motherHpl,
    );
    try {
      final res = await _api.register(body);
      if(res.code != 200) {
        return Fail(code: res.code, msg: res.message);
      }
      prind("AuthRepoImpl.signup() _api.register() res= $res");
/*
      final userId = res.user.id;
      final userRole = res.user.groupId;
      final bioRes = await getDataApi().getBio();
      if(bioRes.code != 200) {
        return Fail(code: bioRes.code, msg: bioRes.message);
      }
      if(bioRes.data.isEmpty) {
        throw "`List<BioMotherResponse>` is empty";
      }
      final ids = BatchProfileIds.fromResponse(bioRes.data.first);

      final locRes = await _localSrc.saveBatchProfile(
        userId: userId, userRole: userRole, signup: signup,
        mother: mother, father: father, children: children,
        ids: ids,
      );
 */
      return Success(true);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Something error in this `$runtimeType`.signup()", error: e);
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
      VarDi.session = session;

      final bioRes = await getBio();
      if(bioRes is! Success<List<BatchProfileServer>>) {
        return Fail(msg: "Can't download `bio` when login");
      }

      final bioData = bioRes.data;

      for(final bio in bioData) {
        final saveBioRes = await _localSrc.saveBatchProfileRaw(
          userRole: DbConst.ROLE_USER, //TODO: Hardcoded role type
          signup: SignUpData(
            name: bio.mother.name,
            email: data.email,
            password: data.password,
          ),
          batchProfiles: bio,
        );
        if(saveBioRes is Fail<bool>) {
          return Fail(msg: "Can't save `bio` of '$bio' in local");
        }
      }
      VarDi.motherNik.value = bioData.first.mother.nik;
      prind("AuthRepo.login() VarDi.motherNik= ${VarDi.motherNik}");
      //VarDi.pregnancyWeek.value = bioData.first.mother;

      var locRes = await _localSrc.saveSession(session);
      if(locRes is! Success<bool>) {
        return Fail(msg: "Can't save `session` in local");
      }
      locRes = await _localSrc.saveCurrentEmail(data.email);
      if(locRes is! Success<bool>) {
        return Fail(msg: "Can't save `email` in local");
      }

      return Success(session, 200);
    } catch(e, stack) {
      final msg = "Error calling `login()`";
      prine("$msg, e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<bool>> logout(SessionData data) async {
    final body = LogoutBody(data);
    try {
      final res = await _api.logout(body);
      if(res.code != 200) {
        return Fail(code: res.code, msg: res.message);
      }

      var locRes = await _pregnancyLocalSrc.clear();
      if(locRes is! Success<bool>) {
        return Fail(msg: "Can't delete `checkUps` in local");
      }
      locRes = await _pregnancyLocalSrc.clear();
      if(locRes is! Success<bool>) {
        return Fail(msg: "Can't delete `pregnancy` data in local");
      }

      locRes = await _localSrc.deleteSession();
      if(locRes is! Success<bool>) {
        return Fail(msg: "Can't delete `session` in local");
      }
      locRes = await _localSrc.deleteCurrentEmail();
      if(locRes is! Success<bool>) {
        return Fail(msg: "Can't delete `email` in local");
      }

      locRes = await _localSrc.clear();
      if(locRes is! Success<bool>) {
        return Fail(msg: "Can't clear all `profile` in local");
      }
      return Success(true, 200);
    } catch(e, stack) {
      final msg = "Error calling `logout()`";
      prine("$msg, e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }

  @override
  Future<Result<bool>> saveSession(SessionData data) async {
    var locRes = await _localSrc.saveSession(data);
    if(locRes is! Success<bool>) {
      return Fail(msg: "Can't save `session` in local");
    }
    VarDi.session = data;
    return Success(true);
  }

  @override
  Future<Result<SessionData?>> getSession() => _localSrc.getSession();
  
  @override
  Future<Result<List<BatchProfileServer>>> getBio() async {
    try {
      final res = await getDataApi().getBio();
      if(res.code != 200) {
        return Fail(code: res.code, msg: "msg= '${res.message}', status= '${res.status}'",);
      }
      final list = res.data.map<BatchProfileServer>((e) =>
          BatchProfileServer.fromBioResponse(e)).toList(growable: false);

      return Success(list);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error calling `getBio()`, e= $e");
    }
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
  //static AuthDummyRepo? _instance;

  //factory AuthDummyRepo() => _instance ??= AuthDummyRepo._();
  AuthDummyRepo._();
  static final obj = AuthDummyRepo._();

  @override
  Future<Result<bool>> saveSignupData(SignUpData signup) async => Success(true);

  @override
  Future<Result<SessionData>> login(LoginData data) async => Success(dummySessionData1);

  @override
  Future<Result<bool>> signup({
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required List<Child> children,
    required DateTime? motherHpl,
  }) async => Success(true, 200);

  Future<Result<bool>> logout(SessionData data) async => Success(true, 200);

  @override
  Future<Result<SessionData?>> getSession() async => Success(dummySessionData1);

  @override
  Future<Result<bool>> saveSession(SessionData data) async => Success(true);
  
  @override
  Future<Result<List<BatchProfileServer>>> getBio() async => Success([dummyBatchProfile]);
}