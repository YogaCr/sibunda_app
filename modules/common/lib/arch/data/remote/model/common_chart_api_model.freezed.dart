// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'common_chart_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChartWarningResponse _$ChartWarningResponseFromJson(Map<String, dynamic> json) {
  return _ChartWarningResponse.fromJson(json);
}

/// @nodoc
class _$ChartWarningResponseTearOff {
  const _$ChartWarningResponseTearOff();

  _ChartWarningResponse call({required String? desc, required bool is_normal}) {
    return _ChartWarningResponse(
      desc: desc,
      is_normal: is_normal,
    );
  }

  ChartWarningResponse fromJson(Map<String, Object> json) {
    return ChartWarningResponse.fromJson(json);
  }
}

/// @nodoc
const $ChartWarningResponse = _$ChartWarningResponseTearOff();

/// @nodoc
mixin _$ChartWarningResponse {
  String? get desc => throw _privateConstructorUsedError;
  bool get is_normal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartWarningResponseCopyWith<ChartWarningResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartWarningResponseCopyWith<$Res> {
  factory $ChartWarningResponseCopyWith(ChartWarningResponse value,
          $Res Function(ChartWarningResponse) then) =
      _$ChartWarningResponseCopyWithImpl<$Res>;
  $Res call({String? desc, bool is_normal});
}

/// @nodoc
class _$ChartWarningResponseCopyWithImpl<$Res>
    implements $ChartWarningResponseCopyWith<$Res> {
  _$ChartWarningResponseCopyWithImpl(this._value, this._then);

  final ChartWarningResponse _value;
  // ignore: unused_field
  final $Res Function(ChartWarningResponse) _then;

  @override
  $Res call({
    Object? desc = freezed,
    Object? is_normal = freezed,
  }) {
    return _then(_value.copyWith(
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      is_normal: is_normal == freezed
          ? _value.is_normal
          : is_normal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChartWarningResponseCopyWith<$Res>
    implements $ChartWarningResponseCopyWith<$Res> {
  factory _$ChartWarningResponseCopyWith(_ChartWarningResponse value,
          $Res Function(_ChartWarningResponse) then) =
      __$ChartWarningResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? desc, bool is_normal});
}

/// @nodoc
class __$ChartWarningResponseCopyWithImpl<$Res>
    extends _$ChartWarningResponseCopyWithImpl<$Res>
    implements _$ChartWarningResponseCopyWith<$Res> {
  __$ChartWarningResponseCopyWithImpl(
      _ChartWarningResponse _value, $Res Function(_ChartWarningResponse) _then)
      : super(_value, (v) => _then(v as _ChartWarningResponse));

  @override
  _ChartWarningResponse get _value => super._value as _ChartWarningResponse;

  @override
  $Res call({
    Object? desc = freezed,
    Object? is_normal = freezed,
  }) {
    return _then(_ChartWarningResponse(
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      is_normal: is_normal == freezed
          ? _value.is_normal
          : is_normal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChartWarningResponse implements _ChartWarningResponse {
  const _$_ChartWarningResponse({required this.desc, required this.is_normal});

  factory _$_ChartWarningResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ChartWarningResponseFromJson(json);

  @override
  final String? desc;
  @override
  final bool is_normal;

  @override
  String toString() {
    return 'ChartWarningResponse(desc: $desc, is_normal: $is_normal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChartWarningResponse &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(other.is_normal, is_normal) ||
                const DeepCollectionEquality()
                    .equals(other.is_normal, is_normal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(is_normal);

  @JsonKey(ignore: true)
  @override
  _$ChartWarningResponseCopyWith<_ChartWarningResponse> get copyWith =>
      __$ChartWarningResponseCopyWithImpl<_ChartWarningResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChartWarningResponseToJson(this);
  }
}

abstract class _ChartWarningResponse implements ChartWarningResponse {
  const factory _ChartWarningResponse(
      {required String? desc,
      required bool is_normal}) = _$_ChartWarningResponse;

  factory _ChartWarningResponse.fromJson(Map<String, dynamic> json) =
      _$_ChartWarningResponse.fromJson;

  @override
  String? get desc => throw _privateConstructorUsedError;
  @override
  bool get is_normal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChartWarningResponseCopyWith<_ChartWarningResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
