import 'package:common/arch/data/remote/api/auth_api.dart';

class ApiDi {
  ApiDi._();

  static AuthApi get authApi => AuthApi();
}