import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin SaveFatherData {
  Future<Result<bool>> call(Father data);
}

class SaveFatherDataImpl with SaveFatherData {
  SaveFatherDataImpl(this.repo);
  final FatherRepo repo;
  @override
  Future<Result<bool>> call(Father data) => repo.saveFatherData(data);
}