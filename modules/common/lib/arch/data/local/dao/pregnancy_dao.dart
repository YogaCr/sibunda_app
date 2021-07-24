
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/pregnancy_entity.dart';
import 'package:moor/moor.dart';

part 'pregnancy_dao.g.dart';

@UseDao(tables: [PregnancyEntities],)
class PregnancyDao extends DatabaseAccessor<AppDatabase> with _$PregnancyDaoMixin {
  PregnancyDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<PregnancyEntity>> getPregnancyOfUser(int credentialId) async =>
    (select(pregnancyEntities)..where((it) => it.credentialId.equals(credentialId))).get();

  Future<PregnancyEntity?> getById(int id) async =>
    (select(pregnancyEntities)..where((it) => it.id.equals(id))).getSingleOrNull();

  Future<int> insert(Insertable<PregnancyEntity> e) => into(pregnancyEntities).insert(e);
  Future<void> insertAll(List<Insertable<PregnancyEntity>> e) => batch((batch) => batch.insertAll(pregnancyEntities, e));

  Future<int> deleteAll() => delete(pregnancyEntities).go();
}