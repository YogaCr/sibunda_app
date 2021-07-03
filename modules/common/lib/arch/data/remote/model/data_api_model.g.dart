// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) {
  return CityResponse(
    id: json['id'] as int,
    name: json['nama'] as String,
  );
}

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
    };
