import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin GetMotherNik {
  Future<Result<String>> call();
}

mixin GetPregnancyCheckUpId {
  Future<Result<PregnancyCheckUpId>> call(String motherNik, int week);
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
    final res = await _repo.getPregnancyCheckId(motherNik, week);
    if(res is! Success<int>) {
      return Fail();
    }
    return Success(
      PregnancyCheckUpId(motherNik: motherNik, week: week, id: res.data),
    );
  }
}