
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/repo/auth_repo.dart';
import 'package:core/domain/model/result.dart';


mixin Logout {
  Future<Result<bool>> call(SessionData data);
}

class LogoutImpl with Logout {
  final AuthRepo repo;
  LogoutImpl(this.repo);
  @override
  Future<Result<bool>> call(SessionData data) => repo.logout(data);
}