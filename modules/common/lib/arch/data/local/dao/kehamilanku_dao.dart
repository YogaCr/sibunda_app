
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/kehamilanku_entity.dart';
import 'package:moor/moor.dart';

part 'kehamilanku_dao.g.dart';

@UseDao(tables: [PregnancyCheckUpIdEntities])
class PregnancyCheckUpIdDao extends DatabaseAccessor<AppDatabase> with _$PregnancyCheckUpIdDaoMixin {
  PregnancyCheckUpIdDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<PregnancyCheckUpIdEntity> e) => into(pregnancyCheckUpIdEntities).insert(e);
  Future<int> deleteData(Insertable<PregnancyCheckUpIdEntity> e) => delete(pregnancyCheckUpIdEntities).delete(e);
  Future<PregnancyCheckUpIdEntity?> getByNikAndWeek({
    required String nik,
    required int week,
  }) => (select(pregnancyCheckUpIdEntities)
        ..where((it) => it.motherNik.equals(nik))
        ..where((it) => it.week.equals(week)))
      .getSingleOrNull();
}