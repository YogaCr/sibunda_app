import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/dao/pregnancy_dao.dart';
import 'package:common/arch/data/local/entity/account_entity.dart';
import 'package:common/arch/data/local/entity/data_entity.dart';
import 'package:common/arch/data/local/entity/check_up_entity.dart';
import 'package:common/arch/data/local/entity/pregnancy_entity.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/backends.dart';
import 'package:moor/moor.dart';

part 'app_db.g.dart';

@UseMoor(
  tables: [
    CredentialEntities,
    ProfileEntities,
    ProfileTypeEntities,
    RoleEntities,
    CityEntities,
    CheckUpIdEntities,
    PregnancyEntities,
    //BabyCheckUpIdEntities,
  ],
  daos: [
    CredentialDao,
    ProfileDao,
    ProfileTypeDao,
    RoleDao,
    CityDao,
    CheckUpIdDao,
    PregnancyDao,
    //BabyCheckUpIdDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<bool> deleteAllTable() async {
    try {
      await delete(credentialEntities).go();
      await delete(profileEntities).go();
      await delete(profileTypeEntities).go();
      await delete(roleEntities).go();
      await delete(cityEntities).go();
      await delete(checkUpIdEntities).go();
      //await delete(babyCheckUpIdEntities).go();
      return true;
    } catch(e, stack) {
      prine(stack);
      prinw("Error calling `deleteAllTable()`, e= $e");
      return false;
    }
  }

  /// Drop all tables.
  Future<bool> dropAllTable() async {
    try {
      final m = Migrator(this);
      for(final e in allSchemaEntities) {
        await m.drop(e);
      }
      return true;
    } catch(e, stack) {
      prine(stack);
      prinw("Error calling `dropAllTable()`, e= $e");
      return false;
    }
  }

  Future<List<String>> getAllTableName() async {
    final res = await customSelect("SELECT * FROM sqlite_master WHERE name NOT LIKE 'sqlite\\_%' escape '\\' AND name NOT LIKE '\\_%' escape '\\'")
        .get();

    return res.map((e) => e.data["name"] as String).toList(growable: false);
  }

  /// Drop all tables then recreate them.
  Future<bool> reset() async {
    if(!await dropAllTable()) {
      return false;
    }
    try {
      final m = Migrator(this);
      await m.createAll();
/*
      final allTableNames = await getAllTableName();
      prinw("`AppDatabase.reset()`, allTableNames = $allTableNames");
      for(final name in allTableNames) {
        final sql = getDropTableStatement(name);
        await customStatement(sql);
      }
      await customStatement("PRAGMA user_version = ''"); //reset the version as well.
 */
      return true;
    } catch(e, stack) {
      prinw("Error calling `AppDatabase.reset()`, e= $e");
      prine(stack);
      return false;
    }
  }
/*
  Future<void> deleteAllTable() async {
    executor.
    await delete(credentialEntities).go();
    await delete(profileEntities).go();
    await delete(profileTypeEntities).go();
    await delete(roleEntities).go();
    await delete(cityEntities).go();
    await delete(pregnancyCheckUpIdEntities).go();
    await delete(babyCheckUpIdEntities).go();
  }
 */
}