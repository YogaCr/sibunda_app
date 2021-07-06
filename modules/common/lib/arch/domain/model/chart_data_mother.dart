
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chart_data.dart';

part 'chart_data_mother.g.dart';

enum MotherChartType {
  tfu, djj, map, bmi,
}

class MotherChartMenuData extends ChartMenuData {
  final MotherChartType type;
  MotherChartMenuData({
    required String title,
    required ImgData img,
    required this.type,
  }) : super(
    title: title,
    img: img,
  );
}

@JsonSerializable()
class MotherTfuChartData {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_THRESHOLD)
  final num lowerLimit;
  @JsonKey(name: Const.KEY_NORMAL_THRESHOLD)
  final num normalLimit;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  @JsonKey(name: Const.KEY_INPUT)
  final num observed;

  MotherTfuChartData({
    required this.week,
    required this.upperLimit,
    required this.lowerLimit,
    required this.normalLimit,
    required this.observed,
  });

  factory MotherTfuChartData.fromJson(Map<String, dynamic> map) => _$MotherTfuChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$MotherTfuChartDataToJson(this);
}

@JsonSerializable()
class MotherDjjChartData {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_THRESHOLD)
  final num lowerLimit;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  @JsonKey(name: Const.KEY_INPUT)
  final num observed;

  MotherDjjChartData({
    required this.week,
    required this.upperLimit,
    required this.lowerLimit,
    required this.observed,
  });

  factory MotherDjjChartData.fromJson(Map<String, dynamic> map) => _$MotherDjjChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$MotherDjjChartDataToJson(this);
}

@JsonSerializable()
class MotherMapChartData {
  final int week;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num lowerLimit;
  @JsonKey(name: Const.KEY_INPUT)
  final num observed;

  MotherMapChartData({
    required this.week,
    required this.lowerLimit,
    required this.observed,
  });

  factory MotherMapChartData.fromJson(Map<String, dynamic> map) => _$MotherMapChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$MotherMapChartDataToJson(this);
}

@JsonSerializable()
class MotherBmiChartData {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_OBESITY_THRESHOLD)
  final num obeseLimit;
  @JsonKey(name: Const.KEY_BOTTOM_OVER_THRESHOLD)
  final num overLimit;
  @JsonKey(name: Const.KEY_BOTTOM_NORMAL_THRESHOLD)
  final num normalLimit;
  @JsonKey(name: Const.KEY_INPUT)
  final num observed;

  MotherBmiChartData({
    required this.week,
    required this.obeseLimit,
    required this.overLimit,
    required this.normalLimit,
    required this.observed,
  });

  factory MotherBmiChartData.fromJson(Map<String, dynamic> map) => _$MotherBmiChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$MotherBmiChartDataToJson(this);
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