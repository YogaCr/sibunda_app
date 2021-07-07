
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/check_up_entity.dart';
import 'package:moor/moor.dart';

part 'check_up_dao.g.dart';

@UseDao(tables: [CheckUpIdEntities])
class CheckUpIdDao extends DatabaseAccessor<AppDatabase> with _$CheckUpIdDaoMixin {
  CheckUpIdDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<CheckUpIdEntity> e) => into(checkUpIdEntities).insert(e);
  Future<int> deleteData(Insertable<CheckUpIdEntity> e) => delete(checkUpIdEntities).delete(e);
  Future<CheckUpIdEntity?> getByNikAndPeriod({
    required String nik,
    required int period,
  }) => (select(checkUpIdEntities)
        ..where((it) => it.nik.equals(nik))
        ..where((it) => it.period.equals(period)))
      .getSingleOrNull();
}