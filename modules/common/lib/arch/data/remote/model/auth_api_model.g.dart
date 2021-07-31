// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckEmailAvailabilityResponse _$_$_CheckEmailAvailabilityResponseFromJson(
    Map<String, dynamic> json) {
  return _$_CheckEmailAvailabilityResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    available: json['available'] as bool,
  );
}

Map<String, dynamic> _$_$_CheckEmailAvailabilityResponseToJson(
        _$_CheckEmailAvailabilityResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'available': instance.available,
    };
