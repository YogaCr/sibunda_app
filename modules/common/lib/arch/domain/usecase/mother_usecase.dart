import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin GetMotherNik {
  Future<Result<String>> call();
}

mixin GetPregnancyCheckUpId {
  Future<Result<PregnancyCheckUpId>> call(int pregnancyId, int week);
}
/*
mixin GetCurrentMotherHpl {
  Future<Result<DateTime?>> call();
}

mixin DeleteCurrentMotherHpl {
  Future<Result<bool>> call();
}

mixin GetCurrentMotherHpht {
  Future<Result<DateTime?>> call();
}

mixin GetCurrentMotherPregnancyId {
  Future<Result<int?>> call();
}
 */

mixin GetMotherHpl {
  Future<Result<DateTime>> call(int pregnancyId);
}
mixin GetMotherPregnancy {
  Future<Result<List<PregnancyEntity>>> call(String motherNik);
}
mixin SaveMotherPregnancy {
  Future<Result<bool>> call({
    required String motherNik,
    required int id,
    required DateTime hpl,
  });
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
  Future<Result<PregnancyCheckUpId>> call(int pregnancyId, int week) async {
    //prind("GetPregnancyCheckUpIdImpl motherNik = $motherNik week = $week");
    final res = await _repo.getPregnancyCheckId(pregnancyId, week);
    prind("GetPregnancyCheckUpIdImpl res = $res");
    if(res is! Success<int>) {
      res as Fail<int>;
      return Fail(msg: res.msg, error: res.error, code: res.code);
    }
    return Success(
      PregnancyCheckUpId(pregnancyId: pregnancyId, week: week, id: res.data),
    );
  }
}
/*
class GetMotherHplImpl with GetCurrentMotherHpl {
  final MotherRepo _repo;
  GetMotherHplImpl(this._repo);
  @override
  Future<Result<DateTime?>> call() => _repo.getCurrentMotherHpl();
}

class DeleteCurrentMotherHplImpl with DeleteCurrentMotherHpl {
  final MotherRepo _repo;
  DeleteCurrentMotherHplImpl(this._repo);
  @override
  Future<Result<bool>> call() => _repo.deleteCurrentMotherHpl();
}

class GetCurrentMotherHphtImpl with GetCurrentMotherHpht {
  final MotherRepo _repo;
  GetCurrentMotherHphtImpl(this._repo);
  @override
  Future<Result<DateTime?>> call() => _repo.getCurrentMotherHpht();
}

class GetCurrentMotherPregnancyIdImpl with GetCurrentMotherPregnancyId {
  final MotherRepo _repo;
  GetCurrentMotherPregnancyIdImpl(this._repo);
  @override
  Future<Result<int?>> call() => _repo.getCurrentPregnancyId();
}
 */

class GetMotherHplImpl with GetMotherHpl {
  final MotherRepo _repo;
  GetMotherHplImpl(this._repo);
  @override
  Future<Result<DateTime>> call(int pregnancyId) => _repo.getMotherHpl(pregnancyId);
}
class GetMotherPregnancyImpl with GetMotherPregnancy {
  final MotherRepo _repo;
  GetMotherPregnancyImpl(this._repo);
  @override
  Future<Result<List<PregnancyEntity>>> call(String motherNik) => _repo.getPregnancyOfUser(motherNik);
}
class SaveMotherPregnancyImpl with SaveMotherPregnancy {
  final MotherRepo _repo;
  SaveMotherPregnancyImpl(this._repo);
  @override
  Future<Result<bool>> call({
    required String motherNik,
    required int id,
    required DateTime hpl,
  }) => _repo.savePregnancy(id: id, motherNik: motherNik, hpl: hpl);
}