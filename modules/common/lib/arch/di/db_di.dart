import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/dao/kehamilanku_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/db/executor/shared.dart';

class DbDi {
  DbDi._();

  static AppDatabase? _db;
  static AppDatabase get db => _db ??= constructDb();

  static CredentialDao get credentialDao => db.credentialDao;
  static ProfileDao get profileDao => db.profileDao;
  static RoleDao get roleDao => db.roleDao;
  static ProfileTypeDao get profileTypeDao => db.profileTypeDao;
  static CityDao get cityDao => db.cityDao;
  static PregnancyCheckUpIdDao get pregnancyCheckUpIdDao => db.pregnancyCheckUpIdDao;
}