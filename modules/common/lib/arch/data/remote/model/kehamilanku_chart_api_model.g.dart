// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_chart_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MotherTfuChartResponse _$_$_MotherTfuChartResponseFromJson(
    Map<String, dynamic> json) {
  return _$_MotherTfuChartResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    data: MotherTfuChartResponseData.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherTfuChartResponseToJson(
        _$_MotherTfuChartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };

_$_MotherTfuChartResponseData _$_$_MotherTfuChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _$_MotherTfuChartResponseData(
    data: (json['data'] as List<dynamic>)
        .map((e) => MotherTfuChartData.fromJson(e as Map<String, dynamic>))
        .toList(),
    desc: json['desc'] == null
        ? null
        : ChartWarningResponse.fromJson(json['desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherTfuChartResponseDataToJson(
        _$_MotherTfuChartResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'desc': instance.desc,
    };

_$_MotherDjjChartResponse _$_$_MotherDjjChartResponseFromJson(
    Map<String, dynamic> json) {
  return _$_MotherDjjChartResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    data: MotherDjjChartResponseData.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherDjjChartResponseToJson(
        _$_MotherDjjChartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };

_$_MotherDjjChartResponseData _$_$_MotherDjjChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _$_MotherDjjChartResponseData(
    data: (json['data'] as List<dynamic>)
        .map((e) => MotherDjjChartData.fromJson(e as Map<String, dynamic>))
        .toList(),
    desc: json['desc'] == null
        ? null
        : ChartWarningResponse.fromJson(json['desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherDjjChartResponseDataToJson(
        _$_MotherDjjChartResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'desc': instance.desc,
    };

_$_MotherMapChartResponse _$_$_MotherMapChartResponseFromJson(
    Map<String, dynamic> json) {
  return _$_MotherMapChartResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    data: MotherMapChartResponseData.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherMapChartResponseToJson(
        _$_MotherMapChartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };

_$_MotherMapChartResponseData _$_$_MotherMapChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _$_MotherMapChartResponseData(
    data: (json['data'] as List<dynamic>)
        .map((e) => MotherMapChartData.fromJson(e as Map<String, dynamic>))
        .toList(),
    desc: json['desc'] == null
        ? null
        : ChartWarningResponse.fromJson(json['desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherMapChartResponseDataToJson(
        _$_MotherMapChartResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'desc': instance.desc,
    };

_$_MotherBmiChartResponse _$_$_MotherBmiChartResponseFromJson(
    Map<String, dynamic> json) {
  return _$_MotherBmiChartResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    data: MotherBmiChartResponseData.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherBmiChartResponseToJson(
        _$_MotherBmiChartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };

_$_MotherBmiChartResponseData _$_$_MotherBmiChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _$_MotherBmiChartResponseData(
    data: (json['data'] as List<dynamic>)
        .map((e) => MotherBmiChartData.fromJson(e as Map<String, dynamic>))
        .toList(),
    desc: json['desc'] == null
        ? null
        : ChartWarningResponse.fromJson(json['desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MotherBmiChartResponseDataToJson(
        _$_MotherBmiChartResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'desc': instance.desc,
    };
