// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dashboard_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDashboardResponse _$HomeDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return HomeDashboardResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: HomeDashboardDataResponse.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeDashboardResponseToJson(
        HomeDashboardResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

HomeDashboardDataResponse _$HomeDashboardDataResponseFromJson(
    Map<String, dynamic> json) {
  return HomeDashboardDataResponse(
    header: HomeDashboardDataHeaderResponse.fromJson(
        json['header'] as Map<String, dynamic>),
    kesehatan_keluarga: (json['kesehatan_keluarga'] as List<dynamic>)
        .map((e) => HomeDashboardDataWarningResponse.fromJson(
            e as Map<String, dynamic>))
        .toList(),
    tips_dan_info: (json['tips_dan_info'] as List<dynamic>)
        .map((e) => TipsDataResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeDashboardDataResponseToJson(
        HomeDashboardDataResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'kesehatan_keluarga': instance.kesehatan_keluarga,
      'tips_dan_info': instance.tips_dan_info,
    };

HomeDashboardDataHeaderResponse _$HomeDashboardDataHeaderResponseFromJson(
    Map<String, dynamic> json) {
  return HomeDashboardDataHeaderResponse(
    img_url: json['img_url'] as String?,
    name: json['name'] as String,
    ageDesc: json['age'] as String,
  );
}

Map<String, dynamic> _$HomeDashboardDataHeaderResponseToJson(
        HomeDashboardDataHeaderResponse instance) =>
    <String, dynamic>{
      'img_url': instance.img_url,
      'name': instance.name,
      'age': instance.ageDesc,
    };

HomeDashboardDataWarningResponse _$HomeDashboardDataWarningResponseFromJson(
    Map<String, dynamic> json) {
  return HomeDashboardDataWarningResponse(
    img_url: json['img_url'] as String?,
    desc: json['desc'] as String,
    is_normal: json['is_normal'] as bool,
  );
}

Map<String, dynamic> _$HomeDashboardDataWarningResponseToJson(
        HomeDashboardDataWarningResponse instance) =>
    <String, dynamic>{
      'img_url': instance.img_url,
      'desc': instance.desc,
      'is_normal': instance.is_normal,
    };
