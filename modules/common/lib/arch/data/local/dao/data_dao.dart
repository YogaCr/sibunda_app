
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/data_entity.dart';
import 'package:common/util/db_util.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/moor.dart';

part 'data_dao.g.dart';

@UseDao(tables: [CityEntities],)
class CityDao extends DatabaseAccessor<AppDatabase> with _$CityDaoMixin {
  CityDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<bool> dropTable() async {
    try {
      await customStatement(getDropTableStatement(cityEntities.tableName));
      return true;
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return false;
    }
  }
  Future<void> insertAll(List<Insertable<CityEntity>> list) => batch((batch) => batch.insertAll(cityEntities, list));
  Future<int> insert(Insertable<CityEntity> e) => into(cityEntities).insert(e);
  Future<int> deleteData(Insertable<CityEntity> e) => delete(cityEntities).delete(e);
  Future<List<CityEntity>> get({ int? limit, int? offset}) async {
    prind("city dao get AWAL");
    final sel = select(cityEntities);
    prind("city dao get sel= $sel");
    if(limit != null) {
      sel.limit(limit, offset: offset);
    }
    try {
      final res = await sel.get();
      prind("city dao get() res= $res");
      return res;
    } catch(e, stack) {
      prine(e);
      prine(stack);
      rethrow;
    }
  }
  Future<CityEntity?> getById(int id) => (select(cityEntities)..where((it) => it.id.equals(id))).getSingleOrNull();
  Future<CityEntity?> getByName(String name) => (select(cityEntities)..where((it) => it.name.equals(name))).getSingleOrNull();
}