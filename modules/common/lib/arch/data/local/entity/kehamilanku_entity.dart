import 'package:common/value/db_const.dart';
import 'package:moor/moor.dart';

@DataClassName("PregnancyCheckUpIdEntity")
class PregnancyCheckUpIdEntities extends Table {
  IntColumn get id => integer()();
  IntColumn get week => integer()();
  TextColumn get motherNik => text().named("mother_nik")
    .customConstraint("REFERENCES profiles(nik)")();

  @override
  String? get tableName => "pregnancy_check_up_ids"; //DbConst.NAME_PREGNANCY_CHECK_UP_ID;

  @override
  Set<Column>? get primaryKey => {id};
}