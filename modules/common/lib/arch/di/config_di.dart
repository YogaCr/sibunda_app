import 'package:common/arch/domain/model/auth.dart';
import 'package:core/ui/base/live_data.dart';

class VarDi {
  VarDi._();

  static SessionData? _session;
  static set session(SessionData v) => _session = v;
  static SessionData get session {
    if(_session == null) {
      throw "`session` still not ready";
    }
    return _session!;
  }

  static final pregnancyWeek = MutableLiveData<int>();
  //TODO: VarDi.motherNik: blum ada yg meng-init nilainya. Hapus GetMotherNik, pindah di sini aja.
  static final motherNik = MutableLiveData<String>();
}