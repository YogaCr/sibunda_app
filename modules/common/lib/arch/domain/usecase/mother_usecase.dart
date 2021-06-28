import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin GetMotherNik {
  Future<Result<String>> call();
}

class GetMotherNikImpl with GetMotherNik {
  final MotherRepo _repo;
  GetMotherNikImpl(this._repo);
  @override
  Future<Result<String>> call() => _repo.getMotherNik();
}