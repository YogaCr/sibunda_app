
import 'package:common/value/const_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._();

  static SharedPreferences? _prefs;
  static Future<SharedPreferences> loadPrefs() async => _prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences get prefs {
    if(_prefs == null) {
      throw "`SharedPreferences` is not ready yet. Call `loadPrefs()` instead.";
    }
    return _prefs!;
  }

  static String get email => _prefs!.getString(Const.KEY_EMAIL)!;
  static String? get name => _prefs!.getString(Const.KEY_NAME_CLIENT);
}