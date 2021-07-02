// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) {
  return LogoutResponse(
    code: json['code'] as int,
    status: json['status'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
