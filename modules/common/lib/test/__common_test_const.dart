import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/util/net.dart';
import 'package:common/util/prefs.dart';
import 'package:common/value/const_values.dart';
import 'package:core/util/_consoles.dart';
import 'package:intl/date_symbol_data_local.dart';

class ConfigUtil {
  ConfigUtil._();

  static init() async {
    await initializeDateFormatting("id_ID");
    if(TestUtil.isDebug) {
      await TestUtil.init();
    }
  }
}

class TestUtil {
  TestUtil._();

  static bool isDebug = true;
  //static bool isTest = false;
  static String testOutputDir = "test/_out/signup_data.txt";

  static String? _token;
  static _initToken() async {
    final dio = SibDio.getDefaultInstance();
    final resp = await dio.get("${Const.ENDPOINT_ROOT}/token-dummy");
    final res = SimpleNetResponse.from(resp);
    prind("_initToken() res = $res");
    assert(res.statusCode == 200);
    _token = res.data;
  }
  
  static SessionData? _dummySession;
/*
  = SessionData(
    tokenType: "Bearer",
    token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNDk2MTgwMTRiOTg0NzA2MTg5YTgyMWJiMTRhMjAyNTFhOWFlMWE0NDZlNjYyMDFjOGZmZWNmN2NiNWQ2YzVlNTY5Y2ZlN2Y1MTdkYzk3YTkiLCJpYXQiOjE2MjUzMDU4NzguOTc3MzUsIm5iZiI6MTYyNTMwNTg3OC45NzczNTMsImV4cCI6MTY1Njg0MTg3OC45NzAxNjYsInN1YiI6IjUiLCJzY29wZXMiOlsiKiJdfQ.mX8HFL6mzpvBCk9mcU2d2cNwEl8yZt8RWyER_Crc4ah0LHKi0uUga38I0_NKl9d3Xg5QWZtYjLN9rcIa13TFataNkIAgfB801focatnhLKoSiyic17gVFg9HcslFxGN0Qz_HbKXllIe-EyoCu6Hqxfk_jt0oidsnlnDbXTRSOLEqh1oJWnlApsYmEphmWXUBnKcKNeaaVt-tk-NVlW62ETdfEEE-XI_0U-fJWTamnpLjUv5FUWCsMZiYoy6a-kpGUkcI6ZEgJnFp2JWfCsPr3EwUMrgi2wV7SduS9B-jtQRWZ_9GclYRmTVYo0aDBtk6fix4tsvruIZbKdsHkBXQzugklYakj7b4V6JdiP06Y5iWGAde5Ot06yJS8A_mYLyVCnlW3-MTuzMKupbYxoycQTGcSSjbe1Aa-D5z-Vv-sPtCRU9fWEofXSW0AbnbGWYezyAqgID1cP-c6NCo9jLK6Xjw3qNZOtQ_HnejPlip-mqyDlcBPQ-FH8YQiaJG2QPQZaG51TCdNG5zLgGabUKbtkhpE5yPZxPcaMAlxvXlR427D_65cn9upFOabWgx3LHcCOMi_rZT0j-ikOfmRKS_DkGFpq8wmDxDDtEH-SgyVF-Zn9t4Qz0v-0F_rtG56acRZA0t0m8YYCo1z_hZP0WWNI7kBlMpRDvccwRG9Zpc92g",
  );
 */
  static Future<SessionData> getDummySession() async {
    if(_dummySession == null) {
      if(_token == null) {
        await _initToken();
      }
      _dummySession = SessionData(
        tokenType: "Bearer",
        token: _token!,
      );
    }
    prind("_dummySession = ${_dummySession!.toAuthString()}");
    return _dummySession!;
  }

  static init() async {
    await initPrefs();
    await initSession();
    VarDi.motherNik.value = "10129";
    VarDi.pregnancyWeek.value = 1;
  }
  static initSession() async {
    final session = await getDummySession();
    VarDi.session = session;
  }
  static initPrefs() async {
    await Prefs.loadPrefs();
  }
}