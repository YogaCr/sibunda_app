import 'package:core/util/_consoles.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> fcmBackgroundHandler(RemoteMessage msg) async {
  prinp("FCM message received in background");
  prinp("message = $msg");

  FirebaseUtil._callAllBgHandlers(msg);
}

class FirebaseUtil {
  FirebaseUtil._();

  static final _bgHandlers = <String, Future<void> Function(RemoteMessage)>{};

  static _callAllBgHandlers(RemoteMessage msg) {
    for(final handler in _bgHandlers.values) {
      handler(msg);
    }
  }

  static setFcmBgHandler({
    required String key,
    required Future<void> Function(RemoteMessage)? handler,
  }) {
    if(handler != null) {
      _bgHandlers[key] = handler;
    } else {
      _bgHandlers.remove(key);
    }
  }
}