import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin GetTrimesterList {
  Future<Result<List<MotherTrimester>>> call();
}

mixin GetMotherFoodRecomList {
  Future<Result<List<MotherFoodRecom>>> call();
}

mixin GetPregnancyAgeOverview {
  Future<Result<MotherPregnancyAgeOverview>> call();
}


class GetTrimesterListImpl with GetTrimesterList {
  GetTrimesterListImpl(this._repo);
  final MotherPregnancyRepo _repo;
  @override
  Future<Result<List<MotherTrimester>>> call() => _repo.getMotherTrimester();
}
class GetMotherFoodRecomListImpl with GetMotherFoodRecomList {
  GetTrimesterListImpl(this._repo);
  final MotherPregnancyRepo _repo;
  @override
  Future<Result<List<MotherTrimester>>> call() => _repo.getMotherTrimester();
}