// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_overview_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyHomeResponse _$PregnancyHomeResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyHomeResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            PregnancyHomeBabyResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PregnancyHomeResponseToJson(
        PregnancyHomeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };

PregnancyHomeBabyResponse _$PregnancyHomeBabyResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyHomeBabyResponse(
    babyId: json['id'] as int,
    name: json['nama'] as String,
    childOrder: json['anak_ke'] as int?,
    week: json['week'] as int,
    remainingDays: json['remaining_days'] as int,
    foodRecomList: (json['food_recommendations'] as List<dynamic>)
        .map((e) => PregnancyHomeFoodRecom.fromJson(e as Map<String, dynamic>))
        .toList(),
    trimesterList: (json['trisemesters'] as List<dynamic>)
        .map((e) => PregnancyHomeTrimester.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PregnancyHomeBabyResponseToJson(
        PregnancyHomeBabyResponse instance) =>
    <String, dynamic>{
      'id': instance.babyId,
      'nama': instance.name,
      'anak_ke': instance.childOrder,
      'week': instance.week,
      'remaining_days': instance.remainingDays,
      'food_recommendations': instance.foodRecomList,
      'trisemesters': instance.trimesterList,
    };

PregnancyHomeFoodRecom _$PregnancyHomeFoodRecomFromJson(
    Map<String, dynamic> json) {
  return PregnancyHomeFoodRecom(
    category: json['food_category'] as String,
    desc: json['food_dose'] as String,
    img_url: json['img_url'] as String?,
  );
}

Map<String, dynamic> _$PregnancyHomeFoodRecomToJson(
        PregnancyHomeFoodRecom instance) =>
    <String, dynamic>{
      'food_category': instance.category,
      'food_dose': instance.desc,
      'img_url': instance.img_url,
    };

PregnancyHomeTrimester _$PregnancyHomeTrimesterFromJson(
    Map<String, dynamic> json) {
  return PregnancyHomeTrimester(
    id: json['id'] as int,
    no: json['trisemester'] as int,
    babyId: json['kia_anak_id'] as int,
    img_url: json['img_url'] as String,
  );
}

Map<String, dynamic> _$PregnancyHomeTrimesterToJson(
        PregnancyHomeTrimester instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trisemester': instance.no,
      'kia_anak_id': instance.babyId,
      'img_url': instance.img_url,
    };
