// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_add_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BabyAddResponse _$_$_BabyAddResponseFromJson(Map<String, dynamic> json) {
  return _$_BabyAddResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    anak_id: json['anak_id'] as int?,
  );
}

Map<String, dynamic> _$_$_BabyAddResponseToJson(_$_BabyAddResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'anak_id': instance.anak_id,
    };
