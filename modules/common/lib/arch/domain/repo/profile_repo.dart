
import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';

mixin ProfileRepo {
  Future<Result<Profile>> getProfile(String email);
  Future<Result<String>> getCurrentEmail();
  Future<Result<bool>> saveProfile(AccountData data, String? oldPswd);
}

class ProfileRepoImpl with ProfileRepo {
  final AccountLocalSrc _localSrc;

  ProfileRepoImpl({
    required AccountLocalSrc localSrc,
  }):
    _localSrc = localSrc
  ;

  @override
  Future<Result<Profile>> getProfile(String email) => _localSrc.getProfile(email);
  @override
  Future<Result<String>> getCurrentEmail() => _localSrc.getCurrentEmail();
  @override
  Future<Result<bool>> saveProfile(AccountData data, String? oldPswd) async => Success(true); //TODO: Repo dummy.
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
}