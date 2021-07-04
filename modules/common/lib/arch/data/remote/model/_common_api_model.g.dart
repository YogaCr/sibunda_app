// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_common_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return CommonResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
    };
