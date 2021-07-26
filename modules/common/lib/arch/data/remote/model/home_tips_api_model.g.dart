// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_tips_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TipsResponse _$_$_TipsResponseFromJson(Map<String, dynamic> json) {
  return _$_TipsResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => TipsDataResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_TipsResponseToJson(_$_TipsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

_$_TipsDataResponse _$_$_TipsDataResponseFromJson(Map<String, dynamic> json) {
  return _$_TipsDataResponse(
    id: json['id'] as int,
    img_url: json['img_url'] as String?,
    desc: json['desc'] as String,
    user_id: json['user_id'] as int?,
    tips_category: TipsCategoryResponse.fromJson(
        json['tips_category'] as Map<String, dynamic>),
    content: json['content'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$_$_TipsDataResponseToJson(
        _$_TipsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img_url': instance.img_url,
      'desc': instance.desc,
      'user_id': instance.user_id,
      'tips_category': instance.tips_category,
      'content': instance.content,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

_$_TipsCategoryResponse _$_$_TipsCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _$_TipsCategoryResponse(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_TipsCategoryResponseToJson(
        _$_TipsCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
