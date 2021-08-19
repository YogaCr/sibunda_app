import 'package:bayiku/core/domain/usecase/baby_chart_usecase.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BabyChartVm extends AsyncAuthVm {
  static const loadChartKey = "loadChart";

  BabyChartVm({
    BuildContext? context,

    required this.credential,

    required GetBabyWeightChart getBabyWeightChart,
    required GetBabyKmsChart getBabyKmsChart,
    required GetBabyLenChart getBabyLenChart,
    required GetBabyWeightToLenChart getBabyWeightToLenChart,
    required GetBabyHeadCircumChart getBabyHeadCircumChart,
    required GetBabyBmiChart getBabyBmiChart,
    required GetBabyDevChart getBabyDevChart,

    required GetBabyWeightChartWarning getBabyWeightChartWarning,
    required GetBabyKmsChartWarning getBabyKmsChartWarning,
    required GetBabyLenChartWarning getBabyLenChartWarning,
    required GetBabyWeightToLenChartWarning getBabyWeightToLenChartWarning,
    required GetBabyHeadCircumChartWarning getBabyHeadCircumChartWarning,
    required GetBabyBmiChartWarning getBabyBmiChartWarning,
    required GetBabyDevChartWarning getBabyDevChartWarning,
  }):
    _getBabyWeightChart = getBabyWeightChart,
    _getBabyKmsChart = getBabyKmsChart,
    _getBabyLenChart = getBabyLenChart,
    _getBabyWeightToLenChart = getBabyWeightToLenChart,
    _getBabyHeadCircumChart = getBabyHeadCircumChart,
    _getBabyBmiChart = getBabyBmiChart,
    _getBabyDevChart = getBabyDevChart,
    _getBabyWeightChartWarning = getBabyWeightChartWarning,
    _getBabyKmsChartWarning = getBabyKmsChartWarning,
    _getBabyLenChartWarning = getBabyLenChartWarning,
    _getBabyWeightToLenChartWarning = getBabyWeightToLenChartWarning,
    _getBabyHeadCircumChartWarning = getBabyHeadCircumChartWarning,
    _getBabyBmiChartWarning = getBabyBmiChartWarning,
    _getBabyDevChartWarning = getBabyDevChartWarning, super(context: context)
  ;

  final GetBabyWeightChart _getBabyWeightChart;
  final GetBabyKmsChart _getBabyKmsChart;
  final GetBabyLenChart _getBabyLenChart;
  final GetBabyWeightToLenChart _getBabyWeightToLenChart;
  final GetBabyHeadCircumChart _getBabyHeadCircumChart;
  final GetBabyBmiChart _getBabyBmiChart;
  final GetBabyDevChart _getBabyDevChart;

  final GetBabyWeightChartWarning _getBabyWeightChartWarning;
  final GetBabyKmsChartWarning _getBabyKmsChartWarning;
  final GetBabyLenChartWarning _getBabyLenChartWarning;
  final GetBabyWeightToLenChartWarning _getBabyWeightToLenChartWarning;
  final GetBabyHeadCircumChartWarning _getBabyHeadCircumChartWarning;
  final GetBabyBmiChartWarning _getBabyBmiChartWarning;
  final GetBabyDevChartWarning _getBabyDevChartWarning;

  final ProfileCredential credential;

  final MutableLiveData<List<LineSeries<dynamic, num>>> _seriesList = MutableLiveData();
  final MutableLiveData<List<FormWarningStatus>> _warningList = MutableLiveData();

  LiveData<List<LineSeries<dynamic, num>>> get seriesList => _seriesList;
  LiveData<List<FormWarningStatus>> get warningList => _warningList;

  BabyChartType? _currentType;

  @override
  List<LiveData> get liveDatas => [_seriesList, _warningList,];

  void loadChart(BabyChartType type, { bool forceLoad = false }) {
    prind("MotherChartVm forceLoad = $forceLoad type = $type _currentType = $_currentType");
    if(!forceLoad && type == _currentType) return;
    //prind("MotherChartVm res2 = $res2 \n res3 = $res3");
    startJob(loadChartKey, (isActive) async {
      prind("BabyChartVm startJob AWAL =====");
      final babyNik = credential.nik; //res1.data[babyId];

      Result res2;

      Result<List<FormWarningStatus>> res3;

      switch(type) {
        case BabyChartType.kms: res2 = await _getBabyKmsChart(babyNik);
        res3 = await _getBabyKmsChartWarning(babyNik);
        break;
        case BabyChartType.len: res2 = await _getBabyLenChart(babyNik);
        res3 = await _getBabyLenChartWarning(babyNik);
        break;
        case BabyChartType.weight: res2 = await _getBabyWeightChart(babyNik);
        res3 = await _getBabyWeightChartWarning(babyNik);
        break;
        case BabyChartType.weightToLen: res2 = await _getBabyWeightToLenChart(babyNik);
        res3 = await _getBabyWeightToLenChartWarning(babyNik);
        break;
        case BabyChartType.bmi: res2 = await _getBabyBmiChart(babyNik);
        res3 = await _getBabyBmiChartWarning(babyNik);
        break;
        case BabyChartType.head: res2 = await _getBabyHeadCircumChart(babyNik);
        res3 = await _getBabyHeadCircumChartWarning(babyNik);
        break;
        case BabyChartType.dev: res2 = await _getBabyDevChart(babyNik);
        res3 = await _getBabyDevChartWarning(babyNik);
        break;
      }

      prind("MotherChartVm res2 = $res2 \n res3 = $res3");

      if(res3 is! Success<List<FormWarningStatus>>) {
        return res3 as Fail;
      }

      if(res2 is Success) {
        //final List rawDataList = res2.data;
        List<LineSeries<dynamic, num>> seriesList;

        switch(type) {
          case BabyChartType.kms: seriesList = BabyChartLineSeries.getBabyKmsSeries(res2.data);
          break;
          case BabyChartType.len: seriesList = BabyChartLineSeries.getBabyLenSeries(res2.data);
          break;
          case BabyChartType.weight: seriesList = BabyChartLineSeries.getBabyWeightSeries(res2.data);
          break;
          case BabyChartType.weightToLen: seriesList = BabyChartLineSeries.getBabyWeightToLenSeries(res2.data);
          break;
          case BabyChartType.bmi: seriesList = BabyChartLineSeries.getBabyBmiSeries(res2.data);
          break;
          case BabyChartType.head: seriesList = BabyChartLineSeries.getBabyHeadCircumSeries(res2.data);
          break;
          case BabyChartType.dev: seriesList = BabyChartLineSeries.getBabyDevSeries(res2.data);
          break;
        }
        _seriesList.value = seriesList;
        _warningList.value = res3.data;
        _currentType = type;

        prind("BabyChartVm res3.data = ${res3.data}");

      } else {
        return res2 as Fail;
      }

    });
  }
}