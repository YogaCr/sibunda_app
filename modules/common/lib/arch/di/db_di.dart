import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/db/executor/shared.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/moor.dart';

class DbDi {
  DbDi._();

  static reconstruct() async {
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

  static AppDatabase? _db;
  static AppDatabase get db => _db ??= constructDb();

  static CredentialDao get credentialDao => db.credentialDao;
  static ProfileDao get profileDao => db.profileDao;
  static RoleDao get roleDao => db.roleDao;
  static ProfileTypeDao get profileTypeDao => db.profileTypeDao;
  static CityDao get cityDao => db.cityDao;
  static CheckUpIdDao get checkUpIdDao => db.checkUpIdDao;
}