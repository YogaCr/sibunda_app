
import 'package:common/util/auth.dart';
import 'package:common/value/const_values.dart';

void main() async {
  final name = "ayu3";
  final email = "a6@a.a";
  final pswd = "abcd1234";
  final secret = "5xnEHfLiRiyyRGrez97iEmqzTB4h48IWr5DnHEuO";
  final clientId = "2";
  final fcmToken = "ini token";
  //remote_host=https://sibunda.amirmb.com

  await signUpTest(name, email, pswd);
  final token = await login(email, pswd, secret, clientId, fcmToken);
  await logout(token);
}

Future<void> signUpTest(String name, String email, String pswd) async {
  print("Mulai signUpTest()");
  final resp = await Auth.signUp(name, email, pswd);
  print("resp= $resp");
  assert (resp.statusCode == 200);
  print("Selesai signUpTest()");
}

Future<String> login(
  String email, String pswd,
  String secret, String clientId, String fcmToken,
) async {
  print("Mulai login()");
  final resp = await Auth.login(email, pswd, secret, clientId, fcmToken);
  print("resp= $resp");
  assert (resp.statusCode == 200);
  print("Selesai login()");
  return resp.data["data"][Const.KEY_ACCESS_TOKEN];
}

Future<void> logout(String token) async {
  print("Mulai logout()");
  final resp = await Auth.logout(token);
  print("resp= $resp");
  assert (resp.statusCode == 200);
  print("Selesai logout()");
}
