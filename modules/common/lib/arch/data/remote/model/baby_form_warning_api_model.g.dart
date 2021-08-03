// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_form_warning_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyFormWarningResponse _$BabyFormWarningResponseFromJson(
    Map<String, dynamic> json) {
  return BabyFormWarningResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: BabyFormWarningDataResponse.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BabyFormWarningResponseToJson(
        BabyFormWarningResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

BabyFormWarningDataResponse _$BabyFormWarningDataResponseFromJson(
    Map<String, dynamic> json) {
  return BabyFormWarningDataResponse(
    weight: BabyFormWarningDescResponse.fromJson(
        json['bb_usia_desc'] as Map<String, dynamic>),
    len: BabyFormWarningDescResponse.fromJson(
        json['pb_usia_desc'] as Map<String, dynamic>),
    weightToLen: BabyFormWarningDescResponse.fromJson(
        json['bb_pb_desc'] as Map<String, dynamic>),
    headCircum: BabyFormWarningDescResponse.fromJson(
        json['lingkar_kepala_desc'] as Map<String, dynamic>),
    imt: BabyFormWarningDescResponse.fromJson(
        json['imt_desc'] as Map<String, dynamic>),
    dev: json['perkembangan_desc'] == null
        ? null
        : BabyFormWarningDescResponse.fromJson(
            json['perkembangan_desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BabyFormWarningDataResponseToJson(
        BabyFormWarningDataResponse instance) =>
    <String, dynamic>{
      'bb_usia_desc': instance.weight,
      'pb_usia_desc': instance.len,
      'bb_pb_desc': instance.weightToLen,
      'lingkar_kepala_desc': instance.headCircum,
      'imt_desc': instance.imt,
      'perkembangan_desc': instance.dev,
    };

BabyFormWarningDescResponse _$BabyFormWarningDescResponseFromJson(
    Map<String, dynamic> json) {
  return BabyFormWarningDescResponse(
    desc: json['desc'] as String?,
    isNormal: json['is_normal'] as bool,
  );
}

Map<String, dynamic> _$BabyFormWarningDescResponseToJson(
        BabyFormWarningDescResponse instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'is_normal': instance.isNormal,
    };
