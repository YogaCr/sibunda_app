import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/di/db_di.dart';
import 'package:common/util/prefs.dart';

class LocalSrcDi {
  LocalSrcDi._();

  static AccountLocalSrc get accountSrc => AccountLocalSrcImpl(
    credentialDao: DbDi.credentialDao,
    profileDao: DbDi.profileDao,
    profileTypeDao: DbDi.profileTypeDao,
    sharedPref: Prefs.prefs,
  );
}