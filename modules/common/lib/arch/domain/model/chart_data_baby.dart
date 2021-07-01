
import 'package:common/res/theme/_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BabyWeightChartData {
  final int age;
  final num min3sd;
  final num min2sd;
  final num min1sd;
  final num medianSd;
  final num plus1sd;
  final num plus2sd;
  final num plus3sd;
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

class BabyLenChartData {
  final int age;
  final num min3sd;
  final num min2sd;
  final num min1sd;
  final num medianSd;
  final num plus1sd;
  final num plus2sd;
  final num plus3sd;
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
}

class BabyWeightToLenChartData {
  final int age;
  final num min3sd;
  final num min2sd;
  final num min1sd;
  final num medianSd;
  final num plus1sd;
  final num plus2sd;
  final num plus3sd;
  final num observed;

  BabyWeightToLenChartData({
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
}

class BabyHeadCircumChartData {
  final int age;
  final num min3sd;
  final num min2sd;
  final num min1sd;
  final num medianSd;
  final num plus1sd;
  final num plus2sd;
  final num plus3sd;
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
}

class BabyBmiChartData {
  final int age;
  final num min3sd;
  final num min2sd;
  final num min1sd;
  final num medianSd;
  final num plus1sd;
  final num plus2sd;
  final num plus3sd;
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
}

class BabyDevChartData {
  final int age;
  final int normalLimit;
  final int doubtedLimit;
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

  static List<LineSeries<BabyKmsChartData, num>> getBabyKbmSeries(List<BabyKmsChartData> dataList) => [
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
      name: "Input (Kg)",
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
      name: "Input (Kg)",
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
      name: "Input (Kg)",
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
      name: "Input",
      animationDuration: chartAnimationDuration +chartAnimationDurationOffset,
      width: chartLineWidth,
      dataSource: dataList,
      xValueMapper: (data, i) => data.age,
      yValueMapper: (data, i) => data.observed,
    ),
  ];
}