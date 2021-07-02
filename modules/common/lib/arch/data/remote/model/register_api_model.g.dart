// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'user': instance.user,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    groupId: json['user_group_id'] as int,
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'user_group_id': instance.groupId,
    };
