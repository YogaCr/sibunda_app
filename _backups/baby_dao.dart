
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/baby_entity.dart';
import 'package:common/arch/data/local/entity/check_up_entity.dart';
import 'package:common/util/db_util.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/moor.dart';

/*
part 'baby_dao.g.dart';

@UseDao(tables: [BabyCheckUpIdEntities])
class BabyCheckUpIdDao extends DatabaseAccessor<AppDatabase> with _$BabyCheckUpIdDaoMixin {
  BabyCheckUpIdDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<bool> dropTable() async {
    try {
      await customStatement(getDropTableStatement(babyCheckUpIdEntities.tableName));
      return true;
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return false;
    }
  }
  Future<int> insert(Insertable<BabyCheckUpIdEntity> e) => into(babyCheckUpIdEntities).insert(e);
  Future<int> deleteData(Insertable<BabyCheckUpIdEntity> e) => delete(babyCheckUpIdEntities).delete(e);
  Future<BabyCheckUpIdEntity?> getByNikAndMonth({
    required String nik,
    required int month,
  }) => (select(babyCheckUpIdEntities)
        ..where((it) => it.babyNik.equals(nik))
        ..where((it) => it.month.equals(month)))
      .getSingleOrNull();
}
 */