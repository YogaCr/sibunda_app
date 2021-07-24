import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/repo/chart_mother_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetMotherTfuChart {
  Future<Result<List<MotherTfuChartData>>> call(int pregnancyId);
}

mixin GetMotherDjjChart {
  Future<Result<List<MotherDjjChartData>>> call(int pregnancyId);
}

mixin GetMotherBmiChart {
  Future<Result<List<MotherBmiChartData>>> call(int pregnancyId);
}

mixin GetMotherMapChart {
  Future<Result<List<MotherMapChartData>>> call(int pregnancyId);
}



mixin GetMotherTfuChartWarning {
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId);
}

mixin GetMotherDjjChartWarning {
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId);
}

mixin GetMotherBmiChartWarning {
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId);
}

mixin GetMotherMapChartWarning {
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId);
}



class GetMotherTfuChartImpl with GetMotherTfuChart {
  final MotherChartRepo _repo;
  GetMotherTfuChartImpl(this._repo);
  @override
  Future<Result<List<MotherTfuChartData>>> call(int pregnancyId) => _repo.getMotherTfuChartData(pregnancyId);
}

class GetMotherDjjChartImpl with GetMotherDjjChart {
  final MotherChartRepo _repo;
  GetMotherDjjChartImpl(this._repo);
  @override
  Future<Result<List<MotherDjjChartData>>> call(int pregnancyId) => _repo.getMotherDjjChartData(pregnancyId);
}

class GetMotherBmiChartImpl with GetMotherBmiChart {
  final MotherChartRepo _repo;
  GetMotherBmiChartImpl(this._repo);
  @override
  Future<Result<List<MotherBmiChartData>>> call(int pregnancyId) => _repo.getMotherBmiChartData(pregnancyId);
}

class GetMotherMapChartImpl with GetMotherMapChart {
  final MotherChartRepo _repo;
  GetMotherMapChartImpl(this._repo);
  @override
  Future<Result<List<MotherMapChartData>>> call(int pregnancyId) => _repo.getMotherMapChartData(pregnancyId);
}



class GetMotherTfuChartWarningImpl with GetMotherTfuChartWarning {
  final MotherChartRepo _repo;
  GetMotherTfuChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId) => _repo.getMotherTfuChartWarning(pregnancyId);
}

class GetMotherDjjChartWarningImpl with GetMotherDjjChartWarning {
  final MotherChartRepo _repo;
  GetMotherDjjChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId) => _repo.getMotherDjjChartWaning(pregnancyId);
}

class GetMotherBmiChartWarningImpl with GetMotherBmiChartWarning {
  final MotherChartRepo _repo;
  GetMotherBmiChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId) => _repo.getMotherBmiChartWaning(pregnancyId);
}

class GetMotherMapChartWarningImpl with GetMotherMapChartWarning {
  final MotherChartRepo _repo;
  GetMotherMapChartWarningImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(int pregnancyId) => _repo.getMotherMapChartWaning(pregnancyId);
}