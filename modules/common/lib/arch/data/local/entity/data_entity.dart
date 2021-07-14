import 'package:common/value/db_const.dart';
import 'package:moor/moor.dart';

@DataClassName("CityEntity")
class CityEntities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  String get tableName => "cities"; //DbConst.NAME_CITIES;

  @override
  List<String> get customConstraints => [
    "UNIQUE (id)"
  ];
}