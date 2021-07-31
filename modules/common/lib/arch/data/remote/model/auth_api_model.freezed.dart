// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckEmailAvailabilityResponse _$CheckEmailAvailabilityResponseFromJson(
    Map<String, dynamic> json) {
  return _CheckEmailAvailabilityResponse.fromJson(json);
}

/// @nodoc
class _$CheckEmailAvailabilityResponseTearOff {
  const _$CheckEmailAvailabilityResponseTearOff();

  _CheckEmailAvailabilityResponse call(
      {required String message,
      required String status,
      required int code,
      required bool available}) {
    return _CheckEmailAvailabilityResponse(
      message: message,
      status: status,
      code: code,
      available: available,
    );
  }

  CheckEmailAvailabilityResponse fromJson(Map<String, Object> json) {
    return CheckEmailAvailabilityResponse.fromJson(json);
  }
}

/// @nodoc
const $CheckEmailAvailabilityResponse =
    _$CheckEmailAvailabilityResponseTearOff();

/// @nodoc
mixin _$CheckEmailAvailabilityResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckEmailAvailabilityResponseCopyWith<CheckEmailAvailabilityResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckEmailAvailabilityResponseCopyWith<$Res> {
  factory $CheckEmailAvailabilityResponseCopyWith(
          CheckEmailAvailabilityResponse value,
          $Res Function(CheckEmailAvailabilityResponse) then) =
      _$CheckEmailAvailabilityResponseCopyWithImpl<$Res>;
  $Res call({String message, String status, int code, bool available});
}

/// @nodoc
class _$CheckEmailAvailabilityResponseCopyWithImpl<$Res>
    implements $CheckEmailAvailabilityResponseCopyWith<$Res> {
  _$CheckEmailAvailabilityResponseCopyWithImpl(this._value, this._then);

  final CheckEmailAvailabilityResponse _value;
  // ignore: unused_field
  final $Res Function(CheckEmailAvailabilityResponse) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? available = freezed,
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
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CheckEmailAvailabilityResponseCopyWith<$Res>
    implements $CheckEmailAvailabilityResponseCopyWith<$Res> {
  factory _$CheckEmailAvailabilityResponseCopyWith(
          _CheckEmailAvailabilityResponse value,
          $Res Function(_CheckEmailAvailabilityResponse) then) =
      __$CheckEmailAvailabilityResponseCopyWithImpl<$Res>;
  @override
  $Res call({String message, String status, int code, bool available});
}

/// @nodoc
class __$CheckEmailAvailabilityResponseCopyWithImpl<$Res>
    extends _$CheckEmailAvailabilityResponseCopyWithImpl<$Res>
    implements _$CheckEmailAvailabilityResponseCopyWith<$Res> {
  __$CheckEmailAvailabilityResponseCopyWithImpl(
      _CheckEmailAvailabilityResponse _value,
      $Res Function(_CheckEmailAvailabilityResponse) _then)
      : super(_value, (v) => _then(v as _CheckEmailAvailabilityResponse));

  @override
  _CheckEmailAvailabilityResponse get _value =>
      super._value as _CheckEmailAvailabilityResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? available = freezed,
  }) {
    return _then(_CheckEmailAvailabilityResponse(
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
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckEmailAvailabilityResponse
    implements _CheckEmailAvailabilityResponse {
  const _$_CheckEmailAvailabilityResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.available});

  factory _$_CheckEmailAvailabilityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$_$_CheckEmailAvailabilityResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final bool available;

  @override
  String toString() {
    return 'CheckEmailAvailabilityResponse(message: $message, status: $status, code: $code, available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CheckEmailAvailabilityResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.available, available) ||
                const DeepCollectionEquality()
                    .equals(other.available, available)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(available);

  @JsonKey(ignore: true)
  @override
  _$CheckEmailAvailabilityResponseCopyWith<_CheckEmailAvailabilityResponse>
      get copyWith => __$CheckEmailAvailabilityResponseCopyWithImpl<
          _CheckEmailAvailabilityResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CheckEmailAvailabilityResponseToJson(this);
  }
}

abstract class _CheckEmailAvailabilityResponse
    implements CheckEmailAvailabilityResponse {
  const factory _CheckEmailAvailabilityResponse(
      {required String message,
      required String status,
      required int code,
      required bool available}) = _$_CheckEmailAvailabilityResponse;

  factory _CheckEmailAvailabilityResponse.fromJson(Map<String, dynamic> json) =
      _$_CheckEmailAvailabilityResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  bool get available => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CheckEmailAvailabilityResponseCopyWith<_CheckEmailAvailabilityResponse>
      get copyWith => throw _privateConstructorUsedError;
}
