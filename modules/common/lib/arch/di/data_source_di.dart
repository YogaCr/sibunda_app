import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/local/source/check_up_local_source.dart';
import 'package:common/arch/data/local/source/data_local_source.dart';
import 'package:common/arch/data/local/source/pregnancy_local_source.dart';
import 'package:common/arch/di/db_di.dart';
import 'package:common/util/prefs.dart';

class LocalSrcDi {
  LocalSrcDi._();

  static LocalSrcDiObj obj = LocalSrcDiObjImpl();
}


abstract class LocalSrcDiObj {
  AccountLocalSrc get accountSrc;
  PregnancyLocalSrc get pregnancySrc;
  CheckUpLocalSrc get checkUpSrc;
  DataLocalSource get dataSrc;
}

class LocalSrcDiObjImpl extends LocalSrcDiObj {
  @override
  AccountLocalSrc get accountSrc => AccountLocalSrcImpl(
    credentialDao: DbDi.obj.credentialDao,
    profileDao: DbDi.obj.profileDao,
    profileTypeDao: DbDi.obj.profileTypeDao,
    pregnancyDao: DbDi.obj.pregnancyDao,
    sharedPref: Prefs.prefs,
    pregnancyLocalSrc: pregnancySrc,
  );
  @override
  PregnancyLocalSrc get pregnancySrc => PregnancyLocalSrcImpl(
    sharedPref: Prefs.prefs,
    profileDao: DbDi.obj.profileDao,
    pregnancyDao: DbDi.obj.pregnancyDao,
  );
  @override
  CheckUpLocalSrc get checkUpSrc => CheckUpLocalSrcImpl(
    checkUpIdDao: DbDi.obj.checkUpIdDao,
  );
  @override
  DataLocalSource get dataSrc => DataLocalSourceImpl(cityDao: DbDi.obj.cityDao);
}