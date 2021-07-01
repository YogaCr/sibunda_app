import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/repo/chart_mother_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetMotherTfuChart {
  Future<Result<List<MotherTfuChartData>>> call(String motherNik);
}

mixin GetMotherDjjChart {
  Future<Result<List<MotherDjjChartData>>> call(String motherNik);
}

mixin GetMotherBmiChart {
  Future<Result<List<MotherBmiChartData>>> call(String motherNik);
}

mixin GetMotherMapChart {
  Future<Result<List<MotherMapChartData>>> call(String motherNik);
}


class GetMotherTfuChartImpl with GetMotherTfuChart {
  final MotherChartRepo _repo;
  GetMotherTfuChartImpl(this._repo);
  @override
  Future<Result<List<MotherTfuChartData>>> call(String motherNik) => _repo.getMotherTfuChartData(motherNik);
}

class GetMotherDjjChartImpl with GetMotherDjjChart {
  final MotherChartRepo _repo;
  GetMotherDjjChartImpl(this._repo);
  @override
  Future<Result<List<MotherDjjChartData>>> call(String motherNik) => _repo.getMotherDjjChartData(motherNik);
}

class GetMotherBmiChartImpl with GetMotherBmiChart {
  final MotherChartRepo _repo;
  GetMotherBmiChartImpl(this._repo);
  @override
  Future<Result<List<MotherBmiChartData>>> call(String motherNik) => _repo.getMotherBmiChartData(motherNik);
}

class GetMotherMapChartImpl with GetMotherMapChart {
  final MotherChartRepo _repo;
  GetMotherMapChartImpl(this._repo);
  @override
  Future<Result<List<MotherMapChartData>>> call(String motherNik) => _repo.getMotherMapChartData(motherNik);
}




