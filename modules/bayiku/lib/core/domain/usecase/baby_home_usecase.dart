import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetBabyAgeOverview {
  Future<Result<BabyAgeOverview>> call(String babyNik);
}

mixin GetBabyFormMenuList {
  Future<Result<List<BabyFormMenuData>>> call(int babyId);
}


class GetBabyAgeOverviewImpl with GetBabyAgeOverview {
  final MyBabyRepo _repo;
  GetBabyAgeOverviewImpl(this._repo);
  @override
  Future<Result<BabyAgeOverview>> call(String babyNik) async => _repo.getBabyAgeOverview(babyNik);
}

class GetBabyFormMenuListImpl with GetBabyFormMenuList {
  final MyBabyRepo _repo;
  GetBabyFormMenuListImpl(this._repo);
  @override
  Future<Result<List<BabyFormMenuData>>> call(int babyId) async =>
      _repo.getBabyFormMenu(babyId);
}

