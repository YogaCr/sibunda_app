
import 'package:common/value/db_const.dart';
import 'package:moor/moor.dart';

@DataClassName("CredentialEntity")
class CredentialEntities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  IntColumn get role => integer().customConstraint("REFERENCES roles(id)")();

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



@DataClassName("ProfileTypeEntity")
class ProfileTypeEntities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  String? get tableName => "profile_types"; //DbConst.NAME_ROLES;

  @override
  List<String> get customConstraints => [
    "UNIQUE (id, name)"
  ];
}

/// One user, can have many profiles. It is intended to suits the server side data structure.
@DataClassName("ProfileEntity")
class ProfileEntities extends Table {
  IntColumn get userId => integer().named("user_id").customConstraint("REFERENCES credentials(id)")();
  IntColumn get type => integer().customConstraint("REFERENCES profile_types(id)")();
  TextColumn get name => text()();
  TextColumn get nik => text()();
  DateTimeColumn get birthDate => dateTime().named("birth_date")();
  IntColumn get birthPlace => integer().named("birth_place")
      .customConstraint("REFERENCES cities(id)")();

  @override
  String? get tableName => "profiles"; //DbConst.NAME_PROFILES;

  @override
  Set<Column>? get primaryKey => {userId, type};

  @override
  List<String> get customConstraints => [
    "UNIQUE (nik)"
  ];
}