// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_overview_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyHomeResponse _$BabyHomeResponseFromJson(Map<String, dynamic> json) {
  return BabyHomeResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => BabyHomeChildResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BabyHomeResponseToJson(BabyHomeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

BabyHomeChildResponse _$BabyHomeChildResponseFromJson(
    Map<String, dynamic> json) {
  return BabyHomeChildResponse(
    id: json['id'] as int,
    name: json['nama'] as String,
    years: (json['years'] as List<dynamic>)
        .map((e) =>
            BabyHomeChildYearFormResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BabyHomeChildResponseToJson(
        BabyHomeChildResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'years': instance.years,
    };

BabyHomeChildYearFormResponse _$BabyHomeChildYearFormResponseFromJson(
    Map<String, dynamic> json) {
  return BabyHomeChildYearFormResponse(
    id: json['id'] as int,
    year: json['year'] as int,
    childId: json['kia_anak_id'] as int,
  );
}

Map<String, dynamic> _$BabyHomeChildYearFormResponseToJson(
        BabyHomeChildYearFormResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
      'kia_anak_id': instance.childId,
    };
