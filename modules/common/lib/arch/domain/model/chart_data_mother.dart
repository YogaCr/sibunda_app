
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum MotherChartType {
  tfu, djj, map, bmi,
}

class MotherTfuChartData {
  final int week;
  final num upperLimit;
  final num lowerLimit;
  final num normalLimit;
  final num observed;

  MotherTfuChartData({
    required this.week,
    required this.upperLimit,
    required this.lowerLimit,
    required this.normalLimit,
    required this.observed,
  });
}

class MotherDjjChartData {
  final int week;
  final num upperLimit;
  final num lowerLimit;
  final num observed;

  MotherDjjChartData({
    required this.week,
    required this.upperLimit,
    required this.lowerLimit,
    required this.observed,
  });
}

class MotherMapChartData {
  final int week;
  final num lowerLimit;
  final num observed;

  MotherMapChartData({
    required this.week,
    required this.lowerLimit,
    required this.observed,
  });
}

class MotherBmiChartData {
  final int week;
  final num obeseLimit;
  final num overLimit;
  final num normalLimit;
  final num observed;

  MotherBmiChartData({
    required this.week,
    required this.obeseLimit,
    required this.overLimit,
    required this.normalLimit,
    required this.observed,
  });
}

class MotherChartLineSeries {
  MotherChartLineSeries._();

  static const _markerSetting = MarkerSettings(isVisible: true);

  static List<LineSeries<MotherTfuChartData, num>> getMotherTfuSeries(List<MotherTfuChartData> dataList) => [
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.lower_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.lowerLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.normal_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.normalLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.upper_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.upperLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.input,
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<MotherDjjChartData, num>> getMotherDjjSeries(List<MotherDjjChartData> dataList) => [
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.lower_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.lowerLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.upper_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.upperLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.input,
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<MotherMapChartData, num>> getMotherMapSeries(List<MotherMapChartData> dataList) => [
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.lower_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.lowerLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.input,
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<MotherBmiChartData, num>> getMotherBmiSeries(List<MotherBmiChartData> dataList) => [
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.normal_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.normalLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.over_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.overLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.obese_limit,
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.obeseLimit,
    ),
    LineSeries(
      markerSettings: _markerSetting,
      name: Strings.input,
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.week,
      yValueMapper: (data, i) => data.observed,
    ),
  ];
}