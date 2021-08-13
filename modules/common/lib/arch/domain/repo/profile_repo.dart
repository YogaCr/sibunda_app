
import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:common/arch/data/remote/model/data_api_model.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

import '../dummy_data.dart';

mixin ProfileRepo {
  static const CODE_PSWD_MISMATCH = 404;

  Future<Result<Profile>> getProfile(String email);
  Future<Result<Map<int, List<Profile>>>> getFamilyProfile(String email);
  Future<Result<String>> getCurrentEmail();
  Future<Result<bool>> saveProfile(AccountData data, String? oldPswd);
  /// Check if [password] is same as saved in local.
  Future<Result<bool>> checkCurrentPswd(String password);
}

class ProfileRepoImpl with ProfileRepo {
  final AccountLocalSrc _localSrc;
  final DataApi _dataApi;

  ProfileRepoImpl({
    required AccountLocalSrc localSrc,
    required DataApi dataApi,
  }):
    _localSrc = localSrc,
    _dataApi = dataApi
  ;

  @override
  Future<Result<Profile>> getProfile(String email) => _localSrc.getProfile(email);
  @override
  Future<Result<Map<int, List<Profile>>>> getFamilyProfile(String email) => _localSrc.getFamilyProfile(email);
  @override
  Future<Result<String>> getCurrentEmail() => _localSrc.getCurrentEmail();
  @override
  Future<Result<bool>> saveProfile(AccountData data, String? oldPswd) async {
    try {
      if(data.pswd?.isNotEmpty == true) {
        if(oldPswd == null) {
          final msg = "The user attempts to change password but doesn't type the old password";
          prine(msg);
          return Fail(msg: msg, code: ProfileRepo.CODE_PSWD_MISMATCH,);
        }
        final res = await checkCurrentPswd(oldPswd);
        if(res is Fail<bool>) {
          return res;
        }
        final success = (res as Success<bool>).data;
        if(!success) {
          final msg = "Something wrong happened when check the old password";
          prine(msg);
          return Fail(msg: msg,);
        }
      }
      final body = SaveProfileBody(
        email: data.email,
        name: data.name,
        password: data.pswd,
      );
      final res = await _dataApi.saveProfile(body);
      if(res.code != 200) {
        final msg = "Can't save edited profile";
        prine("$msg; res= $res");
        return Fail(msg: "$msg; res = ${res.message}", code: res.code);
      }
      return Success(true);
    } catch(e, stack) {
      final msg = "Error calling `saveProfile()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e,);
    }
  }
  @override
  Future<Result<bool>> checkCurrentPswd(String password) => _localSrc.checkCurrentPswd(password);
}

class ProfileRepoDummy with ProfileRepo {
  ProfileRepoDummy._();
  static final obj = ProfileRepoDummy._();
  @override
  Future<Result<Profile>> getProfile(String email) async => Success(dummyProfile);
  @override
  Future<Result<String>> getCurrentEmail() async => Success(dummyEmail);
  @override
  Future<Result<bool>> saveProfile(AccountData data, String? oldPswd) async => Success(true);
  @override
  Future<Result<bool>> checkCurrentPswd(String password) async => Success(true);
  @override
  Future<Result<Map<int, List<Profile>>>> getFamilyProfile(String email) async => Success({
    DbConst.TYPE_MOTHER: [dummyProfileMother_domain],
    DbConst.TYPE_FATHER: [dummyProfileFather_domain],
    DbConst.TYPE_CHILD: [
      dummyProfileChild_domain,
      dummyProfileChild2_domain,
      dummyProfileChild3_domain,
      dummyProfileChild4_domain,
    ],
  });
}