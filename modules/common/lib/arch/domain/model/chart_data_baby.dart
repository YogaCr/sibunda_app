
import 'package:common/arch/domain/usecase/chart_usecase.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chart_data.dart';
import 'img_data.dart';

part 'chart_data_baby.g.dart';

enum BabyChartType {
  weight, kms, len, weightToLen, head, bmi, dev
}

class BabyChartMenuData extends ChartMenuData {
  final BabyChartType type;

  BabyChartMenuData({
    required String title,
    required ImgData img,
    required this.type,
  }) : super(
    title: title,
    img: img,
  );
}

@JsonSerializable()
class BabyWeightChartData {
  @JsonKey(name: "month")
  final int age;
  @JsonKey(name: "minus_3_sd")
  final num min3sd;
  @JsonKey(name: "minus_2_sd")
  final num min2sd;
  @JsonKey(name: "minus_1_sd")
  final num min1sd;
  @JsonKey(name: "median")
  final num medianSd;
  @JsonKey(name: "plus_1_sd")
  final num plus1sd;
  @JsonKey(name: "plus_2_sd")
  final num plus2sd;
  @JsonKey(name: "plus_3_sd")
  final num plus3sd;
  @JsonKey(name: "input")
  final num observed;

  BabyWeightChartData({
    required this.age,
    required this.min3sd,
    required this.min2sd,
    required this.min1sd,
    required this.medianSd,
    required this.plus1sd,
    required this.plus2sd,
    required this.plus3sd,
    required this.observed,
  });

  factory BabyWeightChartData.fromJson(Map<String, dynamic> map) => _$BabyWeightChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$BabyWeightChartDataToJson(this);
}

class BabyKmsChartData {
  final int age;
  final num kbm;
  final num min3sd;
  final num min2sd;
  final num min1sd;
  final num medianSd;
  final num plus1sd;
  final num plus2sd;
  final num plus3sd;
  final num observed;

  BabyKmsChartData({
    required this.age,
    required this.kbm,
    required this.min3sd,
    required this.min2sd,
    required this.min1sd,
    required this.medianSd,
    required this.plus1sd,
    required this.plus2sd,
    required this.plus3sd,
    required this.observed,
  });
}

@JsonSerializable()
class BabyLenChartData {
  @JsonKey(name: "month")
  final int age;
  @JsonKey(name: "minus_3_sd")
  final num min3sd;
  @JsonKey(name: "minus_2_sd")
  final num min2sd;
  @JsonKey(name: "minus_1_sd")
  final num min1sd;
  @JsonKey(name: "median")
  final num medianSd;
  @JsonKey(name: "plus_1_sd")
  final num plus1sd;
  @JsonKey(name: "plus_2_sd")
  final num plus2sd;
  @JsonKey(name: "plus_3_sd")
  final num plus3sd;
  @JsonKey(name: "input")
  final num observed;

  BabyLenChartData({
    required this.age,
    required this.min3sd,
    required this.min2sd,
    required this.min1sd,
    required this.medianSd,
    required this.plus1sd,
    required this.plus2sd,
    required this.plus3sd,
    required this.observed,
  });

  factory BabyLenChartData.fromJson(Map<String, dynamic> map) => _$BabyLenChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$BabyLenChartDataToJson(this);
}

@JsonSerializable()
class BabyWeightToLenChartData {
  @JsonKey(name: "pb")
  final num len;
  @JsonKey(name: "minus_3_sd")
  final num min3sd;
  @JsonKey(name: "minus_2_sd")
  final num min2sd;
  @JsonKey(name: "minus_1_sd")
  final num min1sd;
  @JsonKey(name: "median")
  final num medianSd;
  @JsonKey(name: "plus_1_sd")
  final num plus1sd;
  @JsonKey(name: "plus_2_sd")
  final num plus2sd;
  @JsonKey(name: "plus_3_sd")
  final num plus3sd;
  @JsonKey(name: "input")
  final num observed;

  BabyWeightToLenChartData({
    required this.len,
    required this.min3sd,
    required this.min2sd,
    required this.min1sd,
    required this.medianSd,
    required this.plus1sd,
    required this.plus2sd,
    required this.plus3sd,
    required this.observed,
  });

  factory BabyWeightToLenChartData.fromJson(Map<String, dynamic> map) => _$BabyWeightToLenChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$BabyWeightToLenChartDataToJson(this);
}

@JsonSerializable()
class BabyHeadCircumChartData {
  @JsonKey(name: "month")
  final int age;
  @JsonKey(name: "minus_3_sd")
  final num min3sd;
  @JsonKey(name: "minus_2_sd")
  final num min2sd;
  @JsonKey(name: "minus_1_sd")
  final num min1sd;
  @JsonKey(name: "median")
  final num medianSd;
  @JsonKey(name: "plus_1_sd")
  final num plus1sd;
  @JsonKey(name: "plus_2_sd")
  final num plus2sd;
  @JsonKey(name: "plus_3_sd")
  final num plus3sd;
  @JsonKey(name: "input")
  final num observed;

  BabyHeadCircumChartData({
    required this.age,
    required this.min3sd,
    required this.min2sd,
    required this.min1sd,
    required this.medianSd,
    required this.plus1sd,
    required this.plus2sd,
    required this.plus3sd,
    required this.observed,
  });

  factory BabyHeadCircumChartData.fromJson(Map<String, dynamic> map) => _$BabyHeadCircumChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$BabyHeadCircumChartDataToJson(this);
}

@JsonSerializable()
class BabyBmiChartData {
  @JsonKey(name: "month")
  final int age;
  @JsonKey(name: "minus_3_sd")
  final num min3sd;
  @JsonKey(name: "minus_2_sd")
  final num min2sd;
  @JsonKey(name: "minus_1_sd")
  final num min1sd;
  @JsonKey(name: "median")
  final num medianSd;
  @JsonKey(name: "plus_1_sd")
  final num plus1sd;
  @JsonKey(name: "plus_2_sd")
  final num plus2sd;
  @JsonKey(name: "plus_3_sd")
  final num plus3sd;
  @JsonKey(name: "input")
  final num observed;

  BabyBmiChartData({
    required this.age,
    required this.min3sd,
    required this.min2sd,
    required this.min1sd,
    required this.medianSd,
    required this.plus1sd,
    required this.plus2sd,
    required this.plus3sd,
    required this.observed,
  });

  factory BabyBmiChartData.fromJson(Map<String, dynamic> map) => _$BabyBmiChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$BabyBmiChartDataToJson(this);
}

@JsonSerializable()
class BabyDevChartData {
  @JsonKey(name: Const.KEY_MONTH)
  final int age;
  @JsonKey(name: "s_threshold")
  final int normalLimit;
  @JsonKey(name: "m_threshold")
  final int doubtedLimit;
  @JsonKey(name: "input")
  final int observed;

  BabyDevChartData({
    required this.age,
    required this.normalLimit,
    required this.doubtedLimit,
    required this.observed,
  });

  String get status {
    if(observed <= 6)
      return "P"; // Parah
    else if(observed >= 9)
      return "S"; // Sesuai
    else
      return "M"; // Meragukan
  }

  factory BabyDevChartData.fromJson(Map<String, dynamic> map) => _$BabyDevChartDataFromJson(map);
  Map<String, dynamic> toJson() => _$BabyDevChartDataToJson(this);
}


class BabyChartLineSeries {
  BabyChartLineSeries._();

  static const _markerSetting = MarkerSettings(isVisible: true);

  static List<LineSeries<BabyWeightChartData, num>> getBabyWeightSeries(List<BabyWeightChartData> dataList) => [
    LineSeries(
			markerSettings: _markerSetting,
      name: "-1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Median",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.medianSd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Input (Kg)",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<BabyKmsChartData, num>> getBabyKmsSeries(List<BabyKmsChartData> dataList) => [
    LineSeries(
			markerSettings: _markerSetting,
      name: "-1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Median",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.medianSd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Input (Kg)",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<BabyLenChartData, num>> getBabyLenSeries(List<BabyLenChartData> dataList) => [
    LineSeries(
			markerSettings: _markerSetting,
      name: "-1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Median",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.medianSd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Input (cm)",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<BabyWeightToLenChartData, num>> getBabyWeightToLenSeries(List<BabyWeightToLenChartData> dataList) => [
    LineSeries(
			markerSettings: _markerSetting,
      name: "-1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.min1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.min2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.min3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Median",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.medianSd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.plus1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.plus2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.plus3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Input (cm)",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.len,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<BabyHeadCircumChartData, num>> getBabyHeadCircumSeries(List<BabyHeadCircumChartData> dataList) => [
    LineSeries(
			markerSettings: _markerSetting,
      name: "-1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Median",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.medianSd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Input (cm)",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<BabyBmiChartData, num>> getBabyBmiSeries(List<BabyBmiChartData> dataList) => [
    LineSeries(
			markerSettings: _markerSetting,
      name: "-1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "-3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.min3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Median",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.medianSd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+1 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus1sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+2 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus2sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "+3 SD",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.plus3sd,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Input (IMT)",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.observed,
    ),
  ];

  static List<LineSeries<BabyDevChartData, num>> getBabyDevSeries(List<BabyDevChartData> dataList) => [
    LineSeries(
			markerSettings: _markerSetting,
      name: "Meragukan",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.doubtedLimit,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Normal",
      animationDuration: chartAnimationDuration,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.normalLimit,
    ),
    LineSeries(
			markerSettings: _markerSetting,
      name: "Input 'Ya'",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.observed,
    ),
  ];
}