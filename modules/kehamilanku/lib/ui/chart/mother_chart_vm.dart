import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/core/domain/usecase/mother_chart_usecase.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MotherChartVm extends AsyncAuthVm {
  static const loadChartKey = "loadChart";

  MotherChartVm({
    BuildContext? context,
    //required GetMotherNik getMotherNik,
    //required GetCurrentMotherPregnancyId getCurrentMotherPregnancyId,
    required this.pregnancyId,
    required GetMotherTfuChart getMotherTfuChart,
    required GetMotherDjjChart getMotherDjjChart,
    required GetMotherBmiChart getMotherBmiChart,
    required GetMotherMapChart getMotherMapChart,
    required GetMotherTfuChartWarning getMotherTfuChartWarning,
    required GetMotherDjjChartWarning getMotherDjjChartWarning,
    required GetMotherBmiChartWarning getMotherBmiChartWarning,
    required GetMotherMapChartWarning getMotherMapChartWarning,
  }):
    //_getMotherNik = getMotherNik,
    //_getCurrentMotherPregnancyId = getCurrentMotherPregnancyId,
    _getMotherBmiChart = getMotherBmiChart,
    _getMotherDjjChart = getMotherDjjChart,
    _getMotherMapChart = getMotherMapChart,
    _getMotherTfuChart = getMotherTfuChart,
    _getMotherTfuChartWarning = getMotherTfuChartWarning,
    _getMotherDjjChartWarning = getMotherDjjChartWarning,
    _getMotherBmiChartWarning = getMotherBmiChartWarning,
    _getMotherMapChartWarning = getMotherMapChartWarning, super(context: context)
  ;
  final ProfileCredential pregnancyId;

  //final GetMotherNik _getMotherNik;
  //final GetCurrentMotherPregnancyId _getCurrentMotherPregnancyId;
  final GetMotherTfuChart _getMotherTfuChart;
  final GetMotherDjjChart _getMotherDjjChart;
  final GetMotherBmiChart _getMotherBmiChart;
  final GetMotherMapChart _getMotherMapChart;

  final GetMotherTfuChartWarning _getMotherTfuChartWarning;
  final GetMotherDjjChartWarning _getMotherDjjChartWarning;
  final GetMotherBmiChartWarning _getMotherBmiChartWarning;
  final GetMotherMapChartWarning _getMotherMapChartWarning;


  final MutableLiveData<List<LineSeries<dynamic, num>>> _seriesList = MutableLiveData();
  final MutableLiveData<List<FormWarningStatus>> _warningList = MutableLiveData();

  LiveData<List<LineSeries<dynamic, num>>> get seriesList => _seriesList;
  LiveData<List<FormWarningStatus>> get warningList => _warningList;

  MotherChartType? _currentType;

  @override
  List<LiveData> get liveDatas => [_seriesList, _warningList,];

  void loadChart(MotherChartType type, { bool forceLoad = false }) {
    if(!forceLoad && type == _currentType) return;
    startJob(loadChartKey, (isActive) async {
      final pregnancyId = this.pregnancyId.id;

      Result res2;

      Result<List<FormWarningStatus>> res3;

      switch(type) {
        case MotherChartType.tfu: res2 = await _getMotherTfuChart(pregnancyId);
        res3 = await _getMotherTfuChartWarning(pregnancyId);
        break;
        case MotherChartType.djj: res2 = await _getMotherDjjChart(pregnancyId);
        res3 = await _getMotherDjjChartWarning(pregnancyId);
        break;
        case MotherChartType.map: res2 = await _getMotherMapChart(pregnancyId);
        res3 = await _getMotherMapChartWarning(pregnancyId);
        break;
        case MotherChartType.bmi: res2 = await _getMotherBmiChart(pregnancyId);
        res3 = await _getMotherBmiChartWarning(pregnancyId);
        break;
      }

      prind("MotherChartVm res2 = $res2 \n res3 = $res3");

      if(res3 is! Success<List<FormWarningStatus>>) {
        return res3 as Fail;
      }

      if(res2 is Success) {
        List<LineSeries<dynamic, num>> seriesList;

        switch(type) {
          case MotherChartType.tfu: seriesList = MotherChartLineSeries.getMotherTfuSeries(res2.data);
          break;
          case MotherChartType.djj: seriesList = MotherChartLineSeries.getMotherDjjSeries(res2.data);
          break;
          case MotherChartType.map: seriesList = MotherChartLineSeries.getMotherMapSeries(res2.data);
          break;
          case MotherChartType.bmi: seriesList = MotherChartLineSeries.getMotherBmiSeries(res2.data);
          break;
        }
        _seriesList.value = seriesList;
        _warningList.value = res3.data;
        _currentType = type;

        prind("MotherChartVm res3.data = ${res3.data}");

      } else {
        return res2 as Fail;
      }

    });
  }
}