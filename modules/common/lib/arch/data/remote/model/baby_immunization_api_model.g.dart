// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_immunization_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyCreateImmunizationBody _$BabyCreateImmunizationBodyFromJson(
    Map<String, dynamic> json) {
  return BabyCreateImmunizationBody(
    id: json['id'] as int,
    date: json['date'] as String,
    location: json['location'] as String,
    pic: json['pic'] as String,
    noBatch: json['no_batch'] as String,
  );
}

Map<String, dynamic> _$BabyCreateImmunizationBodyToJson(
        BabyCreateImmunizationBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'location': instance.location,
      'pic': instance.pic,
      'no_batch': instance.noBatch,
    };

BabyImmunizationResponse _$BabyImmunizationResponseFromJson(
    Map<String, dynamic> json) {
  return BabyImmunizationResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            BabyImmunizationItemResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BabyImmunizationResponseToJson(
        BabyImmunizationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

BabyImmunizationItemResponse _$BabyImmunizationItemResponseFromJson(
    Map<String, dynamic> json) {
  return BabyImmunizationItemResponse(
    id: json['id'] as int,
    immunizationId: json['immunization_id'] as int,
    date: json['date'] as String?,
    location: json['location'] as String?,
    noBatch: json['no_batch'] as String?,
    childId: json['kia_anak_id'] as int,
    month_type: json['month_type'] as int,
    pic: json['pic'] as String?,
    immunization: BabyImmunizationItemEntityResponse.fromJson(
        json['immunization'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BabyImmunizationItemResponseToJson(
        BabyImmunizationItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'immunization_id': instance.immunizationId,
      'date': instance.date,
      'location': instance.location,
      'no_batch': instance.noBatch,
      'kia_anak_id': instance.childId,
      'month_type': instance.month_type,
      'pic': instance.pic,
      'immunization': instance.immunization,
    };

BabyImmunizationItemEntityResponse _$BabyImmunizationItemEntityResponseFromJson(
    Map<String, dynamic> json) {
  return BabyImmunizationItemEntityResponse(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BabyImmunizationItemEntityResponseToJson(
        BabyImmunizationItemEntityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
