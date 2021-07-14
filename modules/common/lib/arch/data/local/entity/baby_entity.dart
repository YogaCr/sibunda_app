import 'package:common/value/db_const.dart';
import 'package:moor/moor.dart';

/*
@DataClassName("BabyCheckUpIdEntity")
class BabyCheckUpIdEntities extends Table {
  IntColumn get id => integer()();
  IntColumn get month => integer()();
  TextColumn get babyNik => text().named("baby_nik")
      .customConstraint("REFERENCES profiles(nik)")();

  @override
  String? get tableName => "baby_check_up_ids"; //DbConst.NAME_BABY_CHECK_UP_ID;

  @override
  Set<Column>? get primaryKey => {id};
}
 */