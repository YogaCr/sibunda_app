import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';

mixin MotherRepo {
  Future<Result<String>> getMotherNik();
  Future<Result<Mother>> getMotherData(String nik);
  Future<Result<bool>> saveMotherData(Mother data);
  Future<Result<List<MotherChartMenuData>>> getMotherPregnancyEvalGraphMenu();
  Future<Result<List<MotherChartMenuData>>> getMotherWeightGraphMenu();
}

class MotherRepoDummy with MotherRepo {
  MotherRepoDummy._();
  static final obj = MotherRepoDummy._();

  @override
  Future<Result<String>> getMotherNik() async => Success("0123012");
  @override
  Future<Result<Mother>> getMotherData(String nik) async => Success(dummyMother);
  @override
  Future<Result<bool>> saveMotherData(Mother data) async => Success(true);
  @override
  Future<Result<List<MotherChartMenuData>>> getMotherPregnancyEvalGraphMenu() async => Success(motherPregEvalGraphMenuList);
  @override
  Future<Result<List<MotherChartMenuData>>> getMotherWeightGraphMenu() async => Success(motherWeightGraphMenuList);
}