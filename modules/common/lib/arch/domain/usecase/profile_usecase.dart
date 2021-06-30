import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/repo/profile_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetProfile {
  Future<Result<Profile>> call(String email);
}

mixin GetCurrentEmail {
  Future<Result<String>> call();
}


class GetProfileImpl with GetProfile {
  final ProfileRepo _repo;
  GetProfileImpl(this._repo);

  @override
  Future<Result<Profile>> call(String email) => _repo.getProfile(email);
}

class GetCurrentEmailImpl with GetCurrentEmail {
  final ProfileRepo _repo;
  GetCurrentEmailImpl(this._repo);
  @override
  Future<Result<String>> call() => _repo.getCurrentEmail();
}