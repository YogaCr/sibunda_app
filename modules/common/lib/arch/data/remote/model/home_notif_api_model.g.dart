// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_notif_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNotifMsgResponse _$HomeNotifMsgResponseFromJson(Map<String, dynamic> json) {
  return HomeNotifMsgResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: (json['data'] as List<dynamic>)
        .map(
            (e) => HomeNotifMsgDataResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeNotifMsgResponseToJson(
        HomeNotifMsgResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

HomeNotifMsgDataResponse _$HomeNotifMsgDataResponseFromJson(
    Map<String, dynamic> json) {
  return HomeNotifMsgDataResponse(
    id: json['id'] as int,
    user_id: json['user_id'] as int,
    is_message: json['is_message'] as bool,
    title: json['title'] as String,
    desc: json['desc'] as String,
    img_url: json['img_url'] as String?,
    url: json['url'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$HomeNotifMsgDataResponseToJson(
        HomeNotifMsgDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'is_message': instance.is_message,
      'title': instance.title,
      'desc': instance.desc,
      'img_url': instance.img_url,
      'url': instance.url,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
