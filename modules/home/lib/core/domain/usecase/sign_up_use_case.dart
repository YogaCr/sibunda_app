import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/arch/domain/repo/auth_repo.dart';
import 'package:core/domain/model/result.dart';

mixin SaveSignUpData {
  Future<Result<bool>> call(SignUpData data);
}

mixin SignUpAndRegisterOtherData {
  Future<Result<bool>> call({
    required SignUpData signup,
    required Mother? mother,
    required Father? father,
    required List<Child> children,
    required DateTime? motherHpl,
  });
}


class SaveSignUpDataImpl with SaveSignUpData {
  final AuthRepo repo;
  SaveSignUpDataImpl(this.repo);
  @override
  Future<Result<bool>> call(SignUpData data) => repo.saveSignupData(data);
}

class SignUpAndRegisterOtherDataImpl with SignUpAndRegisterOtherData {
  final AuthRepo _repo;
  SignUpAndRegisterOtherDataImpl(this._repo);
  @override
  Future<Result<bool>> call({
    required SignUpData signup,
    required Mother? mother,
    required Father? father,
    required List<Child> children,
    required DateTime? motherHpl,
  }) => _repo.signup(
    signup: signup, mother: mother, father: father,
    children: children, motherHpl: motherHpl,
  );
}
