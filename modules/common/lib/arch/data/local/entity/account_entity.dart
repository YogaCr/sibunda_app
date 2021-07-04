
import 'package:common/value/db_const.dart';
import 'package:moor/moor.dart';

@DataClassName("CredentialEntity")
class CredentialEntities extends Table {
  IntColumn get id => integer()();
  //TextColumn get name => text()();
  TextColumn get email => text()();

  @override
  String? get tableName => "credentials"; //DbConst.NAME_CREDENTIALS;

  @override
  List<String> get customConstraints => [
    "UNIQUE (id, email)"
  ];
}

@DataClassName("RoleEntity")
class RoleEntities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  
  @override
  String? get tableName => "roles"; //DbConst.NAME_ROLES;

  @override
  List<String> get customConstraints => [
    "UNIQUE (id, name)"
  ];
}

@DataClassName("ProfileEntity")
class ProfileEntities extends Table {
  IntColumn get id => integer().customConstraint("REFERENCES credentials(id)")();
  IntColumn get role => integer().customConstraint("REFERENCES roles(id)")();
  TextColumn get name => text()();
  TextColumn get nik => text()();
  DateTimeColumn get birthDate => dateTime().named("birth_date")();
  IntColumn get birthPlace => integer().named("birth_place")
      .customConstraint("REFERENCES cities(id)")();

  @override
  String? get tableName => "profiles"; //DbConst.NAME_PROFILES;
}