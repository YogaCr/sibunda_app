import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:kehamilanku/core/domain/usecase/mother_chart_usecase.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MotherChartVm extends AsyncVm {
  static const loadChartKey = "loadChart";

  MotherChartVm({
    required GetMotherNik getMotherNik,
    required GetMotherTfuChart getMotherTfuChart,
    required GetMotherDjjChart getMotherDjjChart,
    required GetMotherBmiChart getMotherBmiChart,
    required GetMotherMapChart getMotherMapChart,
    required GetMotherTfuChartWarning getMotherTfuChartWarning,
    required GetMotherDjjChartWarning getMotherDjjChartWarning,
    required GetMotherBmiChartWarning getMotherBmiChartWarning,
    required GetMotherMapChartWarning getMotherMapChartWarning,
  }):
    _getMotherNik = getMotherNik,
    _getMotherBmiChart = getMotherBmiChart,
    _getMotherDjjChart = getMotherDjjChart,
    _getMotherMapChart = getMotherMapChart,
    _getMotherTfuChart = getMotherTfuChart,
    _getMotherTfuChartWarning = getMotherTfuChartWarning,
    _getMotherDjjChartWarning = getMotherDjjChartWarning,
    _getMotherBmiChartWarning = getMotherBmiChartWarning,
    _getMotherMapChartWarning = getMotherMapChartWarning
  ;
  final GetMotherNik _getMotherNik;
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
  List<LiveData> get liveDatas => [_seriesList];

  void loadChart(MotherChartType type, { bool forceLoad = false }) {
    if(!forceLoad && type != _currentType) return;
    startJob(loadChartKey, (isActive) async {
      final res1 = await _getMotherNik();
      if(res1 is Success<String>) {
        final motherNik = res1.data;
        Result res2;

        Result<List<FormWarningStatus>> res3;

        switch(type) {
          case MotherChartType.tfu: res2 = await _getMotherTfuChart(motherNik);
            res3 = await _getMotherTfuChartWarning(motherNik);
            break;
          case MotherChartType.djj: res2 = await _getMotherDjjChart(motherNik);
            res3 = await _getMotherDjjChartWarning(motherNik);
            break;
          case MotherChartType.map: res2 = await _getMotherMapChart(motherNik);
            res3 = await _getMotherMapChartWarning(motherNik);
            break;
          case MotherChartType.bmi: res2 = await _getMotherBmiChart(motherNik);
            res3 = await _getMotherBmiChartWarning(motherNik);
            break;
        }

        if(res3 is! Success<List<FormWarningStatus>>) {
          return res3 as Fail; //TODO: Cek apakah operator is! itu benar
        }

        if(res2 is Success) {
          //final List rawDataList = res2.data;
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

        } else {
          return res2 as Fail;
        }

      } else {
        return res1 as Fail;
      }
    });
  }
}