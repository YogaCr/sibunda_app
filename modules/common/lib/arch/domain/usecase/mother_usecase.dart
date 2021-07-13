import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin GetMotherNik {
  Future<Result<String>> call();
}

mixin GetPregnancyCheckUpId {
  Future<Result<PregnancyCheckUpId>> call(String motherNik, int week);
}

mixin GetMotherHpl {
  Future<Result<DateTime>> call(String motherNik);
}

mixin DeleteCurrentMotherHpl {
  Future<Result<bool>> call();
}

mixin GetMotherHpht {
  Future<Result<DateTime>> call(String motherNik);
}


class GetMotherNikImpl with GetMotherNik {
  final MotherRepo _repo;
  GetMotherNikImpl(this._repo);
  @override
  Future<Result<String>> call() => _repo.getMotherNik();
}

class GetPregnancyCheckUpIdImpl with GetPregnancyCheckUpId {
  final PregnancyRepo _repo;
  GetPregnancyCheckUpIdImpl(this._repo);
  @override
  Future<Result<PregnancyCheckUpId>> call(String motherNik, int week) async {
    //prind("GetPregnancyCheckUpIdImpl motherNik = $motherNik week = $week");
    final res = await _repo.getPregnancyCheckId(motherNik, week);
    prind("GetPregnancyCheckUpIdImpl res = $res");
    if(res is! Success<int>) {
      res as Fail<int>;
      return Fail(msg: res.msg, error: res.error, code: res.code);
    }
    return Success(
      PregnancyCheckUpId(motherNik: motherNik, week: week, id: res.data),
    );
  }
}

class GetMotherHplImpl with GetMotherHpl {
  final MotherRepo _repo;
  GetMotherHplImpl(this._repo);
  @override
  Future<Result<DateTime>> call(String motherNik) => _repo.getCurrentMotherHpl();
}

class DeleteCurrentMotherHplImpl with DeleteCurrentMotherHpl {
  final MotherRepo _repo;
  DeleteCurrentMotherHplImpl(this._repo);
  @override
  Future<Result<bool>> call() => _repo.deleteCurrentMotherHpl();
}

class GetMotherHphtImpl with GetMotherHpht {
  final MotherRepo _repo;
  GetMotherHphtImpl(this._repo);
  @override
  Future<Result<DateTime>> call(String motherNik) => _repo.getCurrentMotherHpht();
}