import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

bool _isInit = false;

String? env(String key) {
  if(!_isInit){
    DotEnv.load();
  }
  return DotEnv.env[key];
}