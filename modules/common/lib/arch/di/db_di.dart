import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/dao/pregnancy_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/db/executor/shared.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/moor.dart';

class DbDi {
  DbDi._();
  static DbDiObj obj = DbDiObjImpl();
}


abstract class DbDiObj {
  Future<AppDatabase> reconstruct();

  AppDatabase get db;

  CredentialDao get credentialDao => db.credentialDao;
  ProfileDao get profileDao => db.profileDao;
  RoleDao get roleDao => db.roleDao;
  ProfileTypeDao get profileTypeDao => db.profileTypeDao;
  CityDao get cityDao => db.cityDao;
  CheckUpIdDao get checkUpIdDao => db.checkUpIdDao;
  PregnancyDao get pregnancyDao => db.pregnancyDao;
}

class DbDiObjImpl extends DbDiObj {
  @override
  Future<AppDatabase> reconstruct() async {
    prind("DbDi.reconstruct()");
    final __db = _db;
    if(__db != null) {
      await __db.reset();
      await Migrator(__db).createAll();
      __db.close();
      _db = null;
    }
    return db;
  }

  AppDatabase? _db;
  @override
  AppDatabase get db => _db ??= constructDb();
}