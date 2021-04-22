
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:common/util/net.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Auth._();

  static const KEY_NAME = "nama";
  static const KEY_NAME_CLIENT = "user_name";
  static const KEY_EMAIL = "email";
  static const KEY_PASSWORD = "password";
  static const KEY_RE_PASSWORD = "password_confirmation";
  static const KEY_CLIENT_ID = "client_id";
  static const KEY_CLIENT_SECRET = "client_secret";
  static const KEY_FCM_TOKEN = "fcm_token";
  static const KEY_ACCESS_TOKEN = "access_token";
  static const HEADER_AUTH = "Authorization";

  static Future<SimpleNetResponse> signUp(String name, String email, String pswd) async {
    final dio = Dio();
    final response = await dio.post(ENDPOINT_REGISTER, data: {
      KEY_NAME: name,
      KEY_EMAIL: email,
      KEY_PASSWORD: pswd,
      KEY_RE_PASSWORD: pswd,
    });
    return SimpleNetResponse.from(response);
  }

  static Future<SimpleNetResponse> login(String email, String pswd) async {
    await DotEnv.load();
    final dio = Dio();
    final response = await dio.post(ENDPOINT_REGISTER, data: {
      KEY_CLIENT_ID: DotEnv.env[KEY_CLIENT_ID],
      KEY_CLIENT_SECRET: DotEnv.env[KEY_CLIENT_SECRET],
      KEY_FCM_TOKEN: DotEnv.env[KEY_FCM_TOKEN],
      KEY_EMAIL: email,
      KEY_PASSWORD: pswd,
      KEY_RE_PASSWORD: pswd,
    });
    return SimpleNetResponse.from(response);
  }

  static Future<SimpleNetResponse> logout(String accessToken) async {
    final dio = Dio();
    final response = await dio.post(ENDPOINT_REGISTER,
        options: Options(
          headers: {
            HEADER_AUTH: "Bearer $accessToken",
            Headers.acceptHeader: Headers.jsonContentType,
          }
        ),
    );
    return SimpleNetResponse.from(response);
  }
}


class AuthService {
  AuthService._();

  static Future<SimpleNetResponse> signUp(String name, String email, String pswd) async {
    final response = await Auth.signUp(name, email, pswd);
    print("AuthService.signUp() name= $name email= $email pswd= $pswd response.data= ${response.data}");
    if(response.statusCode == 200){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(Auth.KEY_NAME_CLIENT, name);
      prefs.setString(Auth.KEY_EMAIL, email);
    }
    return response;
  }

  static Future<SimpleNetResponse> login(String email, String pswd) async {
    final response = await Auth.login(email, pswd);
    if(response.statusCode == 200){
      final prefs = await SharedPreferences.getInstance();
      final accessToken = response.data["data"][Auth.KEY_ACCESS_TOKEN] as String;
      print("AuthService.login() accessToken= $accessToken");
      prefs.setString(Auth.KEY_ACCESS_TOKEN, accessToken);
    }
    return response;
  }

  static Future<SimpleNetResponse> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(Auth.KEY_ACCESS_TOKEN)!;
    final response = await Auth.logout(accessToken);
    if(response.statusCode == 200){
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(Auth.KEY_ACCESS_TOKEN);
      prefs.remove(Auth.KEY_NAME_CLIENT);
      prefs.remove(Auth.KEY_EMAIL);
    }
    return response;
  }
}