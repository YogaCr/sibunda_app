import 'package:common/arch/domain/model/auth.dart';
import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_api_model.g.dart';

// ============ Body =============
class LoginBody {
  final LoginData login;
  LoginBody(this.login);

  Map<String, dynamic> toJson() => {
    Const.KEY_EMAIL: login.email,
    Const.KEY_PSWD: login.password,
    Const.KEY_RE_PSWD: login.password,
    Const.KEY_CLIENT_ID: Const.CLIENT_ID,
    Const.KEY_CLIENT_SECRET: Const.CLIENT_SECRET,
    Const.KEY_FCM_TOKEN: login.fcmToken,
  };
}


// ============ Response =============
@JsonSerializable()
class LoginResponse extends Equatable {
  final String message;
  final String status;
  final int code;
  final LoginDataResponse? data;

  LoginResponse({
    required this.message,
    required this.code,
    required this.status,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> map) => _$LoginResponseFromJson(map);

  @override
  List<Object?> get props => [code, message, status, data];
}

@JsonSerializable()
class LoginDataResponse extends Equatable {
  //TODO: LoginDataResponse: Tanya Amir apakah bisa response yg dikembalikan dari server brupa datanya user, trutama NIK ibu dan anak.
  @JsonKey(name: Const.KEY_TOKEN_TYPE)
  final String tokenType;
  @JsonKey(name: Const.KEY_ACCESS_TOKEN)
  final String token;

  LoginDataResponse({
    required this.tokenType,
    required this.token,
  });

  factory LoginDataResponse.fromJson(Map<String, dynamic> map) => _$LoginDataResponseFromJson(map);

  @override
  List<Object?> get props => [tokenType, token];
}