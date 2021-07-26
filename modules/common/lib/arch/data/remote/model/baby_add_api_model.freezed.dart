// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'baby_add_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BabyAddResponse _$BabyAddResponseFromJson(Map<String, dynamic> json) {
  return _BabyAddResponse.fromJson(json);
}

/// @nodoc
class _$BabyAddResponseTearOff {
  const _$BabyAddResponseTearOff();

  _BabyAddResponse call(
      {required int code,
      required String message,
      required String status,
      required int? anak_id}) {
    return _BabyAddResponse(
      code: code,
      message: message,
      status: status,
      anak_id: anak_id,
    );
  }

  BabyAddResponse fromJson(Map<String, Object> json) {
    return BabyAddResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyAddResponse = _$BabyAddResponseTearOff();

/// @nodoc
mixin _$BabyAddResponse {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int? get anak_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyAddResponseCopyWith<BabyAddResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyAddResponseCopyWith<$Res> {
  factory $BabyAddResponseCopyWith(
          BabyAddResponse value, $Res Function(BabyAddResponse) then) =
      _$BabyAddResponseCopyWithImpl<$Res>;
  $Res call({int code, String message, String status, int? anak_id});
}

/// @nodoc
class _$BabyAddResponseCopyWithImpl<$Res>
    implements $BabyAddResponseCopyWith<$Res> {
  _$BabyAddResponseCopyWithImpl(this._value, this._then);

  final BabyAddResponse _value;
  // ignore: unused_field
  final $Res Function(BabyAddResponse) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? anak_id = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      anak_id: anak_id == freezed
          ? _value.anak_id
          : anak_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$BabyAddResponseCopyWith<$Res>
    implements $BabyAddResponseCopyWith<$Res> {
  factory _$BabyAddResponseCopyWith(
          _BabyAddResponse value, $Res Function(_BabyAddResponse) then) =
      __$BabyAddResponseCopyWithImpl<$Res>;
  @override
  $Res call({int code, String message, String status, int? anak_id});
}

/// @nodoc
class __$BabyAddResponseCopyWithImpl<$Res>
    extends _$BabyAddResponseCopyWithImpl<$Res>
    implements _$BabyAddResponseCopyWith<$Res> {
  __$BabyAddResponseCopyWithImpl(
      _BabyAddResponse _value, $Res Function(_BabyAddResponse) _then)
      : super(_value, (v) => _then(v as _BabyAddResponse));

  @override
  _BabyAddResponse get _value => super._value as _BabyAddResponse;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? anak_id = freezed,
  }) {
    return _then(_BabyAddResponse(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      anak_id: anak_id == freezed
          ? _value.anak_id
          : anak_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyAddResponse implements _BabyAddResponse {
  const _$_BabyAddResponse(
      {required this.code,
      required this.message,
      required this.status,
      required this.anak_id});

  factory _$_BabyAddResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyAddResponseFromJson(json);

  @override
  final int code;
  @override
  final String message;
  @override
  final String status;
  @override
  final int? anak_id;

  @override
  String toString() {
    return 'BabyAddResponse(code: $code, message: $message, status: $status, anak_id: $anak_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyAddResponse &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.anak_id, anak_id) ||
                const DeepCollectionEquality().equals(other.anak_id, anak_id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(anak_id);

  @JsonKey(ignore: true)
  @override
  _$BabyAddResponseCopyWith<_BabyAddResponse> get copyWith =>
      __$BabyAddResponseCopyWithImpl<_BabyAddResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyAddResponseToJson(this);
  }
}

abstract class _BabyAddResponse implements BabyAddResponse {
  const factory _BabyAddResponse(
      {required int code,
      required String message,
      required String status,
      required int? anak_id}) = _$_BabyAddResponse;

  factory _BabyAddResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyAddResponse.fromJson;

  @override
  int get code => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int? get anak_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyAddResponseCopyWith<_BabyAddResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
