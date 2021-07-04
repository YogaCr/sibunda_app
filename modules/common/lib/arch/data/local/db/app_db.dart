import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/dao/kehamilanku_dao.dart';
import 'package:common/arch/data/local/entity/account_entity.dart';
import 'package:common/arch/data/local/entity/data_entity.dart';
import 'package:common/arch/data/local/entity/kehamilanku_entity.dart';
import 'package:moor/backends.dart';
import 'package:moor/moor.dart';

part 'app_db.g.dart';

@UseMoor(
  tables: [
    CredentialEntities,
    ProfileEntities,
    RoleEntities,
    CityEntities,
    PregnancyCheckUpIdEntities,
  ],
  daos: [
    CredentialDao,
    ProfileDao,
    RoleDao,
    CityDao,
    PregnancyCheckUpIdDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}