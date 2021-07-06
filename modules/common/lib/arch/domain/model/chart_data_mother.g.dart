// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_mother.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotherTfuChartData _$MotherTfuChartDataFromJson(Map<String, dynamic> json) {
  return MotherTfuChartData(
    week: json['week'] as int,
    upperLimit: json['top_threshold'] as num,
    lowerLimit: json['bottom_threshold'] as num,
    normalLimit: json['normal_threshold'] as num,
    observed: json['input'] as num,
  );
}

Map<String, dynamic> _$MotherTfuChartDataToJson(MotherTfuChartData instance) =>
    <String, dynamic>{
      'week': instance.week,
      'bottom_threshold': instance.lowerLimit,
      'normal_threshold': instance.normalLimit,
      'top_threshold': instance.upperLimit,
      'input': instance.observed,
    };

MotherDjjChartData _$MotherDjjChartDataFromJson(Map<String, dynamic> json) {
  return MotherDjjChartData(
    week: json['week'] as int,
    upperLimit: json['top_threshold'] as num,
    lowerLimit: json['bottom_threshold'] as num,
    observed: json['input'] as num,
  );
}

Map<String, dynamic> _$MotherDjjChartDataToJson(MotherDjjChartData instance) =>
    <String, dynamic>{
      'week': instance.week,
      'bottom_threshold': instance.lowerLimit,
      'top_threshold': instance.upperLimit,
      'input': instance.observed,
    };

MotherMapChartData _$MotherMapChartDataFromJson(Map<String, dynamic> json) {
  return MotherMapChartData(
    week: json['week'] as int,
    lowerLimit: json['top_threshold'] as num,
    observed: json['input'] as num,
  );
}

Map<String, dynamic> _$MotherMapChartDataToJson(MotherMapChartData instance) =>
    <String, dynamic>{
      'week': instance.week,
      'top_threshold': instance.lowerLimit,
      'input': instance.observed,
    };

MotherBmiChartData _$MotherBmiChartDataFromJson(Map<String, dynamic> json) {
  return MotherBmiChartData(
    week: json['week'] as int,
    obeseLimit: json['bottom_obesity_threshold'] as num,
    overLimit: json['bottom_over_threshold'] as num,
    normalLimit: json['bottom_normal_threshold'] as num,
    observed: json['input'] as num,
  );
}

Map<String, dynamic> _$MotherBmiChartDataToJson(MotherBmiChartData instance) =>
    <String, dynamic>{
      'week': instance.week,
      'bottom_obesity_threshold': instance.obeseLimit,
      'bottom_over_threshold': instance.overLimit,
      'bottom_normal_threshold': instance.normalLimit,
      'input': instance.observed,
    };
