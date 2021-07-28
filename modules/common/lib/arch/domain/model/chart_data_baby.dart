
import 'package:common/arch/domain/usecase/chart_usecase.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/map_util.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/range.dart';
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

  factory BabyWeightChartData.fromJson(Map<String, dynamic> map) =>
      _$BabyWeightChartDataFromJson(parseAllValuesToNum(map));
  Map<String, dynamic> toJson() => _$BabyWeightChartDataToJson(this);
}

@JsonSerializable()
class BabyKmsChartData {
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

  BabyKmsChartData({
    required this.age,
    //required this.kbm,
    required this.min3sd,
    required this.min2sd,
    required this.min1sd,
    required this.medianSd,
    required this.plus1sd,
    required this.plus2sd,
    required this.plus3sd,
    required this.observed,
  });

  factory BabyKmsChartData.fromJson(Map<String, dynamic> map) =>
      _$BabyKmsChartDataFromJson(parseAllValuesToNum(map));
  Map<String, dynamic> toJson() => _$BabyKmsChartDataToJson(this);
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

  factory BabyLenChartData.fromJson(Map<String, dynamic> map) =>
      _$BabyLenChartDataFromJson(parseAllValuesToNum(map));
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

  factory BabyWeightToLenChartData.fromJson(Map<String, dynamic> map) =>
      _$BabyWeightToLenChartDataFromJson(parseAllValuesToNum(map));
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

  factory BabyHeadCircumChartData.fromJson(Map<String, dynamic> map) =>
      _$BabyHeadCircumChartDataFromJson(parseAllValuesToNum(map));
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

  factory BabyBmiChartData.fromJson(Map<String, dynamic> map) =>
      _$BabyBmiChartDataFromJson(parseAllValuesToNum(map));
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

  factory BabyDevChartData.fromJson(Map<String, dynamic> map) =>
      _$BabyDevChartDataFromJson(parseAllValuesToNum(map));
  Map<String, dynamic> toJson() => _$BabyDevChartDataToJson(this);
}


class BabyChartLineSeries {
  BabyChartLineSeries._();

  static final labelList_sd = ["-3 SD", "-2 SD", "-1 SD", "Median", "+1 SD", "+2 SD", "+3 SD", "Input"];
  static final keyList_sd = ["minus_3_sd", "minus_2_sd", "minus_1_sd", "median", "plus_1_sd", "plus_2_sd", "plus_3_sd", "input"];
  static final List<num Function(dynamic, int)> getterList_sd = [
        (data, i) => min1To0(data.min3sd),
        (data, i) => min1To0(data.min2sd),
        (data, i) => min1To0(data.min1sd),
        (data, i) => min1To0(data.medianSd),
        (data, i) => min1To0(data.plus1sd),
        (data, i) => min1To0(data.plus2sd),
        (data, i) => min1To0(data.plus3sd),
        (data, i) => min1To0(data.observed),
  ];
  static num min1To0(num i) => i != -1 ? i : 0;

  static List<LineSeries<T, num>> getBabyGenericSeries_sd<T>(List<T> dataList, {
    num Function(T, int)? xGetter,
  }) {
    return Charts.getLineSeriesList(
      dataList: dataList,
      labels: labelList_sd,
      yGetters: getterList_sd,
      xGetter: xGetter ?? (data, i) => (data as dynamic).age,
    );
    /*
    final lastComparedLimit = labelList_sd.length-1;
    return List.generate(labelList_sd.length, (i) {
      final label = labelList_sd[i];
      //final key = keyList_sd[i];
      final getter = getterList_sd[i];
      final isObserved = i >= lastComparedLimit;

      return LineSeries(
        dataLabelSettings: Charts.dataLabelSetting,
        markerSettings: Charts.getMarkerSetting(i, isObserved: isObserved),
        name: label,
        animationDuration: Charts.getAnimDuration(isObserved: isObserved),
        width: Charts.getChartLineWidth(isObserved: isObserved),
        dataSource: dataList,
        xValueMapper: (data, i) => (data as dynamic).age,
        yValueMapper: getter,
      );
    });
     */
  }

  static List<LineSeries<BabyWeightChartData, num>> getBabyWeightSeries(List<BabyWeightChartData> dataList) => getBabyGenericSeries_sd(dataList);
  static List<LineSeries<BabyKmsChartData, num>> getBabyKmsSeries(List<BabyKmsChartData> dataList) => getBabyGenericSeries_sd(dataList);
  static List<LineSeries<BabyLenChartData, num>> getBabyLenSeries(List<BabyLenChartData> dataList) => getBabyGenericSeries_sd(dataList);
  static List<LineSeries<BabyWeightToLenChartData, num>> getBabyWeightToLenSeries(List<BabyWeightToLenChartData> dataList) => getBabyGenericSeries_sd(
    dataList,
    xGetter: (data, i) => data.len,
  );
  static List<LineSeries<BabyHeadCircumChartData, num>> getBabyHeadCircumSeries(List<BabyHeadCircumChartData> dataList) => getBabyGenericSeries_sd(dataList);
  static List<LineSeries<BabyBmiChartData, num>> getBabyBmiSeries(List<BabyBmiChartData> dataList) => getBabyGenericSeries_sd(dataList);


  static List<LineSeries<BabyDevChartData, num>> getBabyDevSeries(List<BabyDevChartData> dataList) {
    final labels = ["Meragukan", "Normal", "Input 'Ya'"];
    final getters = <num Function(BabyDevChartData, int)>[
      (data, i) => data.doubtedLimit,
      (data, i) => data.normalLimit,
      (data, i) => data.observed,
    ];
    return Charts.getLineSeriesList(
      dataList: dataList,
      labels: labels,
      yGetters: getters,
      xGetter: (data, i) => data.age,
    );
  }

/*
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
 */
}