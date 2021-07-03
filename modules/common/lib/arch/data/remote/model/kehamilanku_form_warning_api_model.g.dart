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
    data: (json['data'] as List<dynamic>)
        .map((e) => PregnancyCheckFormWarningDataResponse.fromJson(
            e as Map<String, dynamic>))
        .toList(),
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
    weight: PregnancyCheckWeightWarningResponse.fromJson(
        json['weight_desc'] as Map<String, dynamic>),
    momPulse: PregnancyCheckMomPulseWarningResponse.fromJson(
        json['mom_pulse_desc'] as Map<String, dynamic>),
    tfu: PregnancyCheckTfuWarningResponse.fromJson(
        json['tfu_desc'] as Map<String, dynamic>),
    djj: PregnancyCheckDjjWarningResponse.fromJson(
        json['djj_desc'] as Map<String, dynamic>),
    babyMovement: PregnancyCheckBabyMovementWarningResponse.fromJson(
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
    length: json['length'] as num,
    weight: json['weight'] as num,
    desc: json['desc'] as String,
    imgLink: json['img'] as String,
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

PregnancyCheckWeightWarningResponse
    _$PregnancyCheckWeightWarningResponseFromJson(Map<String, dynamic> json) {
  return PregnancyCheckWeightWarningResponse(
    type: json['type'] as int,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$PregnancyCheckWeightWarningResponseToJson(
        PregnancyCheckWeightWarningResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'desc': instance.desc,
    };

PregnancyCheckMomPulseWarningResponse
    _$PregnancyCheckMomPulseWarningResponseFromJson(Map<String, dynamic> json) {
  return PregnancyCheckMomPulseWarningResponse(
    type: json['type'] as int,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$PregnancyCheckMomPulseWarningResponseToJson(
        PregnancyCheckMomPulseWarningResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'desc': instance.desc,
    };

PregnancyCheckTfuWarningResponse _$PregnancyCheckTfuWarningResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyCheckTfuWarningResponse(
    type: json['type'] as int,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$PregnancyCheckTfuWarningResponseToJson(
        PregnancyCheckTfuWarningResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'desc': instance.desc,
    };

PregnancyCheckDjjWarningResponse _$PregnancyCheckDjjWarningResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyCheckDjjWarningResponse(
    type: json['type'] as int,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$PregnancyCheckDjjWarningResponseToJson(
        PregnancyCheckDjjWarningResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'desc': instance.desc,
    };

PregnancyCheckBabyMovementWarningResponse
    _$PregnancyCheckBabyMovementWarningResponseFromJson(
        Map<String, dynamic> json) {
  return PregnancyCheckBabyMovementWarningResponse(
    type: json['type'] as int,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$PregnancyCheckBabyMovementWarningResponseToJson(
        PregnancyCheckBabyMovementWarningResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'desc': instance.desc,
    };
