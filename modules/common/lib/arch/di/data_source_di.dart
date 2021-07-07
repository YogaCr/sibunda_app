import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/local/source/check_up_local_source.dart';
import 'package:common/arch/data/local/source/data_local_source.dart';
import 'package:common/arch/data/local/source/pregnancy_local_source.dart';
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
  static PregnancyLocalSrc get pregnancySrc => PregnancyLocalSrcImpl(
    sharedPref: Prefs.prefs,
  );
  static CheckUpLocalSrc get checkUpSrc => CheckUpLocalSrcImpl(
    checkUpIdDao: DbDi.checkUpIdDao,
  );
  static DataLocalSource get dataSrc => DataLocalSourceImpl(cityDao: DbDi.cityDao);
}