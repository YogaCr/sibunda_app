import 'package:common/arch/domain/model/chart_data_mother.dart';
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
  }):
    _getMotherNik = getMotherNik,
    _getMotherBmiChart = getMotherBmiChart,
    _getMotherDjjChart = getMotherDjjChart,
    _getMotherMapChart = getMotherMapChart,
    _getMotherTfuChart = getMotherTfuChart
  ;
  final GetMotherNik _getMotherNik;
  final GetMotherTfuChart _getMotherTfuChart;
  final GetMotherDjjChart _getMotherDjjChart;
  final GetMotherBmiChart _getMotherBmiChart;
  final GetMotherMapChart _getMotherMapChart;

  final MutableLiveData<List<LineSeries<dynamic, num>>> _seriesList = MutableLiveData();
  LiveData<List<LineSeries<dynamic, num>>> get seriesList => _seriesList;

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

        switch(type) {
          case MotherChartType.tfu: res2 = await _getMotherTfuChart(motherNik);
            break;
          case MotherChartType.djj: res2 = await _getMotherDjjChart(motherNik);
            break;
          case MotherChartType.map: res2 = await _getMotherMapChart(motherNik);
            break;
          case MotherChartType.bmi: res2 = await _getMotherBmiChart(motherNik);
            break;
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