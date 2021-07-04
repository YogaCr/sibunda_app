import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_chart_api_model.g.dart';

@JsonSerializable()
class PregnancyChartTfuResponse {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_THRESHOLD)
  final num lowerLimit;
  @JsonKey(name: Const.KEY_NORMAL_THRESHOLD)
  final num normalLimit;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  final num input;

  PregnancyChartTfuResponse({
  	required this.week,
  	required this.lowerLimit,
  	required this.normalLimit,
  	required this.upperLimit,
  	required this.input,
  });

  factory PregnancyChartTfuResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartTfuResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartTfuResponseToJson(this);
}

@JsonSerializable()
class PregnancyChartDjjResponse {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_THRESHOLD)
  final num lowerLimit;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  final num input;

  PregnancyChartDjjResponse({
  	required this.week,
  	required this.lowerLimit,
  	required this.upperLimit,
  	required this.input,
  });

  factory PregnancyChartDjjResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartDjjResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartDjjResponseToJson(this);
}

@JsonSerializable()
class PregnancyChartMapResponse {
  final int week;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  final num input;

  PregnancyChartMapResponse({
  	required this.week,
  	required this.upperLimit,
  	required this.input,
  });

  factory PregnancyChartMapResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartMapResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartMapResponseToJson(this);
}

@JsonSerializable()
class PregnancyChartWeightResponse {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_OBESITY_THRESHOLD)
  final num obeseLimit;
  @JsonKey(name: Const.KEY_BOTTOM_OVER_THRESHOLD)
  final num overLimit;
  @JsonKey(name: Const.KEY_BOTTOM_NORMAL_THRESHOLD)
  final num normalLimit;
  final num input;

  PregnancyChartWeightResponse({
  	required this.week,
  	required this.obeseLimit,
  	required this.overLimit,
  	required this.normalLimit,
  	required this.input,
  });

  factory PregnancyChartWeightResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartWeightResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartWeightResponseToJson(this);
}