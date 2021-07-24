
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/account_entity.dart';
import 'package:moor/moor.dart';

@DataClassName("PregnancyEntity")
class PregnancyEntities extends Table {
  /// This will be equivalent to [ProfileEntities.serverId]
  IntColumn get id => integer()();
  IntColumn get credentialId => integer().named("user_id").customConstraint("REFERENCES credentials(id)")();
  DateTimeColumn get hpl => dateTime()();

  @override
  String get tableName => "pregnancies"; //DbConst.NAME_CITIES;

  @override
  List<String> get customConstraints => [
    "UNIQUE (id, user_id)"
  ];
}