import 'package:common/arch/data/remote/model/login_api_model.dart';
import 'package:common/arch/data/remote/model/logout_api_model.dart';
import 'package:common/util/_util.dart';
import 'package:common/value/const_values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/register_api_model.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: Const.ENDPOINT_AUTH)
abstract class AuthApi {
  factory AuthApi([Dio? dio]) => _AuthApi(dio ?? Dio(
    SibDio.defaultBaseOptions(),
  ));
  @POST("/register")
  Future<RegisterResponse> register(@Body() RegisterBody body);
  @POST("/login")
  Future<LoginResponse> login(@Body() LoginBody body);
  @GET("/logout")
  Future<LogoutResponse> logout(@Header("Authorization") LogoutBody body);
  //Future<LogoutResponse> logout(LogoutBody body) => logoutWithToken(body.toString());
}