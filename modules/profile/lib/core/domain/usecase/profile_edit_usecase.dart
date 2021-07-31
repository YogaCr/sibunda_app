import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/repo/profile_repo.dart';
import 'package:core/domain/model/result.dart';

mixin SaveProfile {
  Future<Result<bool>> call(AccountData data, String? oldPswd);
}

class SaveProfileImpl with SaveProfile {
  final ProfileRepo _repo;
  SaveProfileImpl(this._repo);
  @override
  Future<Result<bool>> call(AccountData data, String? oldPswd) => _repo.saveProfile(data, oldPswd);
}