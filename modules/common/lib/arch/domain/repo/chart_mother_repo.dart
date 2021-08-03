import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/data/remote/model/kehamilanku_chart_api_model.dart';
import 'package:common/arch/domain/dummy_chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin MotherChartRepo {
  Future<Result<List<MotherTfuChartData>>> getMotherTfuChartData(int pregnancyId);
  Future<Result<List<MotherDjjChartData>>> getMotherDjjChartData(int pregnancyId);
  Future<Result<List<MotherBmiChartData>>> getMotherBmiChartData(int pregnancyId);
  Future<Result<List<MotherMapChartData>>> getMotherMapChartData(int pregnancyId);

  Future<Result<List<FormWarningStatus>>> getMotherTfuChartWarning(int pregnancyId);
  Future<Result<List<FormWarningStatus>>> getMotherDjjChartWaning(int pregnancyId);
  Future<Result<List<FormWarningStatus>>> getMotherBmiChartWaning(int pregnancyId);
  Future<Result<List<FormWarningStatus>>> getMotherMapChartWaning(int pregnancyId);
}


class MotherChartRepoImpl with MotherChartRepo {
  final KehamilankuApi _api;
  MotherChartRepoImpl({
    required KehamilankuApi api,
  }):
    _api = api
  ;

  final _chartResponse = <MotherChartType, dynamic>{};
  int? _currentId;
  int? get currentId => _currentId;
  set currentId(v) {
    if(v != _currentId) {
      _chartResponse.clear();
      _currentId = v;
    }
  }

  @override
  Future<Result<List<MotherTfuChartData>>> getMotherTfuChartData(int pregnancyId) async {
    try {
      final MotherTfuChartResponse resp =
        _chartResponse[MotherChartType.tfu] ??= await _api.getPregnancyTfuChart(pregnancyId);
      currentId = pregnancyId;
      return Success(resp.data.data);
    } catch(e, stack) {
      final msg = "Error calling `getMotherTfuChartData()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<List<MotherDjjChartData>>> getMotherDjjChartData(int pregnancyId) async {
    try {
      final MotherDjjChartResponse resp =
        _chartResponse[MotherChartType.djj] ??= await _api.getPregnancyDjjChart(pregnancyId);
      currentId = pregnancyId;
      return Success(resp.data.data);
    } catch(e, stack) {
      final msg = "Error calling `getMotherDjjChartData()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<List<MotherBmiChartData>>> getMotherBmiChartData(int pregnancyId) async {
    try {
      final MotherBmiChartResponse resp =
        _chartResponse[MotherChartType.bmi] ??= await _api.getPregnancyWeightChart(pregnancyId);
      currentId = pregnancyId;
      return Success(resp.data.data);
    } catch(e, stack) {
      final msg = "Error calling `getMotherBmiChartData()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<List<MotherMapChartData>>> getMotherMapChartData(int pregnancyId) async {
    try {
      final MotherMapChartResponse resp =
        _chartResponse[MotherChartType.map] ??= await _api.getPregnancyMapChart(pregnancyId);
      currentId = pregnancyId;
      return Success(resp.data.data);
    } catch(e, stack) {
      final msg = "Error calling `getMotherMapChartData()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }

  @override
  Future<Result<List<FormWarningStatus>>> getMotherTfuChartWarning(int pregnancyId) async {
    try {
      final MotherTfuChartResponse resp =
        _chartResponse[MotherChartType.tfu] ??= await _api.getPregnancyTfuChart(pregnancyId);
      currentId = pregnancyId;
      final raw = resp.data.desc;
      if(raw == null || raw.desc == null) {
        return Success(List.empty());
      }
      final data = FormWarningStatus.fromChartResponse(raw, isMother: true);
      return Success([data]);
    } catch(e, stack) {
      final msg = "Error calling `getMotherTfuChartWarning()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  } //async => Success(motherTfuWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherDjjChartWaning(int pregnancyId) async {
    try {
      final MotherDjjChartResponse resp =
      _chartResponse[MotherChartType.djj] ??= await _api.getPregnancyDjjChart(pregnancyId);
      currentId = pregnancyId;
      final raw = resp.data.desc;
      if(raw == null || raw.desc == null) {
        return Success(List.empty());
      }
      final data = FormWarningStatus.fromChartResponse(raw, isMother: true);
      return Success([data]);
    } catch(e, stack) {
      final msg = "Error calling `getMotherDjjChartWaning()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  } //async => Success(motherDjjWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherBmiChartWaning(int pregnancyId) async {
    try {
      final MotherBmiChartResponse resp =
        _chartResponse[MotherChartType.bmi] ??= await _api.getPregnancyWeightChart(pregnancyId);
      currentId = pregnancyId;
      final raw = resp.data.desc;
      if(raw == null || raw.desc == null) {
        return Success(List.empty());
      }
      final data = FormWarningStatus.fromChartResponse(raw, isMother: true);
      return Success([data]);
    } catch(e, stack) {
      final msg = "Error calling `getMotherBmiChartWaning()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  } //async => Success(motherBmiWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherMapChartWaning(int pregnancyId) async {
    try {
      final MotherMapChartResponse resp =
        _chartResponse[MotherChartType.map] ??= await _api.getPregnancyMapChart(pregnancyId);
      currentId = pregnancyId;
      final raw = resp.data.desc;
      if(raw == null || raw.desc == null) {
        return Success(List.empty());
      }
      final data = FormWarningStatus.fromChartResponse(raw, isMother: true);
      return Success([data]);
    } catch(e, stack) {
      final msg = "Error calling `getMotherMapChartWaning()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  } //async => Success(motherMapWarning);
}


class MotherChartRepoDummy with MotherChartRepo {
  MotherChartRepoDummy._();
  static final obj = MotherChartRepoDummy._();

  @override
  Future<Result<List<MotherTfuChartData>>> getMotherTfuChartData(int pregnancyId) async => Success(motherTfuData);
  @override
  Future<Result<List<MotherDjjChartData>>> getMotherDjjChartData(int pregnancyId) async => Success(motherDjjData);
  @override
  Future<Result<List<MotherBmiChartData>>> getMotherBmiChartData(int pregnancyId) async => Success(motherBmiData);
  @override
  Future<Result<List<MotherMapChartData>>> getMotherMapChartData(int pregnancyId) async => Success(motherMapData);

  @override
  Future<Result<List<FormWarningStatus>>> getMotherTfuChartWarning(int pregnancyId) async => Success(motherTfuWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherDjjChartWaning(int pregnancyId) async => Success(motherDjjWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherBmiChartWaning(int pregnancyId) async => Success(motherBmiWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getMotherMapChartWaning(int pregnancyId) async => Success(motherMapWarning);
}