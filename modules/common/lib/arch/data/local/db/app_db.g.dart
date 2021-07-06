// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CredentialEntity extends DataClass
    implements Insertable<CredentialEntity> {
  final int id;
  final String name;
  final String email;
  final int role;
  CredentialEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.role});
  factory CredentialEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CredentialEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      role: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}role'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['role'] = Variable<int>(role);
    return map;
  }

  CredentialEntitiesCompanion toCompanion(bool nullToAbsent) {
    return CredentialEntitiesCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      role: Value(role),
    );
  }

  factory CredentialEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CredentialEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      role: serializer.fromJson<int>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'role': serializer.toJson<int>(role),
    };
  }

  CredentialEntity copyWith(
          {int? id, String? name, String? email, int? role}) =>
      CredentialEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        role: role ?? this.role,
      );
  @override
  String toString() {
    return (StringBuffer('CredentialEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(name.hashCode, $mrjc(email.hashCode, role.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CredentialEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.role == this.role);
}

class CredentialEntitiesCompanion extends UpdateCompanion<CredentialEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<int> role;
  const CredentialEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
  });
  CredentialEntitiesCompanion.insert({
    required int id,
    required String name,
    required String email,
    required int role,
  })  : id = Value(id),
        name = Value(name),
        email = Value(email),
        role = Value(role);
  static Insertable<CredentialEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<int>? role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
    });
  }

  CredentialEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<int>? role}) {
    return CredentialEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<int>(role.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CredentialEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

class $CredentialEntitiesTable extends CredentialEntities
    with TableInfo<$CredentialEntitiesTable, CredentialEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CredentialEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _roleMeta = const VerificationMeta('role');
  late final GeneratedColumn<int?> role = GeneratedColumn<int?>(
      'role', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES roles(id)');
  @override
  List<GeneratedColumn> get $columns => [id, name, email, role];
  @override
  String get aliasedName => _alias ?? 'credentials';
  @override
  String get actualTableName => 'credentials';
  @override
  VerificationContext validateIntegrity(Insertable<CredentialEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CredentialEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CredentialEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CredentialEntitiesTable createAlias(String alias) {
    return $CredentialEntitiesTable(_db, alias);
  }
}

class ProfileEntity extends DataClass implements Insertable<ProfileEntity> {
  final int userId;
  final int type;
  final String name;
  final String nik;
  final DateTime birthDate;
  final int birthPlace;
  ProfileEntity(
      {required this.userId,
      required this.type,
      required this.name,
      required this.nik,
      required this.birthDate,
      required this.birthPlace});
  factory ProfileEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProfileEntity(
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nik: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nik'])!,
      birthDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date'])!,
      birthPlace: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_place'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['type'] = Variable<int>(type);
    map['name'] = Variable<String>(name);
    map['nik'] = Variable<String>(nik);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['birth_place'] = Variable<int>(birthPlace);
    return map;
  }

  ProfileEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ProfileEntitiesCompanion(
      userId: Value(userId),
      type: Value(type),
      name: Value(name),
      nik: Value(nik),
      birthDate: Value(birthDate),
      birthPlace: Value(birthPlace),
    );
  }

  factory ProfileEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProfileEntity(
      userId: serializer.fromJson<int>(json['userId']),
      type: serializer.fromJson<int>(json['type']),
      name: serializer.fromJson<String>(json['name']),
      nik: serializer.fromJson<String>(json['nik']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      birthPlace: serializer.fromJson<int>(json['birthPlace']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'type': serializer.toJson<int>(type),
      'name': serializer.toJson<String>(name),
      'nik': serializer.toJson<String>(nik),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'birthPlace': serializer.toJson<int>(birthPlace),
    };
  }

  ProfileEntity copyWith(
          {int? userId,
          int? type,
          String? name,
          String? nik,
          DateTime? birthDate,
          int? birthPlace}) =>
      ProfileEntity(
        userId: userId ?? this.userId,
        type: type ?? this.type,
        name: name ?? this.name,
        nik: nik ?? this.nik,
        birthDate: birthDate ?? this.birthDate,
        birthPlace: birthPlace ?? this.birthPlace,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileEntity(')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('nik: $nik, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthPlace: $birthPlace')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      userId.hashCode,
      $mrjc(
          type.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(nik.hashCode,
                  $mrjc(birthDate.hashCode, birthPlace.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileEntity &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.name == this.name &&
          other.nik == this.nik &&
          other.birthDate == this.birthDate &&
          other.birthPlace == this.birthPlace);
}

class ProfileEntitiesCompanion extends UpdateCompanion<ProfileEntity> {
  final Value<int> userId;
  final Value<int> type;
  final Value<String> name;
  final Value<String> nik;
  final Value<DateTime> birthDate;
  final Value<int> birthPlace;
  const ProfileEntitiesCompanion({
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.nik = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.birthPlace = const Value.absent(),
  });
  ProfileEntitiesCompanion.insert({
    required int userId,
    required int type,
    required String name,
    required String nik,
    required DateTime birthDate,
    required int birthPlace,
  })  : userId = Value(userId),
        type = Value(type),
        name = Value(name),
        nik = Value(nik),
        birthDate = Value(birthDate),
        birthPlace = Value(birthPlace);
  static Insertable<ProfileEntity> custom({
    Expression<int>? userId,
    Expression<int>? type,
    Expression<String>? name,
    Expression<String>? nik,
    Expression<DateTime>? birthDate,
    Expression<int>? birthPlace,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (nik != null) 'nik': nik,
      if (birthDate != null) 'birth_date': birthDate,
      if (birthPlace != null) 'birth_place': birthPlace,
    });
  }

  ProfileEntitiesCompanion copyWith(
      {Value<int>? userId,
      Value<int>? type,
      Value<String>? name,
      Value<String>? nik,
      Value<DateTime>? birthDate,
      Value<int>? birthPlace}) {
    return ProfileEntitiesCompanion(
      userId: userId ?? this.userId,
      type: type ?? this.type,
      name: name ?? this.name,
      nik: nik ?? this.nik,
      birthDate: birthDate ?? this.birthDate,
      birthPlace: birthPlace ?? this.birthPlace,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nik.present) {
      map['nik'] = Variable<String>(nik.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (birthPlace.present) {
      map['birth_place'] = Variable<int>(birthPlace.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileEntitiesCompanion(')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('nik: $nik, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthPlace: $birthPlace')
          ..write(')'))
        .toString();
  }
}

class $ProfileEntitiesTable extends ProfileEntities
    with TableInfo<$ProfileEntitiesTable, ProfileEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProfileEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES credentials(id)');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<int?> type = GeneratedColumn<int?>(
      'type', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES profile_types(id)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nikMeta = const VerificationMeta('nik');
  late final GeneratedColumn<String?> nik = GeneratedColumn<String?>(
      'nik', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  late final GeneratedColumn<DateTime?> birthDate = GeneratedColumn<DateTime?>(
      'birth_date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _birthPlaceMeta = const VerificationMeta('birthPlace');
  late final GeneratedColumn<int?> birthPlace = GeneratedColumn<int?>(
      'birth_place', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES cities(id)');
  @override
  List<GeneratedColumn> get $columns =>
      [userId, type, name, nik, birthDate, birthPlace];
  @override
  String get aliasedName => _alias ?? 'profiles';
  @override
  String get actualTableName => 'profiles';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nik')) {
      context.handle(
          _nikMeta, nik.isAcceptableOrUnknown(data['nik']!, _nikMeta));
    } else if (isInserting) {
      context.missing(_nikMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('birth_place')) {
      context.handle(
          _birthPlaceMeta,
          birthPlace.isAcceptableOrUnknown(
              data['birth_place']!, _birthPlaceMeta));
    } else if (isInserting) {
      context.missing(_birthPlaceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, type};
  @override
  ProfileEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProfileEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProfileEntitiesTable createAlias(String alias) {
    return $ProfileEntitiesTable(_db, alias);
  }
}

class ProfileTypeEntity extends DataClass
    implements Insertable<ProfileTypeEntity> {
  final int id;
  final String name;
  ProfileTypeEntity({required this.id, required this.name});
  factory ProfileTypeEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProfileTypeEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ProfileTypeEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ProfileTypeEntitiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory ProfileTypeEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProfileTypeEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ProfileTypeEntity copyWith({int? id, String? name}) => ProfileTypeEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileTypeEntity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileTypeEntity &&
          other.id == this.id &&
          other.name == this.name);
}

class ProfileTypeEntitiesCompanion extends UpdateCompanion<ProfileTypeEntity> {
  final Value<int> id;
  final Value<String> name;
  const ProfileTypeEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ProfileTypeEntitiesCompanion.insert({
    required int id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<ProfileTypeEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ProfileTypeEntitiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ProfileTypeEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileTypeEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ProfileTypeEntitiesTable extends ProfileTypeEntities
    with TableInfo<$ProfileTypeEntitiesTable, ProfileTypeEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProfileTypeEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'profile_types';
  @override
  String get actualTableName => 'profile_types';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileTypeEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ProfileTypeEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProfileTypeEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProfileTypeEntitiesTable createAlias(String alias) {
    return $ProfileTypeEntitiesTable(_db, alias);
  }
}

class RoleEntity extends DataClass implements Insertable<RoleEntity> {
  final int id;
  final String name;
  RoleEntity({required this.id, required this.name});
  factory RoleEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RoleEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  RoleEntitiesCompanion toCompanion(bool nullToAbsent) {
    return RoleEntitiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory RoleEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoleEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  RoleEntity copyWith({int? id, String? name}) => RoleEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('RoleEntity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoleEntity && other.id == this.id && other.name == this.name);
}

class RoleEntitiesCompanion extends UpdateCompanion<RoleEntity> {
  final Value<int> id;
  final Value<String> name;
  const RoleEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  RoleEntitiesCompanion.insert({
    required int id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<RoleEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  RoleEntitiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return RoleEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoleEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RoleEntitiesTable extends RoleEntities
    with TableInfo<$RoleEntitiesTable, RoleEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RoleEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'roles';
  @override
  String get actualTableName => 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<RoleEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  RoleEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RoleEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoleEntitiesTable createAlias(String alias) {
    return $RoleEntitiesTable(_db, alias);
  }
}

class CityEntity extends DataClass implements Insertable<CityEntity> {
  final int id;
  final String name;
  CityEntity({required this.id, required this.name});
  factory CityEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CityEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CityEntitiesCompanion toCompanion(bool nullToAbsent) {
    return CityEntitiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory CityEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CityEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CityEntity copyWith({int? id, String? name}) => CityEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CityEntity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CityEntity && other.id == this.id && other.name == this.name);
}

class CityEntitiesCompanion extends UpdateCompanion<CityEntity> {
  final Value<int> id;
  final Value<String> name;
  const CityEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CityEntitiesCompanion.insert({
    required int id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<CityEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CityEntitiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CityEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CityEntitiesTable extends CityEntities
    with TableInfo<$CityEntitiesTable, CityEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CityEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'cities';
  @override
  String get actualTableName => 'cities';
  @override
  VerificationContext validateIntegrity(Insertable<CityEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CityEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CityEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CityEntitiesTable createAlias(String alias) {
    return $CityEntitiesTable(_db, alias);
  }
}

class PregnancyCheckUpIdEntity extends DataClass
    implements Insertable<PregnancyCheckUpIdEntity> {
  final int id;
  final int week;
  final String motherNik;
  PregnancyCheckUpIdEntity(
      {required this.id, required this.week, required this.motherNik});
  factory PregnancyCheckUpIdEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PregnancyCheckUpIdEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      week: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}week'])!,
      motherNik: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mother_nik'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['week'] = Variable<int>(week);
    map['mother_nik'] = Variable<String>(motherNik);
    return map;
  }

  PregnancyCheckUpIdEntitiesCompanion toCompanion(bool nullToAbsent) {
    return PregnancyCheckUpIdEntitiesCompanion(
      id: Value(id),
      week: Value(week),
      motherNik: Value(motherNik),
    );
  }

  factory PregnancyCheckUpIdEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PregnancyCheckUpIdEntity(
      id: serializer.fromJson<int>(json['id']),
      week: serializer.fromJson<int>(json['week']),
      motherNik: serializer.fromJson<String>(json['motherNik']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'week': serializer.toJson<int>(week),
      'motherNik': serializer.toJson<String>(motherNik),
    };
  }

  PregnancyCheckUpIdEntity copyWith({int? id, int? week, String? motherNik}) =>
      PregnancyCheckUpIdEntity(
        id: id ?? this.id,
        week: week ?? this.week,
        motherNik: motherNik ?? this.motherNik,
      );
  @override
  String toString() {
    return (StringBuffer('PregnancyCheckUpIdEntity(')
          ..write('id: $id, ')
          ..write('week: $week, ')
          ..write('motherNik: $motherNik')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(week.hashCode, motherNik.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PregnancyCheckUpIdEntity &&
          other.id == this.id &&
          other.week == this.week &&
          other.motherNik == this.motherNik);
}

class PregnancyCheckUpIdEntitiesCompanion
    extends UpdateCompanion<PregnancyCheckUpIdEntity> {
  final Value<int> id;
  final Value<int> week;
  final Value<String> motherNik;
  const PregnancyCheckUpIdEntitiesCompanion({
    this.id = const Value.absent(),
    this.week = const Value.absent(),
    this.motherNik = const Value.absent(),
  });
  PregnancyCheckUpIdEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int week,
    required String motherNik,
  })  : week = Value(week),
        motherNik = Value(motherNik);
  static Insertable<PregnancyCheckUpIdEntity> custom({
    Expression<int>? id,
    Expression<int>? week,
    Expression<String>? motherNik,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (week != null) 'week': week,
      if (motherNik != null) 'mother_nik': motherNik,
    });
  }

  PregnancyCheckUpIdEntitiesCompanion copyWith(
      {Value<int>? id, Value<int>? week, Value<String>? motherNik}) {
    return PregnancyCheckUpIdEntitiesCompanion(
      id: id ?? this.id,
      week: week ?? this.week,
      motherNik: motherNik ?? this.motherNik,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (week.present) {
      map['week'] = Variable<int>(week.value);
    }
    if (motherNik.present) {
      map['mother_nik'] = Variable<String>(motherNik.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PregnancyCheckUpIdEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('week: $week, ')
          ..write('motherNik: $motherNik')
          ..write(')'))
        .toString();
  }
}

class $PregnancyCheckUpIdEntitiesTable extends PregnancyCheckUpIdEntities
    with TableInfo<$PregnancyCheckUpIdEntitiesTable, PregnancyCheckUpIdEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PregnancyCheckUpIdEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _weekMeta = const VerificationMeta('week');
  late final GeneratedColumn<int?> week = GeneratedColumn<int?>(
      'week', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _motherNikMeta = const VerificationMeta('motherNik');
  late final GeneratedColumn<String?> motherNik = GeneratedColumn<String?>(
      'mother_nik', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES profiles(nik)');
  @override
  List<GeneratedColumn> get $columns => [id, week, motherNik];
  @override
  String get aliasedName => _alias ?? 'pregnancy_check_up_ids';
  @override
  String get actualTableName => 'pregnancy_check_up_ids';
  @override
  VerificationContext validateIntegrity(
      Insertable<PregnancyCheckUpIdEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('week')) {
      context.handle(
          _weekMeta, week.isAcceptableOrUnknown(data['week']!, _weekMeta));
    } else if (isInserting) {
      context.missing(_weekMeta);
    }
    if (data.containsKey('mother_nik')) {
      context.handle(_motherNikMeta,
          motherNik.isAcceptableOrUnknown(data['mother_nik']!, _motherNikMeta));
    } else if (isInserting) {
      context.missing(_motherNikMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PregnancyCheckUpIdEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return PregnancyCheckUpIdEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PregnancyCheckUpIdEntitiesTable createAlias(String alias) {
    return $PregnancyCheckUpIdEntitiesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CredentialEntitiesTable credentialEntities =
      $CredentialEntitiesTable(this);
  late final $ProfileEntitiesTable profileEntities =
      $ProfileEntitiesTable(this);
  late final $ProfileTypeEntitiesTable profileTypeEntities =
      $ProfileTypeEntitiesTable(this);
  late final $RoleEntitiesTable roleEntities = $RoleEntitiesTable(this);
  late final $CityEntitiesTable cityEntities = $CityEntitiesTable(this);
  late final $PregnancyCheckUpIdEntitiesTable pregnancyCheckUpIdEntities =
      $PregnancyCheckUpIdEntitiesTable(this);
  late final CredentialDao credentialDao = CredentialDao(this as AppDatabase);
  late final ProfileDao profileDao = ProfileDao(this as AppDatabase);
  late final ProfileTypeDao profileTypeDao =
      ProfileTypeDao(this as AppDatabase);
  late final RoleDao roleDao = RoleDao(this as AppDatabase);
  late final CityDao cityDao = CityDao(this as AppDatabase);
  late final PregnancyCheckUpIdDao pregnancyCheckUpIdDao =
      PregnancyCheckUpIdDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        credentialEntities,
        profileEntities,
        profileTypeEntities,
        roleEntities,
        cityEntities,
        pregnancyCheckUpIdEntities
      ];
}
