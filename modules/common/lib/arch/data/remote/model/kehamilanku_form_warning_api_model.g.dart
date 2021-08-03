// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_form_warning_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyCheckFormWarningResponse _$PregnancyCheckFormWarningResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyCheckFormWarningResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: PregnancyCheckFormWarningDataResponse.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PregnancyCheckFormWarningResponseToJson(
        PregnancyCheckFormWarningResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

PregnancyCheckFormWarningDataResponse
    _$PregnancyCheckFormWarningDataResponseFromJson(Map<String, dynamic> json) {
  return PregnancyCheckFormWarningDataResponse(
    fetusGrowth: PregnancyCheckFetusGrowthWarningResponse.fromJson(
        json['fetus_growth_desc'] as Map<String, dynamic>),
    weight: PregnancyFormWarningDescResponse.fromJson(
        json['weight_desc'] as Map<String, dynamic>),
    momPulse: PregnancyFormWarningDescResponse.fromJson(
        json['mom_pulse_desc'] as Map<String, dynamic>),
    tfu: PregnancyFormWarningDescResponse.fromJson(
        json['tfu_desc'] as Map<String, dynamic>),
    djj: PregnancyFormWarningDescResponse.fromJson(
        json['djj_desc'] as Map<String, dynamic>),
    babyMovement: PregnancyFormWarningDescResponse.fromJson(
        json['baby_movement_desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PregnancyCheckFormWarningDataResponseToJson(
        PregnancyCheckFormWarningDataResponse instance) =>
    <String, dynamic>{
      'fetus_growth_desc': instance.fetusGrowth,
      'weight_desc': instance.weight,
      'mom_pulse_desc': instance.momPulse,
      'tfu_desc': instance.tfu,
      'djj_desc': instance.djj,
      'baby_movement_desc': instance.babyMovement,
    };

PregnancyCheckFetusGrowthWarningResponse
    _$PregnancyCheckFetusGrowthWarningResponseFromJson(
        Map<String, dynamic> json) {
  return PregnancyCheckFetusGrowthWarningResponse(
    week: json['week'] as int,
    length: json['length'] as num?,
    weight: json['weight'] as num?,
    desc: json['desc'] as String?,
    imgLink: json['img'] as String?,
  );
}

Map<String, dynamic> _$PregnancyCheckFetusGrowthWarningResponseToJson(
        PregnancyCheckFetusGrowthWarningResponse instance) =>
    <String, dynamic>{
      'week': instance.week,
      'length': instance.length,
      'weight': instance.weight,
      'desc': instance.desc,
      'img': instance.imgLink,
    };

PregnancyFormWarningDescResponse _$PregnancyFormWarningDescResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyFormWarningDescResponse(
    type: json['type'] as int,
    desc: json['desc'] as String?,
    isNormal: json['is_normal'] as bool,
  );
}

Map<String, dynamic> _$PregnancyFormWarningDescResponseToJson(
        PregnancyFormWarningDescResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'desc': instance.desc,
      'is_normal': instance.isNormal,
    };
