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