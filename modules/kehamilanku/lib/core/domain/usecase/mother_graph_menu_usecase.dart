import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin GetMotherPregEvalGraphMenu {
  Future<Result<List<MotherChartMenuData>>> call();
}


class GetMotherPregEvalGraphMenuImpl with GetMotherPregEvalGraphMenu {
  final PregnancyRepo _repo;
  GetMotherPregEvalGraphMenuImpl(this._repo);
  @override
  Future<Result<List<MotherChartMenuData>>> call() => _repo.getMotherPregnancyEvalGraphMenu();
}