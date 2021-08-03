import 'package:common/arch/domain/model/auth.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

class VarDi {
  VarDi._();

  static SessionData? _session;
  static set session(SessionData v) {
    prind("VarDi.session set v = $v");
    _session = v;
  }
  static SessionData get session {
    prind("VarDi.session = $_session");
    if(_session == null) {
      throw "`session` still not ready";
    }
    return _session!;
  }

  static final pregnancyWeek = MutableLiveData<int>();
  //TODO: VarDi.motherNik: blum ada yg meng-init nilainya. Hapus GetMotherNik, pindah di sini aja.
  static final motherNik = MutableLiveData<String>();

  static final isSessionValid = MutableLiveData<bool>();
  static final error = MutableLiveData<FlutterErrorDetails>();

  static clear({
    bool includeSession = true,
  }) {
    prind("VarDi.clear() start");
    _session = null;
    pregnancyWeek.value = null;
    motherNik.value = null;
    if(includeSession) {
      isSessionValid.value = null;
    }
    prind("VarDi.clear() end");
  }
}