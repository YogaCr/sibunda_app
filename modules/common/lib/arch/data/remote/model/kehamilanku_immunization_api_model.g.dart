// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_immunization_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyCreateImmunizationBody _$PregnancyCreateImmunizationBodyFromJson(
    Map<String, dynamic> json) {
  return PregnancyCreateImmunizationBody(
    immunizationId: json['immunization_id'] as int,
    date: json['date'] as String,
    location: json['location'] as String,
    pic: json['pic'] as String,
  );
}

Map<String, dynamic> _$PregnancyCreateImmunizationBodyToJson(
        PregnancyCreateImmunizationBody instance) =>
    <String, dynamic>{
      'immunization_id': instance.immunizationId,
      'date': instance.date,
      'location': instance.location,
      'pic': instance.pic,
    };

PregnancyImmunizationResponse _$PregnancyImmunizationResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyImmunizationResponse(
    id: json['id'] as int,
    immunizationId: json['immunization_id'] as int,
    date: json['date'] as String?,
    location: json['location'] as String?,
    trimester: json['trisemester'] as int,
    imgLink: json['pic'] as String?,
  );
}

Map<String, dynamic> _$PregnancyImmunizationResponseToJson(
        PregnancyImmunizationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'immunization_id': instance.immunizationId,
      'date': instance.date,
      'location': instance.location,
      'trisemester': instance.trimester,
      'pic': instance.imgLink,
    };
