import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetBabyNik {
  Future<Result<String>> call();
}

class GetBabyNikImpl with GetBabyNik {
  final MyBabyRepo _repo;
  GetBabyNikImpl(this._repo);
  @override
  Future<Result<String>> call() => _repo.getBabyNik();
}