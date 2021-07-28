
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/map_util.dart';
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

  factory MotherTfuChartData.fromJson(Map<String, dynamic> map) => 
      _$MotherTfuChartDataFromJson(parseAllValuesToNum(map));
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

  factory MotherDjjChartData.fromJson(Map<String, dynamic> map) => 
      _$MotherDjjChartDataFromJson(parseAllValuesToNum(map));
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

  factory MotherMapChartData.fromJson(Map<String, dynamic> map) => 
      _$MotherMapChartDataFromJson(parseAllValuesToNum(map));
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

  factory MotherBmiChartData.fromJson(Map<String, dynamic> map) => 
      _$MotherBmiChartDataFromJson(parseAllValuesToNum(map));
  Map<String, dynamic> toJson() => _$MotherBmiChartDataToJson(this);
}

class MotherChartLineSeries {
  MotherChartLineSeries._();

  static const _markerSetting = MarkerSettings(isVisible: true);


  static List<LineSeries<MotherTfuChartData, num>> getMotherTfuSeries(List<MotherTfuChartData> dataList) {
    final labels = [Strings.lower_limit, Strings.normal_limit, Strings.upper_limit, Strings.input];
    final getters = <num Function(MotherTfuChartData, int)>[
      (data, i) => data.lowerLimit,
      (data, i) => data.normalLimit,
      (data, i) => data.upperLimit,
      (data, i) => data.observed,
    ];
    return Charts.getLineSeriesList(
      dataList: dataList,
      labels: labels,
      yGetters: getters,
      xGetter: (data, i) => data.week,
    );
  }

  static List<LineSeries<MotherDjjChartData, num>> getMotherDjjSeries(List<MotherDjjChartData> dataList) {
    final labels = [Strings.lower_limit, Strings.upper_limit, Strings.input];
    final getters = <num Function(MotherDjjChartData, int)>[
          (data, i) => data.lowerLimit,
          (data, i) => data.upperLimit,
          (data, i) => data.observed,
    ];
    return Charts.getLineSeriesList(
      dataList: dataList,
      labels: labels,
      yGetters: getters,
      xGetter: (data, i) => data.week,
    );
  }

  static List<LineSeries<MotherMapChartData, num>> getMotherMapSeries(List<MotherMapChartData> dataList) {
    final labels = [Strings.lower_limit, Strings.input];
    final getters = <num Function(MotherMapChartData, int)>[
          (data, i) => data.lowerLimit,
          (data, i) => data.observed,
    ];
    return Charts.getLineSeriesList(
      dataList: dataList,
      labels: labels,
      yGetters: getters,
      xGetter: (data, i) => data.week,
    );
  }

  static List<LineSeries<MotherBmiChartData, num>> getMotherBmiSeries(List<MotherBmiChartData> dataList) {
    final labels = [Strings.normal_limit, Strings.over_limit, Strings.obese_limit, Strings.input,];
    final getters = <num Function(MotherBmiChartData, int)>[
          (data, i) => data.normalLimit,
          (data, i) => data.overLimit,
          (data, i) => data.obeseLimit,
          (data, i) => data.observed,
    ];
    return Charts.getLineSeriesList(
      dataList: dataList,
      labels: labels,
      yGetters: getters,
      xGetter: (data, i) => data.week,
    );
  }

/*
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
 */
}