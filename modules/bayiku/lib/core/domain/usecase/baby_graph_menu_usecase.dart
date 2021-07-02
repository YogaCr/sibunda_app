import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetBabyGrowthGraphMenu {
  Future<Result<List<BabyChartMenuData>>> call();
}

class GetBabyGrowthGraphMenuImpl with GetBabyGrowthGraphMenu {
  final MyBabyRepo _repo;
  GetBabyGrowthGraphMenuImpl(this._repo);
  @override
  Future<Result<List<BabyChartMenuData>>> call() => _repo.getBabyGrowthGraphMenu();
}