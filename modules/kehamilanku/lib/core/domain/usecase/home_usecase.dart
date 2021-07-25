import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetTrimesterList {
  Future<Result<List<MotherTrimester>>> call(int pregnancyId);
}

mixin GetMotherFoodRecomList {
  Future<Result<List<MotherFoodRecom>>> call(int pregnancyId, int pregnancyWeekAge);
}

mixin GetPregnancyAgeOverview {
  Future<Result<MotherPregnancyAgeOverview>> call(int pregnancyId);
}


class GetTrimesterListImpl with GetTrimesterList {
  GetTrimesterListImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<List<MotherTrimester>>> call(int pregnancyId) => _repo.getMotherTrimester(pregnancyId);
}
class GetMotherFoodRecomListImpl with GetMotherFoodRecomList {
  GetMotherFoodRecomListImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<List<MotherFoodRecom>>> call(int pregnancyId, int pregnancyWeekAge) => _repo.getMotherFoodRecoms(pregnancyId, pregnancyWeekAge);
}
class GetPregnancyAgeOverviewImpl with GetPregnancyAgeOverview {
  GetPregnancyAgeOverviewImpl(this._repo);
  final PregnancyRepo _repo;
  Future<Result<MotherPregnancyAgeOverview>> call(int pregnancyId) => _repo.getMotherPregnancyAgeOverview(pregnancyId);
}