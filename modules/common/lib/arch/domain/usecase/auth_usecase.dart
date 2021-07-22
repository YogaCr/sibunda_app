import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/repo/auth_repo.dart';
import 'package:core/domain/model/result.dart';

mixin IsLoggedIn {
  Future<Result<bool>> call();
}

mixin InitConfig {
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
      if(session != null) {
        VarDi.session = session;
      }
      return Success(session != null);
    } else {
      return Fail();
    }
  }
}

class InitConfigImpl with InitConfig {
  final AccountLocalSrc _localSrc;
  InitConfigImpl(this._localSrc);
  @override
  Future<Result<bool>> call() async {
    final emailRes = await _localSrc.getCurrentEmail();
    var msg = "";
    if(emailRes is Success<String>) {
      final email = emailRes.data;
      final res = await _localSrc.getMotherNik(email);
      if(res is Success<String>) {
        final nik = res.data;
        VarDi.motherNik.value = nik;
        return Success(true);
      } else {
        msg = "Can't get local NIK with email of '$email'";
      }
    } else {
      msg = "Can't get local email";
    }
    return Fail(msg: msg);
  }
}