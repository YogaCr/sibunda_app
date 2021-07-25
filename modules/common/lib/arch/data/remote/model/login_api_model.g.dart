// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    message: json['message'] as String,
    code: json['code'] as int,
    status: json['status'] as String,
    data: json['data'] == null
        ? null
        : LoginDataResponse.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) {
  return LoginDataResponse(
    tokenType: json['token_type'] as String,
    token: json['access_token'] as String,
  );
}

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{
      'token_type': instance.tokenType,
      'access_token': instance.token,
    };
