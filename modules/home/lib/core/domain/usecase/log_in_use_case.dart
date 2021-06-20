
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/repo/auth_repo.dart';
import 'package:core/domain/model/result.dart';


mixin Login {
  Future<Result<SessionData>> call(LoginData data);
}

class LoginImpl with Login {
  final AuthRepo repo;
  LoginImpl(this.repo);
  @override
  Future<Result<SessionData>> call(LoginData data) => repo.login(data);
}