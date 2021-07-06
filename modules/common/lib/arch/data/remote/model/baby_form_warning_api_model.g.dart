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
        json['weight'] as Map<String, dynamic>),
    len: BabyFormWarningDescResponse.fromJson(
        json['len'] as Map<String, dynamic>),
    weightToLen: BabyFormWarningDescResponse.fromJson(
        json['weightToLen'] as Map<String, dynamic>),
    headCircum: BabyFormWarningDescResponse.fromJson(
        json['headCircum'] as Map<String, dynamic>),
    imt: BabyFormWarningDescResponse.fromJson(
        json['imt'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BabyFormWarningDataResponseToJson(
        BabyFormWarningDataResponse instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'len': instance.len,
      'weightToLen': instance.weightToLen,
      'headCircum': instance.headCircum,
      'imt': instance.imt,
    };

BabyFormWarningDescResponse _$BabyFormWarningDescResponseFromJson(
    Map<String, dynamic> json) {
  return BabyFormWarningDescResponse(
    desc: json['desc'] as String,
    isNormal: json['is_normal'] as bool,
  );
}

Map<String, dynamic> _$BabyFormWarningDescResponseToJson(
        BabyFormWarningDescResponse instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'is_normal': instance.isNormal,
    };
