
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/check_up_entity.dart';
import 'package:common/util/db_util.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/moor.dart';

part 'check_up_dao.g.dart';

@UseDao(tables: [CheckUpIdEntities])
class CheckUpIdDao extends DatabaseAccessor<AppDatabase> with _$CheckUpIdDaoMixin {
  CheckUpIdDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<bool> dropTable() async {
    try {
      await customStatement(getDropTableStatement(checkUpIdEntities.tableName));
      return true;
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return false;
    }
  }
  Future<int> insert(Insertable<CheckUpIdEntity> e) => into(checkUpIdEntities).insert(e);
  Future<int> deleteData(Insertable<CheckUpIdEntity> e) => delete(checkUpIdEntities).delete(e);
  Future<int> deleteAll() => delete(checkUpIdEntities).go();
  Future<List<CheckUpIdEntity>> getAll() => select(checkUpIdEntities).get();
  Future<CheckUpIdEntity?> getByRefIdAndPeriod({
    required int refId,
    required int period,
    int? type,
  }) {
    final sel = select(checkUpIdEntities)
      ..where((it) => it.refId.equals(refId))
      ..where((it) => it.period.equals(period));
    if(type != null) {
      sel.where((it) => it.type.equals(type));
    }
    return sel.getSingleOrNull();
  }
}