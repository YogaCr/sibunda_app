// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_chart_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyChartTfuResponse _$PregnancyChartTfuResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyChartTfuResponse(
    week: json['week'] as int,
    lowerLimit: json['bottom_threshold'] as num,
    normalLimit: json['normal_threshold'] as num,
    upperLimit: json['top_threshold'] as num,
    input: json['input'] as num,
  );
}

Map<String, dynamic> _$PregnancyChartTfuResponseToJson(
        PregnancyChartTfuResponse instance) =>
    <String, dynamic>{
      'week': instance.week,
      'bottom_threshold': instance.lowerLimit,
      'normal_threshold': instance.normalLimit,
      'top_threshold': instance.upperLimit,
      'input': instance.input,
    };

PregnancyChartDjjResponse _$PregnancyChartDjjResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyChartDjjResponse(
    week: json['week'] as int,
    lowerLimit: json['bottom_threshold'] as num,
    upperLimit: json['top_threshold'] as num,
    input: json['input'] as num,
  );
}

Map<String, dynamic> _$PregnancyChartDjjResponseToJson(
        PregnancyChartDjjResponse instance) =>
    <String, dynamic>{
      'week': instance.week,
      'bottom_threshold': instance.lowerLimit,
      'top_threshold': instance.upperLimit,
      'input': instance.input,
    };

PregnancyChartMapResponse _$PregnancyChartMapResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyChartMapResponse(
    week: json['week'] as int,
    upperLimit: json['top_threshold'] as num,
    input: json['input'] as num,
  );
}

Map<String, dynamic> _$PregnancyChartMapResponseToJson(
        PregnancyChartMapResponse instance) =>
    <String, dynamic>{
      'week': instance.week,
      'top_threshold': instance.upperLimit,
      'input': instance.input,
    };

PregnancyChartWeightResponse _$PregnancyChartWeightResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyChartWeightResponse(
    week: json['week'] as int,
    obeseLimit: json['bottom_obesity_threshold'] as num,
    overLimit: json['bottom_over_threshold'] as num,
    normalLimit: json['bottom_normal_threshold'] as num,
    input: json['input'] as num,
  );
}

Map<String, dynamic> _$PregnancyChartWeightResponseToJson(
        PregnancyChartWeightResponse instance) =>
    <String, dynamic>{
      'week': instance.week,
      'bottom_obesity_threshold': instance.obeseLimit,
      'bottom_over_threshold': instance.overLimit,
      'bottom_normal_threshold': instance.normalLimit,
      'input': instance.input,
    };
