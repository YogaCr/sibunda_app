import 'dart:io';

import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/di/data_source_di.dart';
import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/util/firebase_util.dart';
import 'package:common/util/net.dart';
import 'package:common/util/prefs.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:intl/date_symbol_data_local.dart';

class ConfigUtil {
  ConfigUtil._();

  static FormGroupInterceptor? get formInterceptor => TestUtil.isDebug
      ? FormGroupInterceptor() : null;

  static final isAutoToastEnabled = true;

  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting("id_ID");
    if(TestUtil.isDummy) {
      await TestUtil.init();
      await TestUtil.initDummyPrefs();
      await TestUtil.initDummyDb();
    } else {
      await Prefs.loadPrefs();
      await TestUtil.initDb();
      await TestUtil.initDummySeesion(); // Just to pretend;
    }
  }

  static initFcm() async {
    if(kIsWeb) return;
    try {
      prind("ConfigUtil initFcm() AWAL");

      if(!kIsWeb) {
        final option = kIsWeb ? FirebaseOptions(
          apiKey: "AIzaSyAKJ6eEXLl039Ta9les33IBpTUMpAuv0KA",
          authDomain: "sibunda-718c1.firebaseapp.com",
          projectId: "sibunda-718c1",
          storageBucket: "sibunda-718c1.appspot.com",
          messagingSenderId: "1028319191005",
          appId: "1:1028319191005:web:bbb0ef6172d768dd0c6034",
          measurementId: "G-46NGZ9YS6J",
        ) : null;
        await Firebase.initializeApp(options: option);
      }

      prind("ConfigUtil initFcm() AWAL 2");
      FirebaseMessaging.onBackgroundMessage(fcmBackgroundHandler);
      prind("ConfigUtil initFcm() AWAL 3");
      final saveFcmToken = UseCaseDi.saveFcmToken;
      prind("ConfigUtil initFcm() AWAL 4");
      final vapidKey = kIsWeb ? Const.FCM_WEB_PUSH_CERT : null;
      FirebaseMessaging.instance.getToken(vapidKey: vapidKey,)
          .then(prind)
          .catchError((e) => prine(e));
      prind("ConfigUtil initFcm() sblum await token");
      final token = await FirebaseMessaging.instance.getToken(vapidKey: vapidKey,);
      prind("ConfigUtil initFcm() token = $token");
      if(token != null) {
        prind("`ConfigUtil.initFcm()` fcm token = $token");
        final res = await saveFcmToken(token);
        var canSave = true;
        if(res is Fail<bool>) {
          canSave = false;
        } else {
          canSave = (res as Success<bool>).data;
        }
        if(!canSave) {
          prine("Can't save FCM token to local");
        }
      } else {
        prine("Can't get FCM token from remote");
      }
      prind("ConfigUtil initFcm() AKHIR");
      FirebaseMessaging.instance.onTokenRefresh.listen((refreshToken) {
        prind("FCM token is refreshed, token = $refreshToken");
        saveFcmToken(refreshToken);
      });
    } catch(e, stack) {
      final msg = "Error calling `ConfigUtil.initFcm()`";
      prine("$msg; e= $e");
      prine(stack);
    }
  }
}

class TestUtil {
  TestUtil._();

  static bool isDebug = true;
  static bool isDummy = false;
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
  static initDummySeesion() {
    final session = SessionData(token: "<null>", tokenType: "Bearer");
    VarDi.session = session;
  }
  static initPrefs() async {
    await Prefs.loadPrefs();
  }
  static initDb() async {
    try {
      await DbDi.roleDao.insertAll(userRoles);
      await DbDi.profileTypeDao.insertAll(profileTypes);
    } catch(e, stack) {
      prinw("Error when calling `initDb()`, e= $e");
      prine(stack);
    }
  }

  static initDummyPrefs() async {
    try {
      await initPrefs();
      await LocalSrcDi.accountSrc.saveCurrentEmail(dummyEmail);
      await LocalSrcDi.accountSrc.saveSession(VarDi.session);
      VarDi.motherNik.value = dummyProfileMother.nik;
      //LocalSrcDi.accountSrc.saveBatchProfile(userId: userId, userRole: userRole, signup: signup, mother: mother, father: father, child: child)
    } catch(e) {
      prinw("Exception is thrown during `initDummyPrefs(). e = $e`");
    }
  }
  static initDummyDb() async {
    prind("`initDummyDb()` AWAL");
    try {
      await DbDi.db.reset();
      //final cities = await DbDi.cityDao.get();
      //prind("`initDummyDb()` cities = $cities");
      //await DbDi.cityDao.insertAll(dummyCities);
      await initDb();
      await DbDi.credentialDao.insertAll([dummyCredential]);
      await DbDi.profileDao.insertAll([
        dummyProfileMother, dummyProfileFather, dummyProfileChild,
      ]);
    } catch(e, stack) {
      prine(stack);
      prinw("Exception is thrown during `initDummyDb(). e = $e`");
    }
  }
}