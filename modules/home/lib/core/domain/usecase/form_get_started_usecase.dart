import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin SaveChildrenData {
  Future<Result<bool>> call({
    required List<Child> data,
    required String email,
    required int? pregnancyId,
  });
}

mixin SaveFatherData {
  Future<Result<bool>> call(Father data);
}

mixin SaveMotherData {
  Future<Result<bool>> call(Mother data);
}

mixin SaveMotherHpl {
  Future<Result<bool>> call({
    required DateTime date,
    required String motherNik,
  });
}


mixin SaveChildrenCount {
  Future<Result<bool>> call(int count);
}

mixin DeleteCurrentMotherHpl {
  Future<Result<bool>> call();
}





class SaveFatherDataImpl with SaveFatherData {
  SaveFatherDataImpl(this.repo);
  final FatherRepo repo;
  @override
  Future<Result<bool>> call(Father data) => repo.saveFatherData(data);
}

class SaveMotherDataImpl with SaveMotherData {
  SaveMotherDataImpl(this.repo);
  final MotherRepo repo;
  @override
  Future<Result<bool>> call(Mother data) => repo.saveMotherData(data);
}

class SaveMotherHplImpl with SaveMotherHpl {
  final MotherRepo _repo;
  SaveMotherHplImpl(this._repo);
  Future<Result<bool>> call({
    required DateTime date,
    required String motherNik,
  }) => _repo.saveMotherHpl(
    date: date,
    motherNik: motherNik,
  );
}

class SaveChildrenCountImpl with SaveChildrenCount {
  final ChildRepo _repo;
  SaveChildrenCountImpl(this._repo);
  Future<Result<bool>> call(int count) => _repo.saveChildrenCount(count);
}
class SaveChildrenDataImpl with SaveChildrenData {
  final ChildRepo _repo;
  SaveChildrenDataImpl(this._repo);
  @override
  Future<Result<bool>> call({
    required List<Child> data,
    required String email,
    required int? pregnancyId,
  }) => _repo.saveChildrenData(
    data: data,
    email: email,
    pregnancyId: pregnancyId
  );
}

class DeleteCurrentMotherHplImpl with DeleteCurrentMotherHpl {
  final MotherRepo _repo;
  DeleteCurrentMotherHplImpl(this._repo);
  @override
  Future<Result<bool>> call() => _repo.deleteCurrentMotherHpl();
}