import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/repo/auth_repo.dart';
import 'package:core/domain/model/result.dart';

mixin IsLoggedIn {
  Future<Result<bool>> call();
}

class IsLoggedInImpl with IsLoggedIn {
  final AuthRepo _repo;
  IsLoggedInImpl(this._repo);
  @override
  Future<Result<bool>> call() async {
    final res = await _repo.getSession();
    if(res is Success<SessionData?>) {
      final session = res.data;
      return Success(session != null);
    } else {
      return Fail();
    }
  }
}