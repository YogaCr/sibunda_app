import 'package:common/arch/domain/repo/firebase_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetFcmToken {
  Future<Result<String>> call();
}
mixin SaveFcmToken {
  Future<Result<bool>> call(String token);
}


class GetFcmTokenImpl with GetFcmToken {
  final FirebaseRepo _repo;
  GetFcmTokenImpl(this._repo);
  @override
  Future<Result<String>> call() => _repo.getFcmToken();
}
class SaveFcmTokenImpl with SaveFcmToken {
  final FirebaseRepo _repo;
  SaveFcmTokenImpl(this._repo);
  @override
  Future<Result<bool>> call(String token) => _repo.saveFcmToken(token);
}