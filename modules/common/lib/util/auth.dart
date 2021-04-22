
import 'package:common/values/prefs.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:common/util/net.dart';
import 'package:dio/dio.dart';

class Auth {
  Auth._();

  static const _ENV = "env";
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
    },
      options: SibDio.defaultOptions(),
    );
    return SimpleNetResponse.from(response);
  }

  static Future<SimpleNetResponse> login(
      String email, String pswd, String secret, String clientId, [String fcmToken = "ini_token",]
  ) async {
    final dio = Dio();
    final response = await dio.post(ENDPOINT_LOGIN, data: {
      KEY_CLIENT_ID: clientId, //DotEnv.env[KEY_CLIENT_ID],
      KEY_CLIENT_SECRET: secret, //DotEnv.env[KEY_CLIENT_SECRET],
      KEY_FCM_TOKEN: fcmToken, //DotEnv.env[KEY_FCM_TOKEN],
      KEY_EMAIL: email,
      KEY_PASSWORD: pswd,
      KEY_RE_PASSWORD: pswd,
    },
      options: SibDio.defaultOptions(),
    );
    return SimpleNetResponse.from(response);
  }

  static Future<SimpleNetResponse> logout(String accessToken) async {
    final dio = Dio();
    final response = await dio.get(ENDPOINT_LOGOUT,
        options: SibDio.defaultOptions().copyWith(
            headers: {
              HEADER_AUTH: "Bearer $accessToken",
              Headers.acceptHeader: Headers.jsonContentType,
            }
        )
    );
    return SimpleNetResponse.from(response);
  }
}


class AuthService {
  AuthService._();

  static Future<SimpleNetResponse> signUp(String name, String email, String pswd) async {
    final response = await Auth.signUp(name, email, pswd);
    if(response.statusCode == 200){
      final prefs = await Prefs.loadPrefs();
      prefs.setString(Auth.KEY_NAME_CLIENT, name);
      prefs.setString(Auth.KEY_EMAIL, email);
    }
    return response;
  }

  static Future<SimpleNetResponse> login(String email, String pswd) async {
    await DotEnv.load(fileName: Auth._ENV);
    final secret = DotEnv.env[Auth.KEY_CLIENT_SECRET]!;
    final clientId = DotEnv.env[Auth.KEY_CLIENT_ID]!;
    final fcmToken = DotEnv.env[Auth.KEY_FCM_TOKEN]!;

    final response = await Auth.login(email, pswd, secret, clientId, fcmToken);
    if(response.statusCode == 200){
      final prefs = await Prefs.loadPrefs();
      final accessToken = response.data["data"][Auth.KEY_ACCESS_TOKEN] as String;
      prefs.setString(Auth.KEY_ACCESS_TOKEN, accessToken);
      prefs.setString(Auth.KEY_EMAIL, email);
    }
    return response;
  }

  static Future<SimpleNetResponse> logout() async {
    final prefs = await Prefs.loadPrefs();
    final accessToken = prefs.getString(Auth.KEY_ACCESS_TOKEN)!;
    final response = await Auth.logout(accessToken);
    if(response.statusCode == 200){
      final prefs = await Prefs.loadPrefs();
      prefs.remove(Auth.KEY_ACCESS_TOKEN);
      prefs.remove(Auth.KEY_NAME_CLIENT);
      prefs.remove(Auth.KEY_EMAIL);
    }
    return response;
  }
}