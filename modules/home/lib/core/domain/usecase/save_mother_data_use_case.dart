import 'package:common/arch/domain/model/mother.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin SaveMotherData {
  Future<Result<bool>> call(Mother data);
}

class SaveMotherDataImpl with SaveMotherData {
  SaveMotherDataImpl(this.repo);
  final MotherRepo repo;
  @override
  Future<Result<bool>> call(Mother data) => repo.saveMotherData(data);
}