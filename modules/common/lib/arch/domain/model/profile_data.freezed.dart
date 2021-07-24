// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileCredentialTearOff {
  const _$ProfileCredentialTearOff();

  _ProfileCredential call({required int id, required String nik}) {
    return _ProfileCredential(
      id: id,
      nik: nik,
    );
  }
}

/// @nodoc
const $ProfileCredential = _$ProfileCredentialTearOff();

/// @nodoc
mixin _$ProfileCredential {
  int get id => throw _privateConstructorUsedError;
  String get nik => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileCredentialCopyWith<ProfileCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCredentialCopyWith<$Res> {
  factory $ProfileCredentialCopyWith(
          ProfileCredential value, $Res Function(ProfileCredential) then) =
      _$ProfileCredentialCopyWithImpl<$Res>;
  $Res call({int id, String nik});
}

/// @nodoc
class _$ProfileCredentialCopyWithImpl<$Res>
    implements $ProfileCredentialCopyWith<$Res> {
  _$ProfileCredentialCopyWithImpl(this._value, this._then);

  final ProfileCredential _value;
  // ignore: unused_field
  final $Res Function(ProfileCredential) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nik = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProfileCredentialCopyWith<$Res>
    implements $ProfileCredentialCopyWith<$Res> {
  factory _$ProfileCredentialCopyWith(
          _ProfileCredential value, $Res Function(_ProfileCredential) then) =
      __$ProfileCredentialCopyWithImpl<$Res>;
  @override
  $Res call({int id, String nik});
}

/// @nodoc
class __$ProfileCredentialCopyWithImpl<$Res>
    extends _$ProfileCredentialCopyWithImpl<$Res>
    implements _$ProfileCredentialCopyWith<$Res> {
  __$ProfileCredentialCopyWithImpl(
      _ProfileCredential _value, $Res Function(_ProfileCredential) _then)
      : super(_value, (v) => _then(v as _ProfileCredential));

  @override
  _ProfileCredential get _value => super._value as _ProfileCredential;

  @override
  $Res call({
    Object? id = freezed,
    Object? nik = freezed,
  }) {
    return _then(_ProfileCredential(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileCredential implements _ProfileCredential {
  const _$_ProfileCredential({required this.id, required this.nik});

  @override
  final int id;
  @override
  final String nik;

  @override
  String toString() {
    return 'ProfileCredential(id: $id, nik: $nik)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileCredential &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nik, nik) ||
                const DeepCollectionEquality().equals(other.nik, nik)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nik);

  @JsonKey(ignore: true)
  @override
  _$ProfileCredentialCopyWith<_ProfileCredential> get copyWith =>
      __$ProfileCredentialCopyWithImpl<_ProfileCredential>(this, _$identity);
}

abstract class _ProfileCredential implements ProfileCredential {
  const factory _ProfileCredential({required int id, required String nik}) =
      _$_ProfileCredential;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get nik => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProfileCredentialCopyWith<_ProfileCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchProfileIds _$BatchProfileIdsFromJson(Map<String, dynamic> json) {
  return _BatchProfileIds.fromJson(json);
}

/// @nodoc
class _$BatchProfileIdsTearOff {
  const _$BatchProfileIdsTearOff();

  _BatchProfileIds call(
      {required int motherId,
      required int fatherId,
      required List<int> childrenId}) {
    return _BatchProfileIds(
      motherId: motherId,
      fatherId: fatherId,
      childrenId: childrenId,
    );
  }

  BatchProfileIds fromJson(Map<String, Object> json) {
    return BatchProfileIds.fromJson(json);
  }
}

/// @nodoc
const $BatchProfileIds = _$BatchProfileIdsTearOff();

/// @nodoc
mixin _$BatchProfileIds {
  int get motherId => throw _privateConstructorUsedError;
  int get fatherId => throw _privateConstructorUsedError;
  List<int> get childrenId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchProfileIdsCopyWith<BatchProfileIds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchProfileIdsCopyWith<$Res> {
  factory $BatchProfileIdsCopyWith(
          BatchProfileIds value, $Res Function(BatchProfileIds) then) =
      _$BatchProfileIdsCopyWithImpl<$Res>;
  $Res call({int motherId, int fatherId, List<int> childrenId});
}

/// @nodoc
class _$BatchProfileIdsCopyWithImpl<$Res>
    implements $BatchProfileIdsCopyWith<$Res> {
  _$BatchProfileIdsCopyWithImpl(this._value, this._then);

  final BatchProfileIds _value;
  // ignore: unused_field
  final $Res Function(BatchProfileIds) _then;

  @override
  $Res call({
    Object? motherId = freezed,
    Object? fatherId = freezed,
    Object? childrenId = freezed,
  }) {
    return _then(_value.copyWith(
      motherId: motherId == freezed
          ? _value.motherId
          : motherId // ignore: cast_nullable_to_non_nullable
              as int,
      fatherId: fatherId == freezed
          ? _value.fatherId
          : fatherId // ignore: cast_nullable_to_non_nullable
              as int,
      childrenId: childrenId == freezed
          ? _value.childrenId
          : childrenId // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$BatchProfileIdsCopyWith<$Res>
    implements $BatchProfileIdsCopyWith<$Res> {
  factory _$BatchProfileIdsCopyWith(
          _BatchProfileIds value, $Res Function(_BatchProfileIds) then) =
      __$BatchProfileIdsCopyWithImpl<$Res>;
  @override
  $Res call({int motherId, int fatherId, List<int> childrenId});
}

/// @nodoc
class __$BatchProfileIdsCopyWithImpl<$Res>
    extends _$BatchProfileIdsCopyWithImpl<$Res>
    implements _$BatchProfileIdsCopyWith<$Res> {
  __$BatchProfileIdsCopyWithImpl(
      _BatchProfileIds _value, $Res Function(_BatchProfileIds) _then)
      : super(_value, (v) => _then(v as _BatchProfileIds));

  @override
  _BatchProfileIds get _value => super._value as _BatchProfileIds;

  @override
  $Res call({
    Object? motherId = freezed,
    Object? fatherId = freezed,
    Object? childrenId = freezed,
  }) {
    return _then(_BatchProfileIds(
      motherId: motherId == freezed
          ? _value.motherId
          : motherId // ignore: cast_nullable_to_non_nullable
              as int,
      fatherId: fatherId == freezed
          ? _value.fatherId
          : fatherId // ignore: cast_nullable_to_non_nullable
              as int,
      childrenId: childrenId == freezed
          ? _value.childrenId
          : childrenId // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BatchProfileIds implements _BatchProfileIds {
  const _$_BatchProfileIds(
      {required this.motherId,
      required this.fatherId,
      required this.childrenId});

  factory _$_BatchProfileIds.fromJson(Map<String, dynamic> json) =>
      _$_$_BatchProfileIdsFromJson(json);

  @override
  final int motherId;
  @override
  final int fatherId;
  @override
  final List<int> childrenId;

  @override
  String toString() {
    return 'BatchProfileIds(motherId: $motherId, fatherId: $fatherId, childrenId: $childrenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BatchProfileIds &&
            (identical(other.motherId, motherId) ||
                const DeepCollectionEquality()
                    .equals(other.motherId, motherId)) &&
            (identical(other.fatherId, fatherId) ||
                const DeepCollectionEquality()
                    .equals(other.fatherId, fatherId)) &&
            (identical(other.childrenId, childrenId) ||
                const DeepCollectionEquality()
                    .equals(other.childrenId, childrenId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(motherId) ^
      const DeepCollectionEquality().hash(fatherId) ^
      const DeepCollectionEquality().hash(childrenId);

  @JsonKey(ignore: true)
  @override
  _$BatchProfileIdsCopyWith<_BatchProfileIds> get copyWith =>
      __$BatchProfileIdsCopyWithImpl<_BatchProfileIds>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BatchProfileIdsToJson(this);
  }
}

abstract class _BatchProfileIds implements BatchProfileIds {
  const factory _BatchProfileIds(
      {required int motherId,
      required int fatherId,
      required List<int> childrenId}) = _$_BatchProfileIds;

  factory _BatchProfileIds.fromJson(Map<String, dynamic> json) =
      _$_BatchProfileIds.fromJson;

  @override
  int get motherId => throw _privateConstructorUsedError;
  @override
  int get fatherId => throw _privateConstructorUsedError;
  @override
  List<int> get childrenId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BatchProfileIdsCopyWith<_BatchProfileIds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BatchProfileServerTearOff {
  const _$BatchProfileServerTearOff();

  _BatchProfileServer call(
      {required ProfileEntity mother,
      required ProfileEntity father,
      required List<ProfileEntity> children,
      required List<PregnancyEntity> pregnancies,
      required DateTime? motherHpl}) {
    return _BatchProfileServer(
      mother: mother,
      father: father,
      children: children,
      pregnancies: pregnancies,
      motherHpl: motherHpl,
    );
  }
}

/// @nodoc
const $BatchProfileServer = _$BatchProfileServerTearOff();

/// @nodoc
mixin _$BatchProfileServer {
  ProfileEntity get mother => throw _privateConstructorUsedError;
  ProfileEntity get father => throw _privateConstructorUsedError;
  List<ProfileEntity> get children => throw _privateConstructorUsedError;
  List<PregnancyEntity> get pregnancies => throw _privateConstructorUsedError;
  DateTime? get motherHpl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BatchProfileServerCopyWith<BatchProfileServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchProfileServerCopyWith<$Res> {
  factory $BatchProfileServerCopyWith(
          BatchProfileServer value, $Res Function(BatchProfileServer) then) =
      _$BatchProfileServerCopyWithImpl<$Res>;
  $Res call(
      {ProfileEntity mother,
      ProfileEntity father,
      List<ProfileEntity> children,
      List<PregnancyEntity> pregnancies,
      DateTime? motherHpl});
}

/// @nodoc
class _$BatchProfileServerCopyWithImpl<$Res>
    implements $BatchProfileServerCopyWith<$Res> {
  _$BatchProfileServerCopyWithImpl(this._value, this._then);

  final BatchProfileServer _value;
  // ignore: unused_field
  final $Res Function(BatchProfileServer) _then;

  @override
  $Res call({
    Object? mother = freezed,
    Object? father = freezed,
    Object? children = freezed,
    Object? pregnancies = freezed,
    Object? motherHpl = freezed,
  }) {
    return _then(_value.copyWith(
      mother: mother == freezed
          ? _value.mother
          : mother // ignore: cast_nullable_to_non_nullable
              as ProfileEntity,
      father: father == freezed
          ? _value.father
          : father // ignore: cast_nullable_to_non_nullable
              as ProfileEntity,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ProfileEntity>,
      pregnancies: pregnancies == freezed
          ? _value.pregnancies
          : pregnancies // ignore: cast_nullable_to_non_nullable
              as List<PregnancyEntity>,
      motherHpl: motherHpl == freezed
          ? _value.motherHpl
          : motherHpl // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$BatchProfileServerCopyWith<$Res>
    implements $BatchProfileServerCopyWith<$Res> {
  factory _$BatchProfileServerCopyWith(
          _BatchProfileServer value, $Res Function(_BatchProfileServer) then) =
      __$BatchProfileServerCopyWithImpl<$Res>;
  @override
  $Res call(
      {ProfileEntity mother,
      ProfileEntity father,
      List<ProfileEntity> children,
      List<PregnancyEntity> pregnancies,
      DateTime? motherHpl});
}

/// @nodoc
class __$BatchProfileServerCopyWithImpl<$Res>
    extends _$BatchProfileServerCopyWithImpl<$Res>
    implements _$BatchProfileServerCopyWith<$Res> {
  __$BatchProfileServerCopyWithImpl(
      _BatchProfileServer _value, $Res Function(_BatchProfileServer) _then)
      : super(_value, (v) => _then(v as _BatchProfileServer));

  @override
  _BatchProfileServer get _value => super._value as _BatchProfileServer;

  @override
  $Res call({
    Object? mother = freezed,
    Object? father = freezed,
    Object? children = freezed,
    Object? pregnancies = freezed,
    Object? motherHpl = freezed,
  }) {
    return _then(_BatchProfileServer(
      mother: mother == freezed
          ? _value.mother
          : mother // ignore: cast_nullable_to_non_nullable
              as ProfileEntity,
      father: father == freezed
          ? _value.father
          : father // ignore: cast_nullable_to_non_nullable
              as ProfileEntity,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ProfileEntity>,
      pregnancies: pregnancies == freezed
          ? _value.pregnancies
          : pregnancies // ignore: cast_nullable_to_non_nullable
              as List<PregnancyEntity>,
      motherHpl: motherHpl == freezed
          ? _value.motherHpl
          : motherHpl // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_BatchProfileServer implements _BatchProfileServer {
  const _$_BatchProfileServer(
      {required this.mother,
      required this.father,
      required this.children,
      required this.pregnancies,
      required this.motherHpl});

  @override
  final ProfileEntity mother;
  @override
  final ProfileEntity father;
  @override
  final List<ProfileEntity> children;
  @override
  final List<PregnancyEntity> pregnancies;
  @override
  final DateTime? motherHpl;

  @override
  String toString() {
    return 'BatchProfileServer(mother: $mother, father: $father, children: $children, pregnancies: $pregnancies, motherHpl: $motherHpl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BatchProfileServer &&
            (identical(other.mother, mother) ||
                const DeepCollectionEquality().equals(other.mother, mother)) &&
            (identical(other.father, father) ||
                const DeepCollectionEquality().equals(other.father, father)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.pregnancies, pregnancies) ||
                const DeepCollectionEquality()
                    .equals(other.pregnancies, pregnancies)) &&
            (identical(other.motherHpl, motherHpl) ||
                const DeepCollectionEquality()
                    .equals(other.motherHpl, motherHpl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mother) ^
      const DeepCollectionEquality().hash(father) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(pregnancies) ^
      const DeepCollectionEquality().hash(motherHpl);

  @JsonKey(ignore: true)
  @override
  _$BatchProfileServerCopyWith<_BatchProfileServer> get copyWith =>
      __$BatchProfileServerCopyWithImpl<_BatchProfileServer>(this, _$identity);
}

abstract class _BatchProfileServer implements BatchProfileServer {
  const factory _BatchProfileServer(
      {required ProfileEntity mother,
      required ProfileEntity father,
      required List<ProfileEntity> children,
      required List<PregnancyEntity> pregnancies,
      required DateTime? motherHpl}) = _$_BatchProfileServer;

  @override
  ProfileEntity get mother => throw _privateConstructorUsedError;
  @override
  ProfileEntity get father => throw _privateConstructorUsedError;
  @override
  List<ProfileEntity> get children => throw _privateConstructorUsedError;
  @override
  List<PregnancyEntity> get pregnancies => throw _privateConstructorUsedError;
  @override
  DateTime? get motherHpl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BatchProfileServerCopyWith<_BatchProfileServer> get copyWith =>
      throw _privateConstructorUsedError;
}
