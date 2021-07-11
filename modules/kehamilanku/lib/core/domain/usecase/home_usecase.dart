import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetTrimesterList {
  Future<Result<List<MotherTrimester>>> call();
}

mixin GetMotherFoodRecomList {
  Future<Result<List<MotherFoodRecom>>> call(String motherNik, int pregnancyWeekAge);
}

mixin GetPregnancyAgeOverview {
  Future<Result<MotherPregnancyAgeOverview>> call(String motherNik);
}


class GetTrimesterListImpl with GetTrimesterList {
  GetTrimesterListImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<List<MotherTrimester>>> call() => _repo.getMotherTrimester();
}
class GetMotherFoodRecomListImpl with GetMotherFoodRecomList {
  GetMotherFoodRecomListImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<List<MotherFoodRecom>>> call(String motherNik, int pregnancyWeekAge) => _repo.getMotherFoodRecoms(motherNik, pregnancyWeekAge);
}
class GetPregnancyAgeOverviewImpl with GetPregnancyAgeOverview {
  GetPregnancyAgeOverviewImpl(this._repo);
  final PregnancyRepo _repo;
  Future<Result<MotherPregnancyAgeOverview>> call(String motherNik) => _repo.getMotherPregnancyAgeOverview(motherNik);
}