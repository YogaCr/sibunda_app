import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin SaveChildData {
  Future<Result<bool>> call(Child data);
}

mixin SaveFatherData {
  Future<Result<bool>> call(Father data);
}

mixin SaveMotherData {
  Future<Result<bool>> call(Mother data);
}

mixin SaveMotherHpl {
  Future<Result<bool>> call(DateTime date);
}

mixin SaveLastChildBirthDate {
  Future<Result<bool>> call(DateTime date);
}

mixin SaveChildrenCount {
  Future<Result<bool>> call(int count);
}




class SaveChildDataImpl with SaveChildData {
  SaveChildDataImpl(this.repo);
  final ChildRepo repo;
  @override
  Future<Result<bool>> call(Child data) => repo.saveChildData(data);
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
  Future<Result<bool>> call(DateTime date) => _repo.saveMotherHpl(date);
}

class SaveLastChildBirthDateImpl with SaveLastChildBirthDate {
  final ChildRepo _repo;
  SaveLastChildBirthDateImpl(this._repo);
  Future<Result<bool>> call(DateTime date) => _repo.saveLastChildBirthDate(date);
}

class SaveChildrenCountImpl with SaveChildrenCount {
  final ChildRepo _repo;
  SaveChildrenCountImpl(this._repo);
  Future<Result<bool>> call(int count) => _repo.saveChildrenCount(count);
}