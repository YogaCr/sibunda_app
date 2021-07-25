import 'package:common/value/db_const.dart';
import 'package:moor/moor.dart';

@DataClassName("CheckUpIdEntity")
class CheckUpIdEntities extends Table {
  IntColumn get id => integer()();
  IntColumn get period => integer()();

  /// It can reference to either pregnancy id or profile serverId (for baby).
  /// We know this is not the best solution, yet.
  IntColumn get refId => integer().named("ref_id")();//.named("nik")
    //.customConstraint("REFERENCES profiles(nik)")();

  @override
  String get tableName => "check_up_ids"; //DbConst.NAME_PREGNANCY_CHECK_UP_ID;
}