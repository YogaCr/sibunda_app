import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/baby_dao.dart';
import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/entity/account_entity.dart';
import 'package:common/arch/data/local/entity/baby_entity.dart';
import 'package:common/arch/data/local/entity/data_entity.dart';
import 'package:common/arch/data/local/entity/check_up_entity.dart';
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
    BabyCheckUpIdEntities,
  ],
  daos: [
    CredentialDao,
    ProfileDao,
    ProfileTypeDao,
    RoleDao,
    CityDao,
    CheckUpIdDao,
    BabyCheckUpIdDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllTable() async {
    await delete(credentialEntities).go();
    await delete(profileEntities).go();
    await delete(profileTypeEntities).go();
    await delete(roleEntities).go();
    await delete(cityEntities).go();
    await delete(checkUpIdEntities).go();
    await delete(babyCheckUpIdEntities).go();
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