import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin SaveChildData {
  Future<Result<bool>> call(Child data);
}

class SaveChildDataImpl with SaveChildData {
  SaveChildDataImpl(this.repo);
  final ChildRepo repo;
  @override
  Future<Result<bool>> call(Child data) => repo.saveChildData(data);
}