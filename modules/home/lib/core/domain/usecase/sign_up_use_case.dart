import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/repo/auth_repo.dart';
import 'package:core/domain/model/result.dart';

mixin SignUp {
  Future<Result<bool>> call(SignUpData data);
}

class SignUpImpl with SignUp {
  final AuthRepo repo;
  SignUpImpl(this.repo);
  @override
  Future<Result<bool>> call(SignUpData data) => repo.signup(data);
}