import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
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



mixin GetMotherTfuChartWarning {
  Future<Result<List<FormWarningStatus>>> call(String motherNik);
}

mixin GetMotherDjjChartWarning {
  Future<Result<List<FormWarningStatus>>> call(String motherNik);
}

mixin GetMotherBmiChartWarning {
  Future<Result<List<FormWarningStatus>>> call(String motherNik);
}

mixin GetMotherMapChartWarning {
  Future<Result<List<FormWarningStatus>>> call(String motherNik);
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



class GetMotherTfuChartWarningImpl with GetMotherTfuChartWarning {
  final MotherChartRepo _repo;
  GetMotherTfuChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(String motherNik) => _repo.getMotherTfuChartWarning(motherNik);
}

class GetMotherDjjChartWarningImpl with GetMotherDjjChartWarning {
  final MotherChartRepo _repo;
  GetMotherDjjChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(String motherNik) => _repo.getMotherDjjChartWaning(motherNik);
}

class GetMotherBmiChartWarningImpl with GetMotherBmiChartWarning {
  final MotherChartRepo _repo;
  GetMotherBmiChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(String motherNik) => _repo.getMotherBmiChartWaning(motherNik);
}

class GetMotherMapChartWarningImpl with GetMotherMapChartWarning {
  final MotherChartRepo _repo;
  GetMotherMapChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(String motherNik) => _repo.getMotherMapChartWaning(motherNik);
}