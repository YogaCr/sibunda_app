import 'package:common/data/model/auth_data.dart';

final dummyAccessToken = "aagajki1831huhf1i38y13";
final dummySignUpData1 = SignUpData(name: "ayu", email: "a@a.a", password: "ayu123");
final dummyLoginData1 = LoginData(email: dummySignUpData1.email, password: dummySignUpData1.password);
final dummySessionData1 = SessionData(dummyAccessToken);