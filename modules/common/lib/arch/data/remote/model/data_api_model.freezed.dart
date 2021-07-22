// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'data_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BioResponse _$BioResponseFromJson(Map<String, dynamic> json) {
  return _BioResponse.fromJson(json);
}

/// @nodoc
class _$BioResponseTearOff {
  const _$BioResponseTearOff();

  _BioResponse call(
      {required String message,
      required String status,
      required int code,
      required List<BioMotherResponse> data}) {
    return _BioResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BioResponse fromJson(Map<String, Object> json) {
    return BioResponse.fromJson(json);
  }
}

/// @nodoc
const $BioResponse = _$BioResponseTearOff();

/// @nodoc
mixin _$BioResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  List<BioMotherResponse> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BioResponseCopyWith<BioResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BioResponseCopyWith<$Res> {
  factory $BioResponseCopyWith(
          BioResponse value, $Res Function(BioResponse) then) =
      _$BioResponseCopyWithImpl<$Res>;
  $Res call(
      {String message, String status, int code, List<BioMotherResponse> data});
}

/// @nodoc
class _$BioResponseCopyWithImpl<$Res> implements $BioResponseCopyWith<$Res> {
  _$BioResponseCopyWithImpl(this._value, this._then);

  final BioResponse _value;
  // ignore: unused_field
  final $Res Function(BioResponse) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BioMotherResponse>,
    ));
  }
}

/// @nodoc
abstract class _$BioResponseCopyWith<$Res>
    implements $BioResponseCopyWith<$Res> {
  factory _$BioResponseCopyWith(
          _BioResponse value, $Res Function(_BioResponse) then) =
      __$BioResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message, String status, int code, List<BioMotherResponse> data});
}

/// @nodoc
class __$BioResponseCopyWithImpl<$Res> extends _$BioResponseCopyWithImpl<$Res>
    implements _$BioResponseCopyWith<$Res> {
  __$BioResponseCopyWithImpl(
      _BioResponse _value, $Res Function(_BioResponse) _then)
      : super(_value, (v) => _then(v as _BioResponse));

  @override
  _BioResponse get _value => super._value as _BioResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BioResponse(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BioMotherResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BioResponse implements _BioResponse {
  const _$_BioResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BioResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BioResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final List<BioMotherResponse> data;

  @override
  String toString() {
    return 'BioResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BioResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$BioResponseCopyWith<_BioResponse> get copyWith =>
      __$BioResponseCopyWithImpl<_BioResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BioResponseToJson(this);
  }
}

abstract class _BioResponse implements BioResponse {
  const factory _BioResponse(
      {required String message,
      required String status,
      required int code,
      required List<BioMotherResponse> data}) = _$_BioResponse;

  factory _BioResponse.fromJson(Map<String, dynamic> json) =
      _$_BioResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  List<BioMotherResponse> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BioResponseCopyWith<_BioResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BioMotherResponse _$BioMotherResponseFromJson(Map<String, dynamic> json) {
  return _BioMotherResponse.fromJson(json);
}

/// @nodoc
class _$BioMotherResponseTearOff {
  const _$BioMotherResponseTearOff();

  _BioMotherResponse call(
      {required int id,
      required int user_id,
      required String nama,
      required String nik,
      required String pembiayaan,
      required String no_jkn,
      required String faskes_tk1,
      required String faskes_rujukan,
      required String gol_darah,
      required int tempat_lahir,
      required String tanggal_lahir,
      required String pendidikan,
      required String pekerjaan,
      required String alamat_rumah,
      required String telp,
      required String puskesmas_domisili,
      required String nomor_register_kohort_ibu,
      required BioFatherResponse kia_ayah,
      required List<BioChildResponse> kia_anak}) {
    return _BioMotherResponse(
      id: id,
      user_id: user_id,
      nama: nama,
      nik: nik,
      pembiayaan: pembiayaan,
      no_jkn: no_jkn,
      faskes_tk1: faskes_tk1,
      faskes_rujukan: faskes_rujukan,
      gol_darah: gol_darah,
      tempat_lahir: tempat_lahir,
      tanggal_lahir: tanggal_lahir,
      pendidikan: pendidikan,
      pekerjaan: pekerjaan,
      alamat_rumah: alamat_rumah,
      telp: telp,
      puskesmas_domisili: puskesmas_domisili,
      nomor_register_kohort_ibu: nomor_register_kohort_ibu,
      kia_ayah: kia_ayah,
      kia_anak: kia_anak,
    );
  }

  BioMotherResponse fromJson(Map<String, Object> json) {
    return BioMotherResponse.fromJson(json);
  }
}

/// @nodoc
const $BioMotherResponse = _$BioMotherResponseTearOff();

/// @nodoc
mixin _$BioMotherResponse {
  int get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get nik => throw _privateConstructorUsedError;
  String get pembiayaan => throw _privateConstructorUsedError;
  String get no_jkn => throw _privateConstructorUsedError;
  String get faskes_tk1 => throw _privateConstructorUsedError;
  String get faskes_rujukan => throw _privateConstructorUsedError;
  String get gol_darah => throw _privateConstructorUsedError;
  int get tempat_lahir => throw _privateConstructorUsedError;
  String get tanggal_lahir => throw _privateConstructorUsedError;
  String get pendidikan => throw _privateConstructorUsedError;
  String get pekerjaan => throw _privateConstructorUsedError;
  String get alamat_rumah => throw _privateConstructorUsedError;
  String get telp => throw _privateConstructorUsedError;
  String get puskesmas_domisili => throw _privateConstructorUsedError;
  String get nomor_register_kohort_ibu => throw _privateConstructorUsedError;
  BioFatherResponse get kia_ayah => throw _privateConstructorUsedError;
  List<BioChildResponse> get kia_anak => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BioMotherResponseCopyWith<BioMotherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BioMotherResponseCopyWith<$Res> {
  factory $BioMotherResponseCopyWith(
          BioMotherResponse value, $Res Function(BioMotherResponse) then) =
      _$BioMotherResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int user_id,
      String nama,
      String nik,
      String pembiayaan,
      String no_jkn,
      String faskes_tk1,
      String faskes_rujukan,
      String gol_darah,
      int tempat_lahir,
      String tanggal_lahir,
      String pendidikan,
      String pekerjaan,
      String alamat_rumah,
      String telp,
      String puskesmas_domisili,
      String nomor_register_kohort_ibu,
      BioFatherResponse kia_ayah,
      List<BioChildResponse> kia_anak});

  $BioFatherResponseCopyWith<$Res> get kia_ayah;
}

/// @nodoc
class _$BioMotherResponseCopyWithImpl<$Res>
    implements $BioMotherResponseCopyWith<$Res> {
  _$BioMotherResponseCopyWithImpl(this._value, this._then);

  final BioMotherResponse _value;
  // ignore: unused_field
  final $Res Function(BioMotherResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? nama = freezed,
    Object? nik = freezed,
    Object? pembiayaan = freezed,
    Object? no_jkn = freezed,
    Object? faskes_tk1 = freezed,
    Object? faskes_rujukan = freezed,
    Object? gol_darah = freezed,
    Object? tempat_lahir = freezed,
    Object? tanggal_lahir = freezed,
    Object? pendidikan = freezed,
    Object? pekerjaan = freezed,
    Object? alamat_rumah = freezed,
    Object? telp = freezed,
    Object? puskesmas_domisili = freezed,
    Object? nomor_register_kohort_ibu = freezed,
    Object? kia_ayah = freezed,
    Object? kia_anak = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
      pembiayaan: pembiayaan == freezed
          ? _value.pembiayaan
          : pembiayaan // ignore: cast_nullable_to_non_nullable
              as String,
      no_jkn: no_jkn == freezed
          ? _value.no_jkn
          : no_jkn // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_tk1: faskes_tk1 == freezed
          ? _value.faskes_tk1
          : faskes_tk1 // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_rujukan: faskes_rujukan == freezed
          ? _value.faskes_rujukan
          : faskes_rujukan // ignore: cast_nullable_to_non_nullable
              as String,
      gol_darah: gol_darah == freezed
          ? _value.gol_darah
          : gol_darah // ignore: cast_nullable_to_non_nullable
              as String,
      tempat_lahir: tempat_lahir == freezed
          ? _value.tempat_lahir
          : tempat_lahir // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal_lahir: tanggal_lahir == freezed
          ? _value.tanggal_lahir
          : tanggal_lahir // ignore: cast_nullable_to_non_nullable
              as String,
      pendidikan: pendidikan == freezed
          ? _value.pendidikan
          : pendidikan // ignore: cast_nullable_to_non_nullable
              as String,
      pekerjaan: pekerjaan == freezed
          ? _value.pekerjaan
          : pekerjaan // ignore: cast_nullable_to_non_nullable
              as String,
      alamat_rumah: alamat_rumah == freezed
          ? _value.alamat_rumah
          : alamat_rumah // ignore: cast_nullable_to_non_nullable
              as String,
      telp: telp == freezed
          ? _value.telp
          : telp // ignore: cast_nullable_to_non_nullable
              as String,
      puskesmas_domisili: puskesmas_domisili == freezed
          ? _value.puskesmas_domisili
          : puskesmas_domisili // ignore: cast_nullable_to_non_nullable
              as String,
      nomor_register_kohort_ibu: nomor_register_kohort_ibu == freezed
          ? _value.nomor_register_kohort_ibu
          : nomor_register_kohort_ibu // ignore: cast_nullable_to_non_nullable
              as String,
      kia_ayah: kia_ayah == freezed
          ? _value.kia_ayah
          : kia_ayah // ignore: cast_nullable_to_non_nullable
              as BioFatherResponse,
      kia_anak: kia_anak == freezed
          ? _value.kia_anak
          : kia_anak // ignore: cast_nullable_to_non_nullable
              as List<BioChildResponse>,
    ));
  }

  @override
  $BioFatherResponseCopyWith<$Res> get kia_ayah {
    return $BioFatherResponseCopyWith<$Res>(_value.kia_ayah, (value) {
      return _then(_value.copyWith(kia_ayah: value));
    });
  }
}

/// @nodoc
abstract class _$BioMotherResponseCopyWith<$Res>
    implements $BioMotherResponseCopyWith<$Res> {
  factory _$BioMotherResponseCopyWith(
          _BioMotherResponse value, $Res Function(_BioMotherResponse) then) =
      __$BioMotherResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int user_id,
      String nama,
      String nik,
      String pembiayaan,
      String no_jkn,
      String faskes_tk1,
      String faskes_rujukan,
      String gol_darah,
      int tempat_lahir,
      String tanggal_lahir,
      String pendidikan,
      String pekerjaan,
      String alamat_rumah,
      String telp,
      String puskesmas_domisili,
      String nomor_register_kohort_ibu,
      BioFatherResponse kia_ayah,
      List<BioChildResponse> kia_anak});

  @override
  $BioFatherResponseCopyWith<$Res> get kia_ayah;
}

/// @nodoc
class __$BioMotherResponseCopyWithImpl<$Res>
    extends _$BioMotherResponseCopyWithImpl<$Res>
    implements _$BioMotherResponseCopyWith<$Res> {
  __$BioMotherResponseCopyWithImpl(
      _BioMotherResponse _value, $Res Function(_BioMotherResponse) _then)
      : super(_value, (v) => _then(v as _BioMotherResponse));

  @override
  _BioMotherResponse get _value => super._value as _BioMotherResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? nama = freezed,
    Object? nik = freezed,
    Object? pembiayaan = freezed,
    Object? no_jkn = freezed,
    Object? faskes_tk1 = freezed,
    Object? faskes_rujukan = freezed,
    Object? gol_darah = freezed,
    Object? tempat_lahir = freezed,
    Object? tanggal_lahir = freezed,
    Object? pendidikan = freezed,
    Object? pekerjaan = freezed,
    Object? alamat_rumah = freezed,
    Object? telp = freezed,
    Object? puskesmas_domisili = freezed,
    Object? nomor_register_kohort_ibu = freezed,
    Object? kia_ayah = freezed,
    Object? kia_anak = freezed,
  }) {
    return _then(_BioMotherResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
      pembiayaan: pembiayaan == freezed
          ? _value.pembiayaan
          : pembiayaan // ignore: cast_nullable_to_non_nullable
              as String,
      no_jkn: no_jkn == freezed
          ? _value.no_jkn
          : no_jkn // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_tk1: faskes_tk1 == freezed
          ? _value.faskes_tk1
          : faskes_tk1 // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_rujukan: faskes_rujukan == freezed
          ? _value.faskes_rujukan
          : faskes_rujukan // ignore: cast_nullable_to_non_nullable
              as String,
      gol_darah: gol_darah == freezed
          ? _value.gol_darah
          : gol_darah // ignore: cast_nullable_to_non_nullable
              as String,
      tempat_lahir: tempat_lahir == freezed
          ? _value.tempat_lahir
          : tempat_lahir // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal_lahir: tanggal_lahir == freezed
          ? _value.tanggal_lahir
          : tanggal_lahir // ignore: cast_nullable_to_non_nullable
              as String,
      pendidikan: pendidikan == freezed
          ? _value.pendidikan
          : pendidikan // ignore: cast_nullable_to_non_nullable
              as String,
      pekerjaan: pekerjaan == freezed
          ? _value.pekerjaan
          : pekerjaan // ignore: cast_nullable_to_non_nullable
              as String,
      alamat_rumah: alamat_rumah == freezed
          ? _value.alamat_rumah
          : alamat_rumah // ignore: cast_nullable_to_non_nullable
              as String,
      telp: telp == freezed
          ? _value.telp
          : telp // ignore: cast_nullable_to_non_nullable
              as String,
      puskesmas_domisili: puskesmas_domisili == freezed
          ? _value.puskesmas_domisili
          : puskesmas_domisili // ignore: cast_nullable_to_non_nullable
              as String,
      nomor_register_kohort_ibu: nomor_register_kohort_ibu == freezed
          ? _value.nomor_register_kohort_ibu
          : nomor_register_kohort_ibu // ignore: cast_nullable_to_non_nullable
              as String,
      kia_ayah: kia_ayah == freezed
          ? _value.kia_ayah
          : kia_ayah // ignore: cast_nullable_to_non_nullable
              as BioFatherResponse,
      kia_anak: kia_anak == freezed
          ? _value.kia_anak
          : kia_anak // ignore: cast_nullable_to_non_nullable
              as List<BioChildResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BioMotherResponse implements _BioMotherResponse {
  const _$_BioMotherResponse(
      {required this.id,
      required this.user_id,
      required this.nama,
      required this.nik,
      required this.pembiayaan,
      required this.no_jkn,
      required this.faskes_tk1,
      required this.faskes_rujukan,
      required this.gol_darah,
      required this.tempat_lahir,
      required this.tanggal_lahir,
      required this.pendidikan,
      required this.pekerjaan,
      required this.alamat_rumah,
      required this.telp,
      required this.puskesmas_domisili,
      required this.nomor_register_kohort_ibu,
      required this.kia_ayah,
      required this.kia_anak});

  factory _$_BioMotherResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BioMotherResponseFromJson(json);

  @override
  final int id;
  @override
  final int user_id;
  @override
  final String nama;
  @override
  final String nik;
  @override
  final String pembiayaan;
  @override
  final String no_jkn;
  @override
  final String faskes_tk1;
  @override
  final String faskes_rujukan;
  @override
  final String gol_darah;
  @override
  final int tempat_lahir;
  @override
  final String tanggal_lahir;
  @override
  final String pendidikan;
  @override
  final String pekerjaan;
  @override
  final String alamat_rumah;
  @override
  final String telp;
  @override
  final String puskesmas_domisili;
  @override
  final String nomor_register_kohort_ibu;
  @override
  final BioFatherResponse kia_ayah;
  @override
  final List<BioChildResponse> kia_anak;

  @override
  String toString() {
    return 'BioMotherResponse(id: $id, user_id: $user_id, nama: $nama, nik: $nik, pembiayaan: $pembiayaan, no_jkn: $no_jkn, faskes_tk1: $faskes_tk1, faskes_rujukan: $faskes_rujukan, gol_darah: $gol_darah, tempat_lahir: $tempat_lahir, tanggal_lahir: $tanggal_lahir, pendidikan: $pendidikan, pekerjaan: $pekerjaan, alamat_rumah: $alamat_rumah, telp: $telp, puskesmas_domisili: $puskesmas_domisili, nomor_register_kohort_ibu: $nomor_register_kohort_ibu, kia_ayah: $kia_ayah, kia_anak: $kia_anak)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BioMotherResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user_id, user_id) ||
                const DeepCollectionEquality()
                    .equals(other.user_id, user_id)) &&
            (identical(other.nama, nama) ||
                const DeepCollectionEquality().equals(other.nama, nama)) &&
            (identical(other.nik, nik) ||
                const DeepCollectionEquality().equals(other.nik, nik)) &&
            (identical(other.pembiayaan, pembiayaan) ||
                const DeepCollectionEquality()
                    .equals(other.pembiayaan, pembiayaan)) &&
            (identical(other.no_jkn, no_jkn) ||
                const DeepCollectionEquality().equals(other.no_jkn, no_jkn)) &&
            (identical(other.faskes_tk1, faskes_tk1) ||
                const DeepCollectionEquality()
                    .equals(other.faskes_tk1, faskes_tk1)) &&
            (identical(other.faskes_rujukan, faskes_rujukan) ||
                const DeepCollectionEquality()
                    .equals(other.faskes_rujukan, faskes_rujukan)) &&
            (identical(other.gol_darah, gol_darah) ||
                const DeepCollectionEquality()
                    .equals(other.gol_darah, gol_darah)) &&
            (identical(other.tempat_lahir, tempat_lahir) ||
                const DeepCollectionEquality()
                    .equals(other.tempat_lahir, tempat_lahir)) &&
            (identical(other.tanggal_lahir, tanggal_lahir) ||
                const DeepCollectionEquality()
                    .equals(other.tanggal_lahir, tanggal_lahir)) &&
            (identical(other.pendidikan, pendidikan) ||
                const DeepCollectionEquality()
                    .equals(other.pendidikan, pendidikan)) &&
            (identical(other.pekerjaan, pekerjaan) ||
                const DeepCollectionEquality()
                    .equals(other.pekerjaan, pekerjaan)) &&
            (identical(other.alamat_rumah, alamat_rumah) ||
                const DeepCollectionEquality()
                    .equals(other.alamat_rumah, alamat_rumah)) &&
            (identical(other.telp, telp) ||
                const DeepCollectionEquality().equals(other.telp, telp)) &&
            (identical(other.puskesmas_domisili, puskesmas_domisili) ||
                const DeepCollectionEquality()
                    .equals(other.puskesmas_domisili, puskesmas_domisili)) &&
            (identical(other.nomor_register_kohort_ibu,
                    nomor_register_kohort_ibu) ||
                const DeepCollectionEquality().equals(
                    other.nomor_register_kohort_ibu,
                    nomor_register_kohort_ibu)) &&
            (identical(other.kia_ayah, kia_ayah) ||
                const DeepCollectionEquality()
                    .equals(other.kia_ayah, kia_ayah)) &&
            (identical(other.kia_anak, kia_anak) ||
                const DeepCollectionEquality()
                    .equals(other.kia_anak, kia_anak)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user_id) ^
      const DeepCollectionEquality().hash(nama) ^
      const DeepCollectionEquality().hash(nik) ^
      const DeepCollectionEquality().hash(pembiayaan) ^
      const DeepCollectionEquality().hash(no_jkn) ^
      const DeepCollectionEquality().hash(faskes_tk1) ^
      const DeepCollectionEquality().hash(faskes_rujukan) ^
      const DeepCollectionEquality().hash(gol_darah) ^
      const DeepCollectionEquality().hash(tempat_lahir) ^
      const DeepCollectionEquality().hash(tanggal_lahir) ^
      const DeepCollectionEquality().hash(pendidikan) ^
      const DeepCollectionEquality().hash(pekerjaan) ^
      const DeepCollectionEquality().hash(alamat_rumah) ^
      const DeepCollectionEquality().hash(telp) ^
      const DeepCollectionEquality().hash(puskesmas_domisili) ^
      const DeepCollectionEquality().hash(nomor_register_kohort_ibu) ^
      const DeepCollectionEquality().hash(kia_ayah) ^
      const DeepCollectionEquality().hash(kia_anak);

  @JsonKey(ignore: true)
  @override
  _$BioMotherResponseCopyWith<_BioMotherResponse> get copyWith =>
      __$BioMotherResponseCopyWithImpl<_BioMotherResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BioMotherResponseToJson(this);
  }
}

abstract class _BioMotherResponse implements BioMotherResponse {
  const factory _BioMotherResponse(
      {required int id,
      required int user_id,
      required String nama,
      required String nik,
      required String pembiayaan,
      required String no_jkn,
      required String faskes_tk1,
      required String faskes_rujukan,
      required String gol_darah,
      required int tempat_lahir,
      required String tanggal_lahir,
      required String pendidikan,
      required String pekerjaan,
      required String alamat_rumah,
      required String telp,
      required String puskesmas_domisili,
      required String nomor_register_kohort_ibu,
      required BioFatherResponse kia_ayah,
      required List<BioChildResponse> kia_anak}) = _$_BioMotherResponse;

  factory _BioMotherResponse.fromJson(Map<String, dynamic> json) =
      _$_BioMotherResponse.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get user_id => throw _privateConstructorUsedError;
  @override
  String get nama => throw _privateConstructorUsedError;
  @override
  String get nik => throw _privateConstructorUsedError;
  @override
  String get pembiayaan => throw _privateConstructorUsedError;
  @override
  String get no_jkn => throw _privateConstructorUsedError;
  @override
  String get faskes_tk1 => throw _privateConstructorUsedError;
  @override
  String get faskes_rujukan => throw _privateConstructorUsedError;
  @override
  String get gol_darah => throw _privateConstructorUsedError;
  @override
  int get tempat_lahir => throw _privateConstructorUsedError;
  @override
  String get tanggal_lahir => throw _privateConstructorUsedError;
  @override
  String get pendidikan => throw _privateConstructorUsedError;
  @override
  String get pekerjaan => throw _privateConstructorUsedError;
  @override
  String get alamat_rumah => throw _privateConstructorUsedError;
  @override
  String get telp => throw _privateConstructorUsedError;
  @override
  String get puskesmas_domisili => throw _privateConstructorUsedError;
  @override
  String get nomor_register_kohort_ibu => throw _privateConstructorUsedError;
  @override
  BioFatherResponse get kia_ayah => throw _privateConstructorUsedError;
  @override
  List<BioChildResponse> get kia_anak => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BioMotherResponseCopyWith<_BioMotherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BioFatherResponse _$BioFatherResponseFromJson(Map<String, dynamic> json) {
  return _BioFatherResponse.fromJson(json);
}

/// @nodoc
class _$BioFatherResponseTearOff {
  const _$BioFatherResponseTearOff();

  _BioFatherResponse call(
      {required int id,
      required String nama,
      required String nik,
      required String pembiayaan,
      required String no_jkn,
      required String faskes_tk1,
      required String faskes_rujukan,
      required String gol_darah,
      required int tempat_lahir,
      required String tanggal_lahir,
      required String pendidikan,
      required String pekerjaan,
      required String alamat_rumah,
      required String telp}) {
    return _BioFatherResponse(
      id: id,
      nama: nama,
      nik: nik,
      pembiayaan: pembiayaan,
      no_jkn: no_jkn,
      faskes_tk1: faskes_tk1,
      faskes_rujukan: faskes_rujukan,
      gol_darah: gol_darah,
      tempat_lahir: tempat_lahir,
      tanggal_lahir: tanggal_lahir,
      pendidikan: pendidikan,
      pekerjaan: pekerjaan,
      alamat_rumah: alamat_rumah,
      telp: telp,
    );
  }

  BioFatherResponse fromJson(Map<String, Object> json) {
    return BioFatherResponse.fromJson(json);
  }
}

/// @nodoc
const $BioFatherResponse = _$BioFatherResponseTearOff();

/// @nodoc
mixin _$BioFatherResponse {
  int get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get nik => throw _privateConstructorUsedError;
  String get pembiayaan => throw _privateConstructorUsedError;
  String get no_jkn => throw _privateConstructorUsedError;
  String get faskes_tk1 => throw _privateConstructorUsedError;
  String get faskes_rujukan => throw _privateConstructorUsedError;
  String get gol_darah => throw _privateConstructorUsedError;
  int get tempat_lahir => throw _privateConstructorUsedError;
  String get tanggal_lahir => throw _privateConstructorUsedError;
  String get pendidikan => throw _privateConstructorUsedError;
  String get pekerjaan => throw _privateConstructorUsedError;
  String get alamat_rumah => throw _privateConstructorUsedError;
  String get telp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BioFatherResponseCopyWith<BioFatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BioFatherResponseCopyWith<$Res> {
  factory $BioFatherResponseCopyWith(
          BioFatherResponse value, $Res Function(BioFatherResponse) then) =
      _$BioFatherResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String nama,
      String nik,
      String pembiayaan,
      String no_jkn,
      String faskes_tk1,
      String faskes_rujukan,
      String gol_darah,
      int tempat_lahir,
      String tanggal_lahir,
      String pendidikan,
      String pekerjaan,
      String alamat_rumah,
      String telp});
}

/// @nodoc
class _$BioFatherResponseCopyWithImpl<$Res>
    implements $BioFatherResponseCopyWith<$Res> {
  _$BioFatherResponseCopyWithImpl(this._value, this._then);

  final BioFatherResponse _value;
  // ignore: unused_field
  final $Res Function(BioFatherResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? nik = freezed,
    Object? pembiayaan = freezed,
    Object? no_jkn = freezed,
    Object? faskes_tk1 = freezed,
    Object? faskes_rujukan = freezed,
    Object? gol_darah = freezed,
    Object? tempat_lahir = freezed,
    Object? tanggal_lahir = freezed,
    Object? pendidikan = freezed,
    Object? pekerjaan = freezed,
    Object? alamat_rumah = freezed,
    Object? telp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
      pembiayaan: pembiayaan == freezed
          ? _value.pembiayaan
          : pembiayaan // ignore: cast_nullable_to_non_nullable
              as String,
      no_jkn: no_jkn == freezed
          ? _value.no_jkn
          : no_jkn // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_tk1: faskes_tk1 == freezed
          ? _value.faskes_tk1
          : faskes_tk1 // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_rujukan: faskes_rujukan == freezed
          ? _value.faskes_rujukan
          : faskes_rujukan // ignore: cast_nullable_to_non_nullable
              as String,
      gol_darah: gol_darah == freezed
          ? _value.gol_darah
          : gol_darah // ignore: cast_nullable_to_non_nullable
              as String,
      tempat_lahir: tempat_lahir == freezed
          ? _value.tempat_lahir
          : tempat_lahir // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal_lahir: tanggal_lahir == freezed
          ? _value.tanggal_lahir
          : tanggal_lahir // ignore: cast_nullable_to_non_nullable
              as String,
      pendidikan: pendidikan == freezed
          ? _value.pendidikan
          : pendidikan // ignore: cast_nullable_to_non_nullable
              as String,
      pekerjaan: pekerjaan == freezed
          ? _value.pekerjaan
          : pekerjaan // ignore: cast_nullable_to_non_nullable
              as String,
      alamat_rumah: alamat_rumah == freezed
          ? _value.alamat_rumah
          : alamat_rumah // ignore: cast_nullable_to_non_nullable
              as String,
      telp: telp == freezed
          ? _value.telp
          : telp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BioFatherResponseCopyWith<$Res>
    implements $BioFatherResponseCopyWith<$Res> {
  factory _$BioFatherResponseCopyWith(
          _BioFatherResponse value, $Res Function(_BioFatherResponse) then) =
      __$BioFatherResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String nama,
      String nik,
      String pembiayaan,
      String no_jkn,
      String faskes_tk1,
      String faskes_rujukan,
      String gol_darah,
      int tempat_lahir,
      String tanggal_lahir,
      String pendidikan,
      String pekerjaan,
      String alamat_rumah,
      String telp});
}

/// @nodoc
class __$BioFatherResponseCopyWithImpl<$Res>
    extends _$BioFatherResponseCopyWithImpl<$Res>
    implements _$BioFatherResponseCopyWith<$Res> {
  __$BioFatherResponseCopyWithImpl(
      _BioFatherResponse _value, $Res Function(_BioFatherResponse) _then)
      : super(_value, (v) => _then(v as _BioFatherResponse));

  @override
  _BioFatherResponse get _value => super._value as _BioFatherResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? nik = freezed,
    Object? pembiayaan = freezed,
    Object? no_jkn = freezed,
    Object? faskes_tk1 = freezed,
    Object? faskes_rujukan = freezed,
    Object? gol_darah = freezed,
    Object? tempat_lahir = freezed,
    Object? tanggal_lahir = freezed,
    Object? pendidikan = freezed,
    Object? pekerjaan = freezed,
    Object? alamat_rumah = freezed,
    Object? telp = freezed,
  }) {
    return _then(_BioFatherResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
      pembiayaan: pembiayaan == freezed
          ? _value.pembiayaan
          : pembiayaan // ignore: cast_nullable_to_non_nullable
              as String,
      no_jkn: no_jkn == freezed
          ? _value.no_jkn
          : no_jkn // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_tk1: faskes_tk1 == freezed
          ? _value.faskes_tk1
          : faskes_tk1 // ignore: cast_nullable_to_non_nullable
              as String,
      faskes_rujukan: faskes_rujukan == freezed
          ? _value.faskes_rujukan
          : faskes_rujukan // ignore: cast_nullable_to_non_nullable
              as String,
      gol_darah: gol_darah == freezed
          ? _value.gol_darah
          : gol_darah // ignore: cast_nullable_to_non_nullable
              as String,
      tempat_lahir: tempat_lahir == freezed
          ? _value.tempat_lahir
          : tempat_lahir // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal_lahir: tanggal_lahir == freezed
          ? _value.tanggal_lahir
          : tanggal_lahir // ignore: cast_nullable_to_non_nullable
              as String,
      pendidikan: pendidikan == freezed
          ? _value.pendidikan
          : pendidikan // ignore: cast_nullable_to_non_nullable
              as String,
      pekerjaan: pekerjaan == freezed
          ? _value.pekerjaan
          : pekerjaan // ignore: cast_nullable_to_non_nullable
              as String,
      alamat_rumah: alamat_rumah == freezed
          ? _value.alamat_rumah
          : alamat_rumah // ignore: cast_nullable_to_non_nullable
              as String,
      telp: telp == freezed
          ? _value.telp
          : telp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BioFatherResponse implements _BioFatherResponse {
  const _$_BioFatherResponse(
      {required this.id,
      required this.nama,
      required this.nik,
      required this.pembiayaan,
      required this.no_jkn,
      required this.faskes_tk1,
      required this.faskes_rujukan,
      required this.gol_darah,
      required this.tempat_lahir,
      required this.tanggal_lahir,
      required this.pendidikan,
      required this.pekerjaan,
      required this.alamat_rumah,
      required this.telp});

  factory _$_BioFatherResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BioFatherResponseFromJson(json);

  @override
  final int id;
  @override
  final String nama;
  @override
  final String nik;
  @override
  final String pembiayaan;
  @override
  final String no_jkn;
  @override
  final String faskes_tk1;
  @override
  final String faskes_rujukan;
  @override
  final String gol_darah;
  @override
  final int tempat_lahir;
  @override
  final String tanggal_lahir;
  @override
  final String pendidikan;
  @override
  final String pekerjaan;
  @override
  final String alamat_rumah;
  @override
  final String telp;

  @override
  String toString() {
    return 'BioFatherResponse(id: $id, nama: $nama, nik: $nik, pembiayaan: $pembiayaan, no_jkn: $no_jkn, faskes_tk1: $faskes_tk1, faskes_rujukan: $faskes_rujukan, gol_darah: $gol_darah, tempat_lahir: $tempat_lahir, tanggal_lahir: $tanggal_lahir, pendidikan: $pendidikan, pekerjaan: $pekerjaan, alamat_rumah: $alamat_rumah, telp: $telp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BioFatherResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nama, nama) ||
                const DeepCollectionEquality().equals(other.nama, nama)) &&
            (identical(other.nik, nik) ||
                const DeepCollectionEquality().equals(other.nik, nik)) &&
            (identical(other.pembiayaan, pembiayaan) ||
                const DeepCollectionEquality()
                    .equals(other.pembiayaan, pembiayaan)) &&
            (identical(other.no_jkn, no_jkn) ||
                const DeepCollectionEquality().equals(other.no_jkn, no_jkn)) &&
            (identical(other.faskes_tk1, faskes_tk1) ||
                const DeepCollectionEquality()
                    .equals(other.faskes_tk1, faskes_tk1)) &&
            (identical(other.faskes_rujukan, faskes_rujukan) ||
                const DeepCollectionEquality()
                    .equals(other.faskes_rujukan, faskes_rujukan)) &&
            (identical(other.gol_darah, gol_darah) ||
                const DeepCollectionEquality()
                    .equals(other.gol_darah, gol_darah)) &&
            (identical(other.tempat_lahir, tempat_lahir) ||
                const DeepCollectionEquality()
                    .equals(other.tempat_lahir, tempat_lahir)) &&
            (identical(other.tanggal_lahir, tanggal_lahir) ||
                const DeepCollectionEquality()
                    .equals(other.tanggal_lahir, tanggal_lahir)) &&
            (identical(other.pendidikan, pendidikan) ||
                const DeepCollectionEquality()
                    .equals(other.pendidikan, pendidikan)) &&
            (identical(other.pekerjaan, pekerjaan) ||
                const DeepCollectionEquality()
                    .equals(other.pekerjaan, pekerjaan)) &&
            (identical(other.alamat_rumah, alamat_rumah) ||
                const DeepCollectionEquality()
                    .equals(other.alamat_rumah, alamat_rumah)) &&
            (identical(other.telp, telp) ||
                const DeepCollectionEquality().equals(other.telp, telp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nama) ^
      const DeepCollectionEquality().hash(nik) ^
      const DeepCollectionEquality().hash(pembiayaan) ^
      const DeepCollectionEquality().hash(no_jkn) ^
      const DeepCollectionEquality().hash(faskes_tk1) ^
      const DeepCollectionEquality().hash(faskes_rujukan) ^
      const DeepCollectionEquality().hash(gol_darah) ^
      const DeepCollectionEquality().hash(tempat_lahir) ^
      const DeepCollectionEquality().hash(tanggal_lahir) ^
      const DeepCollectionEquality().hash(pendidikan) ^
      const DeepCollectionEquality().hash(pekerjaan) ^
      const DeepCollectionEquality().hash(alamat_rumah) ^
      const DeepCollectionEquality().hash(telp);

  @JsonKey(ignore: true)
  @override
  _$BioFatherResponseCopyWith<_BioFatherResponse> get copyWith =>
      __$BioFatherResponseCopyWithImpl<_BioFatherResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BioFatherResponseToJson(this);
  }
}

abstract class _BioFatherResponse implements BioFatherResponse {
  const factory _BioFatherResponse(
      {required int id,
      required String nama,
      required String nik,
      required String pembiayaan,
      required String no_jkn,
      required String faskes_tk1,
      required String faskes_rujukan,
      required String gol_darah,
      required int tempat_lahir,
      required String tanggal_lahir,
      required String pendidikan,
      required String pekerjaan,
      required String alamat_rumah,
      required String telp}) = _$_BioFatherResponse;

  factory _BioFatherResponse.fromJson(Map<String, dynamic> json) =
      _$_BioFatherResponse.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get nama => throw _privateConstructorUsedError;
  @override
  String get nik => throw _privateConstructorUsedError;
  @override
  String get pembiayaan => throw _privateConstructorUsedError;
  @override
  String get no_jkn => throw _privateConstructorUsedError;
  @override
  String get faskes_tk1 => throw _privateConstructorUsedError;
  @override
  String get faskes_rujukan => throw _privateConstructorUsedError;
  @override
  String get gol_darah => throw _privateConstructorUsedError;
  @override
  int get tempat_lahir => throw _privateConstructorUsedError;
  @override
  String get tanggal_lahir => throw _privateConstructorUsedError;
  @override
  String get pendidikan => throw _privateConstructorUsedError;
  @override
  String get pekerjaan => throw _privateConstructorUsedError;
  @override
  String get alamat_rumah => throw _privateConstructorUsedError;
  @override
  String get telp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BioFatherResponseCopyWith<_BioFatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BioChildResponse _$BioChildResponseFromJson(Map<String, dynamic> json) {
  return _BioChildResponse.fromJson(json);
}

/// @nodoc
class _$BioChildResponseTearOff {
  const _$BioChildResponseTearOff();

  _BioChildResponse call(
      {required int id,
      required String nama,
      required int? anak_ke,
      required String? no_akte_kelahiran,
      required String? nik,
      required String? jenis_kelamin,
      required String? gol_darah,
      required int? tempat_lahir,
      required String? tanggal_lahir,
      required String? no_jkn,
      required String? tanggal_berlaku_jkn,
      required String? no_kohort,
      required String? no_catatan_medik,
      required String? hpl,
      required String? hpht,
      required bool is_janin}) {
    return _BioChildResponse(
      id: id,
      nama: nama,
      anak_ke: anak_ke,
      no_akte_kelahiran: no_akte_kelahiran,
      nik: nik,
      jenis_kelamin: jenis_kelamin,
      gol_darah: gol_darah,
      tempat_lahir: tempat_lahir,
      tanggal_lahir: tanggal_lahir,
      no_jkn: no_jkn,
      tanggal_berlaku_jkn: tanggal_berlaku_jkn,
      no_kohort: no_kohort,
      no_catatan_medik: no_catatan_medik,
      hpl: hpl,
      hpht: hpht,
      is_janin: is_janin,
    );
  }

  BioChildResponse fromJson(Map<String, Object> json) {
    return BioChildResponse.fromJson(json);
  }
}

/// @nodoc
const $BioChildResponse = _$BioChildResponseTearOff();

/// @nodoc
mixin _$BioChildResponse {
  int get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  int? get anak_ke =>
      throw _privateConstructorUsedError; // null if this is unborn child (fetus).
  String? get no_akte_kelahiran => throw _privateConstructorUsedError;
  String? get nik => throw _privateConstructorUsedError;
  String? get jenis_kelamin => throw _privateConstructorUsedError;
  String? get gol_darah => throw _privateConstructorUsedError;
  int? get tempat_lahir => throw _privateConstructorUsedError;
  String? get tanggal_lahir => throw _privateConstructorUsedError;
  String? get no_jkn => throw _privateConstructorUsedError;
  String? get tanggal_berlaku_jkn => throw _privateConstructorUsedError;
  String? get no_kohort => throw _privateConstructorUsedError;
  String? get no_catatan_medik => throw _privateConstructorUsedError;
  String? get hpl => throw _privateConstructorUsedError;
  String? get hpht => throw _privateConstructorUsedError;
  bool get is_janin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BioChildResponseCopyWith<BioChildResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BioChildResponseCopyWith<$Res> {
  factory $BioChildResponseCopyWith(
          BioChildResponse value, $Res Function(BioChildResponse) then) =
      _$BioChildResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String nama,
      int? anak_ke,
      String? no_akte_kelahiran,
      String? nik,
      String? jenis_kelamin,
      String? gol_darah,
      int? tempat_lahir,
      String? tanggal_lahir,
      String? no_jkn,
      String? tanggal_berlaku_jkn,
      String? no_kohort,
      String? no_catatan_medik,
      String? hpl,
      String? hpht,
      bool is_janin});
}

/// @nodoc
class _$BioChildResponseCopyWithImpl<$Res>
    implements $BioChildResponseCopyWith<$Res> {
  _$BioChildResponseCopyWithImpl(this._value, this._then);

  final BioChildResponse _value;
  // ignore: unused_field
  final $Res Function(BioChildResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? anak_ke = freezed,
    Object? no_akte_kelahiran = freezed,
    Object? nik = freezed,
    Object? jenis_kelamin = freezed,
    Object? gol_darah = freezed,
    Object? tempat_lahir = freezed,
    Object? tanggal_lahir = freezed,
    Object? no_jkn = freezed,
    Object? tanggal_berlaku_jkn = freezed,
    Object? no_kohort = freezed,
    Object? no_catatan_medik = freezed,
    Object? hpl = freezed,
    Object? hpht = freezed,
    Object? is_janin = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      anak_ke: anak_ke == freezed
          ? _value.anak_ke
          : anak_ke // ignore: cast_nullable_to_non_nullable
              as int?,
      no_akte_kelahiran: no_akte_kelahiran == freezed
          ? _value.no_akte_kelahiran
          : no_akte_kelahiran // ignore: cast_nullable_to_non_nullable
              as String?,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      jenis_kelamin: jenis_kelamin == freezed
          ? _value.jenis_kelamin
          : jenis_kelamin // ignore: cast_nullable_to_non_nullable
              as String?,
      gol_darah: gol_darah == freezed
          ? _value.gol_darah
          : gol_darah // ignore: cast_nullable_to_non_nullable
              as String?,
      tempat_lahir: tempat_lahir == freezed
          ? _value.tempat_lahir
          : tempat_lahir // ignore: cast_nullable_to_non_nullable
              as int?,
      tanggal_lahir: tanggal_lahir == freezed
          ? _value.tanggal_lahir
          : tanggal_lahir // ignore: cast_nullable_to_non_nullable
              as String?,
      no_jkn: no_jkn == freezed
          ? _value.no_jkn
          : no_jkn // ignore: cast_nullable_to_non_nullable
              as String?,
      tanggal_berlaku_jkn: tanggal_berlaku_jkn == freezed
          ? _value.tanggal_berlaku_jkn
          : tanggal_berlaku_jkn // ignore: cast_nullable_to_non_nullable
              as String?,
      no_kohort: no_kohort == freezed
          ? _value.no_kohort
          : no_kohort // ignore: cast_nullable_to_non_nullable
              as String?,
      no_catatan_medik: no_catatan_medik == freezed
          ? _value.no_catatan_medik
          : no_catatan_medik // ignore: cast_nullable_to_non_nullable
              as String?,
      hpl: hpl == freezed
          ? _value.hpl
          : hpl // ignore: cast_nullable_to_non_nullable
              as String?,
      hpht: hpht == freezed
          ? _value.hpht
          : hpht // ignore: cast_nullable_to_non_nullable
              as String?,
      is_janin: is_janin == freezed
          ? _value.is_janin
          : is_janin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BioChildResponseCopyWith<$Res>
    implements $BioChildResponseCopyWith<$Res> {
  factory _$BioChildResponseCopyWith(
          _BioChildResponse value, $Res Function(_BioChildResponse) then) =
      __$BioChildResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String nama,
      int? anak_ke,
      String? no_akte_kelahiran,
      String? nik,
      String? jenis_kelamin,
      String? gol_darah,
      int? tempat_lahir,
      String? tanggal_lahir,
      String? no_jkn,
      String? tanggal_berlaku_jkn,
      String? no_kohort,
      String? no_catatan_medik,
      String? hpl,
      String? hpht,
      bool is_janin});
}

/// @nodoc
class __$BioChildResponseCopyWithImpl<$Res>
    extends _$BioChildResponseCopyWithImpl<$Res>
    implements _$BioChildResponseCopyWith<$Res> {
  __$BioChildResponseCopyWithImpl(
      _BioChildResponse _value, $Res Function(_BioChildResponse) _then)
      : super(_value, (v) => _then(v as _BioChildResponse));

  @override
  _BioChildResponse get _value => super._value as _BioChildResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? anak_ke = freezed,
    Object? no_akte_kelahiran = freezed,
    Object? nik = freezed,
    Object? jenis_kelamin = freezed,
    Object? gol_darah = freezed,
    Object? tempat_lahir = freezed,
    Object? tanggal_lahir = freezed,
    Object? no_jkn = freezed,
    Object? tanggal_berlaku_jkn = freezed,
    Object? no_kohort = freezed,
    Object? no_catatan_medik = freezed,
    Object? hpl = freezed,
    Object? hpht = freezed,
    Object? is_janin = freezed,
  }) {
    return _then(_BioChildResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      anak_ke: anak_ke == freezed
          ? _value.anak_ke
          : anak_ke // ignore: cast_nullable_to_non_nullable
              as int?,
      no_akte_kelahiran: no_akte_kelahiran == freezed
          ? _value.no_akte_kelahiran
          : no_akte_kelahiran // ignore: cast_nullable_to_non_nullable
              as String?,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      jenis_kelamin: jenis_kelamin == freezed
          ? _value.jenis_kelamin
          : jenis_kelamin // ignore: cast_nullable_to_non_nullable
              as String?,
      gol_darah: gol_darah == freezed
          ? _value.gol_darah
          : gol_darah // ignore: cast_nullable_to_non_nullable
              as String?,
      tempat_lahir: tempat_lahir == freezed
          ? _value.tempat_lahir
          : tempat_lahir // ignore: cast_nullable_to_non_nullable
              as int?,
      tanggal_lahir: tanggal_lahir == freezed
          ? _value.tanggal_lahir
          : tanggal_lahir // ignore: cast_nullable_to_non_nullable
              as String?,
      no_jkn: no_jkn == freezed
          ? _value.no_jkn
          : no_jkn // ignore: cast_nullable_to_non_nullable
              as String?,
      tanggal_berlaku_jkn: tanggal_berlaku_jkn == freezed
          ? _value.tanggal_berlaku_jkn
          : tanggal_berlaku_jkn // ignore: cast_nullable_to_non_nullable
              as String?,
      no_kohort: no_kohort == freezed
          ? _value.no_kohort
          : no_kohort // ignore: cast_nullable_to_non_nullable
              as String?,
      no_catatan_medik: no_catatan_medik == freezed
          ? _value.no_catatan_medik
          : no_catatan_medik // ignore: cast_nullable_to_non_nullable
              as String?,
      hpl: hpl == freezed
          ? _value.hpl
          : hpl // ignore: cast_nullable_to_non_nullable
              as String?,
      hpht: hpht == freezed
          ? _value.hpht
          : hpht // ignore: cast_nullable_to_non_nullable
              as String?,
      is_janin: is_janin == freezed
          ? _value.is_janin
          : is_janin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BioChildResponse implements _BioChildResponse {
  const _$_BioChildResponse(
      {required this.id,
      required this.nama,
      required this.anak_ke,
      required this.no_akte_kelahiran,
      required this.nik,
      required this.jenis_kelamin,
      required this.gol_darah,
      required this.tempat_lahir,
      required this.tanggal_lahir,
      required this.no_jkn,
      required this.tanggal_berlaku_jkn,
      required this.no_kohort,
      required this.no_catatan_medik,
      required this.hpl,
      required this.hpht,
      required this.is_janin});

  factory _$_BioChildResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BioChildResponseFromJson(json);

  @override
  final int id;
  @override
  final String nama;
  @override
  final int? anak_ke;
  @override // null if this is unborn child (fetus).
  final String? no_akte_kelahiran;
  @override
  final String? nik;
  @override
  final String? jenis_kelamin;
  @override
  final String? gol_darah;
  @override
  final int? tempat_lahir;
  @override
  final String? tanggal_lahir;
  @override
  final String? no_jkn;
  @override
  final String? tanggal_berlaku_jkn;
  @override
  final String? no_kohort;
  @override
  final String? no_catatan_medik;
  @override
  final String? hpl;
  @override
  final String? hpht;
  @override
  final bool is_janin;

  @override
  String toString() {
    return 'BioChildResponse(id: $id, nama: $nama, anak_ke: $anak_ke, no_akte_kelahiran: $no_akte_kelahiran, nik: $nik, jenis_kelamin: $jenis_kelamin, gol_darah: $gol_darah, tempat_lahir: $tempat_lahir, tanggal_lahir: $tanggal_lahir, no_jkn: $no_jkn, tanggal_berlaku_jkn: $tanggal_berlaku_jkn, no_kohort: $no_kohort, no_catatan_medik: $no_catatan_medik, hpl: $hpl, hpht: $hpht, is_janin: $is_janin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BioChildResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nama, nama) ||
                const DeepCollectionEquality().equals(other.nama, nama)) &&
            (identical(other.anak_ke, anak_ke) ||
                const DeepCollectionEquality()
                    .equals(other.anak_ke, anak_ke)) &&
            (identical(other.no_akte_kelahiran, no_akte_kelahiran) ||
                const DeepCollectionEquality()
                    .equals(other.no_akte_kelahiran, no_akte_kelahiran)) &&
            (identical(other.nik, nik) ||
                const DeepCollectionEquality().equals(other.nik, nik)) &&
            (identical(other.jenis_kelamin, jenis_kelamin) ||
                const DeepCollectionEquality()
                    .equals(other.jenis_kelamin, jenis_kelamin)) &&
            (identical(other.gol_darah, gol_darah) ||
                const DeepCollectionEquality()
                    .equals(other.gol_darah, gol_darah)) &&
            (identical(other.tempat_lahir, tempat_lahir) ||
                const DeepCollectionEquality()
                    .equals(other.tempat_lahir, tempat_lahir)) &&
            (identical(other.tanggal_lahir, tanggal_lahir) ||
                const DeepCollectionEquality()
                    .equals(other.tanggal_lahir, tanggal_lahir)) &&
            (identical(other.no_jkn, no_jkn) ||
                const DeepCollectionEquality().equals(other.no_jkn, no_jkn)) &&
            (identical(other.tanggal_berlaku_jkn, tanggal_berlaku_jkn) ||
                const DeepCollectionEquality()
                    .equals(other.tanggal_berlaku_jkn, tanggal_berlaku_jkn)) &&
            (identical(other.no_kohort, no_kohort) ||
                const DeepCollectionEquality()
                    .equals(other.no_kohort, no_kohort)) &&
            (identical(other.no_catatan_medik, no_catatan_medik) ||
                const DeepCollectionEquality()
                    .equals(other.no_catatan_medik, no_catatan_medik)) &&
            (identical(other.hpl, hpl) ||
                const DeepCollectionEquality().equals(other.hpl, hpl)) &&
            (identical(other.hpht, hpht) ||
                const DeepCollectionEquality().equals(other.hpht, hpht)) &&
            (identical(other.is_janin, is_janin) ||
                const DeepCollectionEquality()
                    .equals(other.is_janin, is_janin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nama) ^
      const DeepCollectionEquality().hash(anak_ke) ^
      const DeepCollectionEquality().hash(no_akte_kelahiran) ^
      const DeepCollectionEquality().hash(nik) ^
      const DeepCollectionEquality().hash(jenis_kelamin) ^
      const DeepCollectionEquality().hash(gol_darah) ^
      const DeepCollectionEquality().hash(tempat_lahir) ^
      const DeepCollectionEquality().hash(tanggal_lahir) ^
      const DeepCollectionEquality().hash(no_jkn) ^
      const DeepCollectionEquality().hash(tanggal_berlaku_jkn) ^
      const DeepCollectionEquality().hash(no_kohort) ^
      const DeepCollectionEquality().hash(no_catatan_medik) ^
      const DeepCollectionEquality().hash(hpl) ^
      const DeepCollectionEquality().hash(hpht) ^
      const DeepCollectionEquality().hash(is_janin);

  @JsonKey(ignore: true)
  @override
  _$BioChildResponseCopyWith<_BioChildResponse> get copyWith =>
      __$BioChildResponseCopyWithImpl<_BioChildResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BioChildResponseToJson(this);
  }
}

abstract class _BioChildResponse implements BioChildResponse {
  const factory _BioChildResponse(
      {required int id,
      required String nama,
      required int? anak_ke,
      required String? no_akte_kelahiran,
      required String? nik,
      required String? jenis_kelamin,
      required String? gol_darah,
      required int? tempat_lahir,
      required String? tanggal_lahir,
      required String? no_jkn,
      required String? tanggal_berlaku_jkn,
      required String? no_kohort,
      required String? no_catatan_medik,
      required String? hpl,
      required String? hpht,
      required bool is_janin}) = _$_BioChildResponse;

  factory _BioChildResponse.fromJson(Map<String, dynamic> json) =
      _$_BioChildResponse.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get nama => throw _privateConstructorUsedError;
  @override
  int? get anak_ke => throw _privateConstructorUsedError;
  @override // null if this is unborn child (fetus).
  String? get no_akte_kelahiran => throw _privateConstructorUsedError;
  @override
  String? get nik => throw _privateConstructorUsedError;
  @override
  String? get jenis_kelamin => throw _privateConstructorUsedError;
  @override
  String? get gol_darah => throw _privateConstructorUsedError;
  @override
  int? get tempat_lahir => throw _privateConstructorUsedError;
  @override
  String? get tanggal_lahir => throw _privateConstructorUsedError;
  @override
  String? get no_jkn => throw _privateConstructorUsedError;
  @override
  String? get tanggal_berlaku_jkn => throw _privateConstructorUsedError;
  @override
  String? get no_kohort => throw _privateConstructorUsedError;
  @override
  String? get no_catatan_medik => throw _privateConstructorUsedError;
  @override
  String? get hpl => throw _privateConstructorUsedError;
  @override
  String? get hpht => throw _privateConstructorUsedError;
  @override
  bool get is_janin => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BioChildResponseCopyWith<_BioChildResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
