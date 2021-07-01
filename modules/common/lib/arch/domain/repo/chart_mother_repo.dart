import 'package:common/arch/domain/dummy_chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:core/domain/model/result.dart';

mixin MotherChartRepo {
  Future<Result<List<MotherTfuChartData>>> getMotherTfuChartData(String motherNik);
  Future<Result<List<MotherDjjChartData>>> getMotherDjjChartData(String motherNik);
  Future<Result<List<MotherBmiChartData>>> getMotherBmiChartData(String motherNik);
  Future<Result<List<MotherMapChartData>>> getMotherMapChartData(String motherNik);

  Future<Result<List<FormWarningStatus>>> getMotherTfuChartWarning(String motherNik);
  Future<Result<List<FormWarningStatus>>> getMotherDjjChartWaning(String motherNik);
  Future<Result<List<FormWarningStatus>>> getMotherBmiChartWaning(String motherNik);
  Future<Result<List<FormWarningStatus>>> getMotherMapChartWaning(String motherNik);
}


class MotherChartRepoDummy with MotherChartRepo {
  MotherChartRepoDummy._();
  static final obj = MotherChartRepoDummy._();

  @override
  Future<Result<List<MotherTfuChartData>>> getMotherTfuChartData(String motherNik) async => Success(motherTfuData);
  @override
  Future<Result<List<MotherDjjChartData>>> getMotherDjjChartData(String motherNik) async => Success(motherDjjData);
  @override
  Future<Result<List<MotherBmiChartData>>> getMotherBmiChartData(String motherNik) async => Success(motherBmiData);
  @override
  Future<Result<List<MotherMapChartData>>> getMotherMapChartData(String motherNik) async => Success(motherMapData);

  @override
  Future<Result<List<FormWarningStatus>>> getMotherTfuChartWarning(String motherNik) async => Success(motherTfuWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherDjjChartWaning(String motherNik) async => Success(motherDjjWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherBmiChartWaning(String motherNik) async => Success(motherBmiWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherMapChartWaning(String motherNik) async => Success(motherMapWarning);
}