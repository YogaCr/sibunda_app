import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class SignUpData extends Equatable {
  @JsonKey(name: Const.KEY_NAME)
  final String name;
  @JsonKey(name: Const.KEY_EMAIL)
  final String email;
  @JsonKey(name: Const.KEY_PSWD)
  final String password;

  const SignUpData({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];

  factory SignUpData.fromJson(Map<String, dynamic> json) => _$SignUpDataFromJson(json);
  Map<String, dynamic> get toJson => _$SignUpDataToJson(this);

  LoginData toLoginData({
    required String fcmToken,
  }) => LoginData(
    email: email,
    password: password,
    fcmToken: fcmToken,
  );
}

class LoginData {
  final String email;
  final String password;
  final String fcmToken;

  const LoginData({
    required this.email,
    required this.password,
    required this.fcmToken,
  });
}

class SessionData extends Equatable {
  final String token;
  final String tokenType;

  const SessionData({
    required this.token,
    required this.tokenType,
  });

  @override
  List<Object?> get props => [tokenType, token];

  String toAuthString() => "$tokenType $token";
}