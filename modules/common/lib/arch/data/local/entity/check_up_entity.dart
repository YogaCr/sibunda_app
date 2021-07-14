import 'package:common/value/db_const.dart';
import 'package:moor/moor.dart';

@DataClassName("CheckUpIdEntity")
class CheckUpIdEntities extends Table {
  IntColumn get id => integer()();
  IntColumn get period => integer()();
  TextColumn get nik => text()//.named("nik")
    .customConstraint("REFERENCES profiles(nik)")();

  @override
  String get tableName => "check_up_ids"; //DbConst.NAME_PREGNANCY_CHECK_UP_ID;
}