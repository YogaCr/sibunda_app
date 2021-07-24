// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'kehamilanku_chart_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MotherTfuChartResponse _$MotherTfuChartResponseFromJson(
    Map<String, dynamic> json) {
  return _MotherTfuChartResponse.fromJson(json);
}

/// @nodoc
class _$MotherTfuChartResponseTearOff {
  const _$MotherTfuChartResponseTearOff();

  _MotherTfuChartResponse call(
      {required String message,
      required String status,
      required int code,
      required MotherTfuChartResponseData data}) {
    return _MotherTfuChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  MotherTfuChartResponse fromJson(Map<String, Object> json) {
    return MotherTfuChartResponse.fromJson(json);
  }
}

/// @nodoc
const $MotherTfuChartResponse = _$MotherTfuChartResponseTearOff();

/// @nodoc
mixin _$MotherTfuChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  MotherTfuChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherTfuChartResponseCopyWith<MotherTfuChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherTfuChartResponseCopyWith<$Res> {
  factory $MotherTfuChartResponseCopyWith(MotherTfuChartResponse value,
          $Res Function(MotherTfuChartResponse) then) =
      _$MotherTfuChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String status,
      int code,
      MotherTfuChartResponseData data});

  $MotherTfuChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MotherTfuChartResponseCopyWithImpl<$Res>
    implements $MotherTfuChartResponseCopyWith<$Res> {
  _$MotherTfuChartResponseCopyWithImpl(this._value, this._then);

  final MotherTfuChartResponse _value;
  // ignore: unused_field
  final $Res Function(MotherTfuChartResponse) _then;

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
              as MotherTfuChartResponseData,
    ));
  }

  @override
  $MotherTfuChartResponseDataCopyWith<$Res> get data {
    return $MotherTfuChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$MotherTfuChartResponseCopyWith<$Res>
    implements $MotherTfuChartResponseCopyWith<$Res> {
  factory _$MotherTfuChartResponseCopyWith(_MotherTfuChartResponse value,
          $Res Function(_MotherTfuChartResponse) then) =
      __$MotherTfuChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String status,
      int code,
      MotherTfuChartResponseData data});

  @override
  $MotherTfuChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$MotherTfuChartResponseCopyWithImpl<$Res>
    extends _$MotherTfuChartResponseCopyWithImpl<$Res>
    implements _$MotherTfuChartResponseCopyWith<$Res> {
  __$MotherTfuChartResponseCopyWithImpl(_MotherTfuChartResponse _value,
      $Res Function(_MotherTfuChartResponse) _then)
      : super(_value, (v) => _then(v as _MotherTfuChartResponse));

  @override
  _MotherTfuChartResponse get _value => super._value as _MotherTfuChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_MotherTfuChartResponse(
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
              as MotherTfuChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherTfuChartResponse implements _MotherTfuChartResponse {
  const _$_MotherTfuChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_MotherTfuChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherTfuChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final MotherTfuChartResponseData data;

  @override
  String toString() {
    return 'MotherTfuChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherTfuChartResponse &&
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
  _$MotherTfuChartResponseCopyWith<_MotherTfuChartResponse> get copyWith =>
      __$MotherTfuChartResponseCopyWithImpl<_MotherTfuChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherTfuChartResponseToJson(this);
  }
}

abstract class _MotherTfuChartResponse implements MotherTfuChartResponse {
  const factory _MotherTfuChartResponse(
      {required String message,
      required String status,
      required int code,
      required MotherTfuChartResponseData data}) = _$_MotherTfuChartResponse;

  factory _MotherTfuChartResponse.fromJson(Map<String, dynamic> json) =
      _$_MotherTfuChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  MotherTfuChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherTfuChartResponseCopyWith<_MotherTfuChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MotherTfuChartResponseData _$MotherTfuChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _MotherTfuChartResponseData.fromJson(json);
}

/// @nodoc
class _$MotherTfuChartResponseDataTearOff {
  const _$MotherTfuChartResponseDataTearOff();

  _MotherTfuChartResponseData call(
      {required List<MotherTfuChartData> data,
      required ChartWarningResponse? desc}) {
    return _MotherTfuChartResponseData(
      data: data,
      desc: desc,
    );
  }

  MotherTfuChartResponseData fromJson(Map<String, Object> json) {
    return MotherTfuChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $MotherTfuChartResponseData = _$MotherTfuChartResponseDataTearOff();

/// @nodoc
mixin _$MotherTfuChartResponseData {
  List<MotherTfuChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherTfuChartResponseDataCopyWith<MotherTfuChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherTfuChartResponseDataCopyWith<$Res> {
  factory $MotherTfuChartResponseDataCopyWith(MotherTfuChartResponseData value,
          $Res Function(MotherTfuChartResponseData) then) =
      _$MotherTfuChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<MotherTfuChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$MotherTfuChartResponseDataCopyWithImpl<$Res>
    implements $MotherTfuChartResponseDataCopyWith<$Res> {
  _$MotherTfuChartResponseDataCopyWithImpl(this._value, this._then);

  final MotherTfuChartResponseData _value;
  // ignore: unused_field
  final $Res Function(MotherTfuChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherTfuChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc {
    if (_value.desc == null) {
      return null;
    }

    return $ChartWarningResponseCopyWith<$Res>(_value.desc!, (value) {
      return _then(_value.copyWith(desc: value));
    });
  }
}

/// @nodoc
abstract class _$MotherTfuChartResponseDataCopyWith<$Res>
    implements $MotherTfuChartResponseDataCopyWith<$Res> {
  factory _$MotherTfuChartResponseDataCopyWith(
          _MotherTfuChartResponseData value,
          $Res Function(_MotherTfuChartResponseData) then) =
      __$MotherTfuChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<MotherTfuChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$MotherTfuChartResponseDataCopyWithImpl<$Res>
    extends _$MotherTfuChartResponseDataCopyWithImpl<$Res>
    implements _$MotherTfuChartResponseDataCopyWith<$Res> {
  __$MotherTfuChartResponseDataCopyWithImpl(_MotherTfuChartResponseData _value,
      $Res Function(_MotherTfuChartResponseData) _then)
      : super(_value, (v) => _then(v as _MotherTfuChartResponseData));

  @override
  _MotherTfuChartResponseData get _value =>
      super._value as _MotherTfuChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_MotherTfuChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherTfuChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherTfuChartResponseData implements _MotherTfuChartResponseData {
  const _$_MotherTfuChartResponseData({required this.data, required this.desc});

  factory _$_MotherTfuChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherTfuChartResponseDataFromJson(json);

  @override
  final List<MotherTfuChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'MotherTfuChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherTfuChartResponseData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(desc);

  @JsonKey(ignore: true)
  @override
  _$MotherTfuChartResponseDataCopyWith<_MotherTfuChartResponseData>
      get copyWith => __$MotherTfuChartResponseDataCopyWithImpl<
          _MotherTfuChartResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherTfuChartResponseDataToJson(this);
  }
}

abstract class _MotherTfuChartResponseData
    implements MotherTfuChartResponseData {
  const factory _MotherTfuChartResponseData(
      {required List<MotherTfuChartData> data,
      required ChartWarningResponse? desc}) = _$_MotherTfuChartResponseData;

  factory _MotherTfuChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_MotherTfuChartResponseData.fromJson;

  @override
  List<MotherTfuChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherTfuChartResponseDataCopyWith<_MotherTfuChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

MotherDjjChartResponse _$MotherDjjChartResponseFromJson(
    Map<String, dynamic> json) {
  return _MotherDjjChartResponse.fromJson(json);
}

/// @nodoc
class _$MotherDjjChartResponseTearOff {
  const _$MotherDjjChartResponseTearOff();

  _MotherDjjChartResponse call(
      {required String message,
      required String status,
      required int code,
      required MotherDjjChartResponseData data}) {
    return _MotherDjjChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  MotherDjjChartResponse fromJson(Map<String, Object> json) {
    return MotherDjjChartResponse.fromJson(json);
  }
}

/// @nodoc
const $MotherDjjChartResponse = _$MotherDjjChartResponseTearOff();

/// @nodoc
mixin _$MotherDjjChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  MotherDjjChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherDjjChartResponseCopyWith<MotherDjjChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherDjjChartResponseCopyWith<$Res> {
  factory $MotherDjjChartResponseCopyWith(MotherDjjChartResponse value,
          $Res Function(MotherDjjChartResponse) then) =
      _$MotherDjjChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String status,
      int code,
      MotherDjjChartResponseData data});

  $MotherDjjChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MotherDjjChartResponseCopyWithImpl<$Res>
    implements $MotherDjjChartResponseCopyWith<$Res> {
  _$MotherDjjChartResponseCopyWithImpl(this._value, this._then);

  final MotherDjjChartResponse _value;
  // ignore: unused_field
  final $Res Function(MotherDjjChartResponse) _then;

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
              as MotherDjjChartResponseData,
    ));
  }

  @override
  $MotherDjjChartResponseDataCopyWith<$Res> get data {
    return $MotherDjjChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$MotherDjjChartResponseCopyWith<$Res>
    implements $MotherDjjChartResponseCopyWith<$Res> {
  factory _$MotherDjjChartResponseCopyWith(_MotherDjjChartResponse value,
          $Res Function(_MotherDjjChartResponse) then) =
      __$MotherDjjChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String status,
      int code,
      MotherDjjChartResponseData data});

  @override
  $MotherDjjChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$MotherDjjChartResponseCopyWithImpl<$Res>
    extends _$MotherDjjChartResponseCopyWithImpl<$Res>
    implements _$MotherDjjChartResponseCopyWith<$Res> {
  __$MotherDjjChartResponseCopyWithImpl(_MotherDjjChartResponse _value,
      $Res Function(_MotherDjjChartResponse) _then)
      : super(_value, (v) => _then(v as _MotherDjjChartResponse));

  @override
  _MotherDjjChartResponse get _value => super._value as _MotherDjjChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_MotherDjjChartResponse(
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
              as MotherDjjChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherDjjChartResponse implements _MotherDjjChartResponse {
  const _$_MotherDjjChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_MotherDjjChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherDjjChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final MotherDjjChartResponseData data;

  @override
  String toString() {
    return 'MotherDjjChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherDjjChartResponse &&
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
  _$MotherDjjChartResponseCopyWith<_MotherDjjChartResponse> get copyWith =>
      __$MotherDjjChartResponseCopyWithImpl<_MotherDjjChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherDjjChartResponseToJson(this);
  }
}

abstract class _MotherDjjChartResponse implements MotherDjjChartResponse {
  const factory _MotherDjjChartResponse(
      {required String message,
      required String status,
      required int code,
      required MotherDjjChartResponseData data}) = _$_MotherDjjChartResponse;

  factory _MotherDjjChartResponse.fromJson(Map<String, dynamic> json) =
      _$_MotherDjjChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  MotherDjjChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherDjjChartResponseCopyWith<_MotherDjjChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MotherDjjChartResponseData _$MotherDjjChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _MotherDjjChartResponseData.fromJson(json);
}

/// @nodoc
class _$MotherDjjChartResponseDataTearOff {
  const _$MotherDjjChartResponseDataTearOff();

  _MotherDjjChartResponseData call(
      {required List<MotherDjjChartData> data,
      required ChartWarningResponse? desc}) {
    return _MotherDjjChartResponseData(
      data: data,
      desc: desc,
    );
  }

  MotherDjjChartResponseData fromJson(Map<String, Object> json) {
    return MotherDjjChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $MotherDjjChartResponseData = _$MotherDjjChartResponseDataTearOff();

/// @nodoc
mixin _$MotherDjjChartResponseData {
  List<MotherDjjChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherDjjChartResponseDataCopyWith<MotherDjjChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherDjjChartResponseDataCopyWith<$Res> {
  factory $MotherDjjChartResponseDataCopyWith(MotherDjjChartResponseData value,
          $Res Function(MotherDjjChartResponseData) then) =
      _$MotherDjjChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<MotherDjjChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$MotherDjjChartResponseDataCopyWithImpl<$Res>
    implements $MotherDjjChartResponseDataCopyWith<$Res> {
  _$MotherDjjChartResponseDataCopyWithImpl(this._value, this._then);

  final MotherDjjChartResponseData _value;
  // ignore: unused_field
  final $Res Function(MotherDjjChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherDjjChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc {
    if (_value.desc == null) {
      return null;
    }

    return $ChartWarningResponseCopyWith<$Res>(_value.desc!, (value) {
      return _then(_value.copyWith(desc: value));
    });
  }
}

/// @nodoc
abstract class _$MotherDjjChartResponseDataCopyWith<$Res>
    implements $MotherDjjChartResponseDataCopyWith<$Res> {
  factory _$MotherDjjChartResponseDataCopyWith(
          _MotherDjjChartResponseData value,
          $Res Function(_MotherDjjChartResponseData) then) =
      __$MotherDjjChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<MotherDjjChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$MotherDjjChartResponseDataCopyWithImpl<$Res>
    extends _$MotherDjjChartResponseDataCopyWithImpl<$Res>
    implements _$MotherDjjChartResponseDataCopyWith<$Res> {
  __$MotherDjjChartResponseDataCopyWithImpl(_MotherDjjChartResponseData _value,
      $Res Function(_MotherDjjChartResponseData) _then)
      : super(_value, (v) => _then(v as _MotherDjjChartResponseData));

  @override
  _MotherDjjChartResponseData get _value =>
      super._value as _MotherDjjChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_MotherDjjChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherDjjChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherDjjChartResponseData implements _MotherDjjChartResponseData {
  const _$_MotherDjjChartResponseData({required this.data, required this.desc});

  factory _$_MotherDjjChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherDjjChartResponseDataFromJson(json);

  @override
  final List<MotherDjjChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'MotherDjjChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherDjjChartResponseData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(desc);

  @JsonKey(ignore: true)
  @override
  _$MotherDjjChartResponseDataCopyWith<_MotherDjjChartResponseData>
      get copyWith => __$MotherDjjChartResponseDataCopyWithImpl<
          _MotherDjjChartResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherDjjChartResponseDataToJson(this);
  }
}

abstract class _MotherDjjChartResponseData
    implements MotherDjjChartResponseData {
  const factory _MotherDjjChartResponseData(
      {required List<MotherDjjChartData> data,
      required ChartWarningResponse? desc}) = _$_MotherDjjChartResponseData;

  factory _MotherDjjChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_MotherDjjChartResponseData.fromJson;

  @override
  List<MotherDjjChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherDjjChartResponseDataCopyWith<_MotherDjjChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

MotherMapChartResponse _$MotherMapChartResponseFromJson(
    Map<String, dynamic> json) {
  return _MotherMapChartResponse.fromJson(json);
}

/// @nodoc
class _$MotherMapChartResponseTearOff {
  const _$MotherMapChartResponseTearOff();

  _MotherMapChartResponse call(
      {required String message,
      required String status,
      required int code,
      required MotherMapChartResponseData data}) {
    return _MotherMapChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  MotherMapChartResponse fromJson(Map<String, Object> json) {
    return MotherMapChartResponse.fromJson(json);
  }
}

/// @nodoc
const $MotherMapChartResponse = _$MotherMapChartResponseTearOff();

/// @nodoc
mixin _$MotherMapChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  MotherMapChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherMapChartResponseCopyWith<MotherMapChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherMapChartResponseCopyWith<$Res> {
  factory $MotherMapChartResponseCopyWith(MotherMapChartResponse value,
          $Res Function(MotherMapChartResponse) then) =
      _$MotherMapChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String status,
      int code,
      MotherMapChartResponseData data});

  $MotherMapChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MotherMapChartResponseCopyWithImpl<$Res>
    implements $MotherMapChartResponseCopyWith<$Res> {
  _$MotherMapChartResponseCopyWithImpl(this._value, this._then);

  final MotherMapChartResponse _value;
  // ignore: unused_field
  final $Res Function(MotherMapChartResponse) _then;

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
              as MotherMapChartResponseData,
    ));
  }

  @override
  $MotherMapChartResponseDataCopyWith<$Res> get data {
    return $MotherMapChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$MotherMapChartResponseCopyWith<$Res>
    implements $MotherMapChartResponseCopyWith<$Res> {
  factory _$MotherMapChartResponseCopyWith(_MotherMapChartResponse value,
          $Res Function(_MotherMapChartResponse) then) =
      __$MotherMapChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String status,
      int code,
      MotherMapChartResponseData data});

  @override
  $MotherMapChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$MotherMapChartResponseCopyWithImpl<$Res>
    extends _$MotherMapChartResponseCopyWithImpl<$Res>
    implements _$MotherMapChartResponseCopyWith<$Res> {
  __$MotherMapChartResponseCopyWithImpl(_MotherMapChartResponse _value,
      $Res Function(_MotherMapChartResponse) _then)
      : super(_value, (v) => _then(v as _MotherMapChartResponse));

  @override
  _MotherMapChartResponse get _value => super._value as _MotherMapChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_MotherMapChartResponse(
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
              as MotherMapChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherMapChartResponse implements _MotherMapChartResponse {
  const _$_MotherMapChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_MotherMapChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherMapChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final MotherMapChartResponseData data;

  @override
  String toString() {
    return 'MotherMapChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherMapChartResponse &&
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
  _$MotherMapChartResponseCopyWith<_MotherMapChartResponse> get copyWith =>
      __$MotherMapChartResponseCopyWithImpl<_MotherMapChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherMapChartResponseToJson(this);
  }
}

abstract class _MotherMapChartResponse implements MotherMapChartResponse {
  const factory _MotherMapChartResponse(
      {required String message,
      required String status,
      required int code,
      required MotherMapChartResponseData data}) = _$_MotherMapChartResponse;

  factory _MotherMapChartResponse.fromJson(Map<String, dynamic> json) =
      _$_MotherMapChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  MotherMapChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherMapChartResponseCopyWith<_MotherMapChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MotherMapChartResponseData _$MotherMapChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _MotherMapChartResponseData.fromJson(json);
}

/// @nodoc
class _$MotherMapChartResponseDataTearOff {
  const _$MotherMapChartResponseDataTearOff();

  _MotherMapChartResponseData call(
      {required List<MotherMapChartData> data,
      required ChartWarningResponse? desc}) {
    return _MotherMapChartResponseData(
      data: data,
      desc: desc,
    );
  }

  MotherMapChartResponseData fromJson(Map<String, Object> json) {
    return MotherMapChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $MotherMapChartResponseData = _$MotherMapChartResponseDataTearOff();

/// @nodoc
mixin _$MotherMapChartResponseData {
  List<MotherMapChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherMapChartResponseDataCopyWith<MotherMapChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherMapChartResponseDataCopyWith<$Res> {
  factory $MotherMapChartResponseDataCopyWith(MotherMapChartResponseData value,
          $Res Function(MotherMapChartResponseData) then) =
      _$MotherMapChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<MotherMapChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$MotherMapChartResponseDataCopyWithImpl<$Res>
    implements $MotherMapChartResponseDataCopyWith<$Res> {
  _$MotherMapChartResponseDataCopyWithImpl(this._value, this._then);

  final MotherMapChartResponseData _value;
  // ignore: unused_field
  final $Res Function(MotherMapChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherMapChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc {
    if (_value.desc == null) {
      return null;
    }

    return $ChartWarningResponseCopyWith<$Res>(_value.desc!, (value) {
      return _then(_value.copyWith(desc: value));
    });
  }
}

/// @nodoc
abstract class _$MotherMapChartResponseDataCopyWith<$Res>
    implements $MotherMapChartResponseDataCopyWith<$Res> {
  factory _$MotherMapChartResponseDataCopyWith(
          _MotherMapChartResponseData value,
          $Res Function(_MotherMapChartResponseData) then) =
      __$MotherMapChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<MotherMapChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$MotherMapChartResponseDataCopyWithImpl<$Res>
    extends _$MotherMapChartResponseDataCopyWithImpl<$Res>
    implements _$MotherMapChartResponseDataCopyWith<$Res> {
  __$MotherMapChartResponseDataCopyWithImpl(_MotherMapChartResponseData _value,
      $Res Function(_MotherMapChartResponseData) _then)
      : super(_value, (v) => _then(v as _MotherMapChartResponseData));

  @override
  _MotherMapChartResponseData get _value =>
      super._value as _MotherMapChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_MotherMapChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherMapChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherMapChartResponseData implements _MotherMapChartResponseData {
  const _$_MotherMapChartResponseData({required this.data, required this.desc});

  factory _$_MotherMapChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherMapChartResponseDataFromJson(json);

  @override
  final List<MotherMapChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'MotherMapChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherMapChartResponseData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(desc);

  @JsonKey(ignore: true)
  @override
  _$MotherMapChartResponseDataCopyWith<_MotherMapChartResponseData>
      get copyWith => __$MotherMapChartResponseDataCopyWithImpl<
          _MotherMapChartResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherMapChartResponseDataToJson(this);
  }
}

abstract class _MotherMapChartResponseData
    implements MotherMapChartResponseData {
  const factory _MotherMapChartResponseData(
      {required List<MotherMapChartData> data,
      required ChartWarningResponse? desc}) = _$_MotherMapChartResponseData;

  factory _MotherMapChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_MotherMapChartResponseData.fromJson;

  @override
  List<MotherMapChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherMapChartResponseDataCopyWith<_MotherMapChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

MotherBmiChartResponse _$MotherBmiChartResponseFromJson(
    Map<String, dynamic> json) {
  return _MotherBmiChartResponse.fromJson(json);
}

/// @nodoc
class _$MotherBmiChartResponseTearOff {
  const _$MotherBmiChartResponseTearOff();

  _MotherBmiChartResponse call(
      {required String message,
      required String status,
      required int code,
      required MotherBmiChartResponseData data}) {
    return _MotherBmiChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  MotherBmiChartResponse fromJson(Map<String, Object> json) {
    return MotherBmiChartResponse.fromJson(json);
  }
}

/// @nodoc
const $MotherBmiChartResponse = _$MotherBmiChartResponseTearOff();

/// @nodoc
mixin _$MotherBmiChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  MotherBmiChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherBmiChartResponseCopyWith<MotherBmiChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherBmiChartResponseCopyWith<$Res> {
  factory $MotherBmiChartResponseCopyWith(MotherBmiChartResponse value,
          $Res Function(MotherBmiChartResponse) then) =
      _$MotherBmiChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String status,
      int code,
      MotherBmiChartResponseData data});

  $MotherBmiChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MotherBmiChartResponseCopyWithImpl<$Res>
    implements $MotherBmiChartResponseCopyWith<$Res> {
  _$MotherBmiChartResponseCopyWithImpl(this._value, this._then);

  final MotherBmiChartResponse _value;
  // ignore: unused_field
  final $Res Function(MotherBmiChartResponse) _then;

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
              as MotherBmiChartResponseData,
    ));
  }

  @override
  $MotherBmiChartResponseDataCopyWith<$Res> get data {
    return $MotherBmiChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$MotherBmiChartResponseCopyWith<$Res>
    implements $MotherBmiChartResponseCopyWith<$Res> {
  factory _$MotherBmiChartResponseCopyWith(_MotherBmiChartResponse value,
          $Res Function(_MotherBmiChartResponse) then) =
      __$MotherBmiChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String status,
      int code,
      MotherBmiChartResponseData data});

  @override
  $MotherBmiChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$MotherBmiChartResponseCopyWithImpl<$Res>
    extends _$MotherBmiChartResponseCopyWithImpl<$Res>
    implements _$MotherBmiChartResponseCopyWith<$Res> {
  __$MotherBmiChartResponseCopyWithImpl(_MotherBmiChartResponse _value,
      $Res Function(_MotherBmiChartResponse) _then)
      : super(_value, (v) => _then(v as _MotherBmiChartResponse));

  @override
  _MotherBmiChartResponse get _value => super._value as _MotherBmiChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_MotherBmiChartResponse(
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
              as MotherBmiChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherBmiChartResponse implements _MotherBmiChartResponse {
  const _$_MotherBmiChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_MotherBmiChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherBmiChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final MotherBmiChartResponseData data;

  @override
  String toString() {
    return 'MotherBmiChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherBmiChartResponse &&
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
  _$MotherBmiChartResponseCopyWith<_MotherBmiChartResponse> get copyWith =>
      __$MotherBmiChartResponseCopyWithImpl<_MotherBmiChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherBmiChartResponseToJson(this);
  }
}

abstract class _MotherBmiChartResponse implements MotherBmiChartResponse {
  const factory _MotherBmiChartResponse(
      {required String message,
      required String status,
      required int code,
      required MotherBmiChartResponseData data}) = _$_MotherBmiChartResponse;

  factory _MotherBmiChartResponse.fromJson(Map<String, dynamic> json) =
      _$_MotherBmiChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  MotherBmiChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherBmiChartResponseCopyWith<_MotherBmiChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MotherBmiChartResponseData _$MotherBmiChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _MotherBmiChartResponseData.fromJson(json);
}

/// @nodoc
class _$MotherBmiChartResponseDataTearOff {
  const _$MotherBmiChartResponseDataTearOff();

  _MotherBmiChartResponseData call(
      {required List<MotherBmiChartData> data,
      required ChartWarningResponse? desc}) {
    return _MotherBmiChartResponseData(
      data: data,
      desc: desc,
    );
  }

  MotherBmiChartResponseData fromJson(Map<String, Object> json) {
    return MotherBmiChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $MotherBmiChartResponseData = _$MotherBmiChartResponseDataTearOff();

/// @nodoc
mixin _$MotherBmiChartResponseData {
  List<MotherBmiChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotherBmiChartResponseDataCopyWith<MotherBmiChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherBmiChartResponseDataCopyWith<$Res> {
  factory $MotherBmiChartResponseDataCopyWith(MotherBmiChartResponseData value,
          $Res Function(MotherBmiChartResponseData) then) =
      _$MotherBmiChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<MotherBmiChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$MotherBmiChartResponseDataCopyWithImpl<$Res>
    implements $MotherBmiChartResponseDataCopyWith<$Res> {
  _$MotherBmiChartResponseDataCopyWithImpl(this._value, this._then);

  final MotherBmiChartResponseData _value;
  // ignore: unused_field
  final $Res Function(MotherBmiChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherBmiChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc {
    if (_value.desc == null) {
      return null;
    }

    return $ChartWarningResponseCopyWith<$Res>(_value.desc!, (value) {
      return _then(_value.copyWith(desc: value));
    });
  }
}

/// @nodoc
abstract class _$MotherBmiChartResponseDataCopyWith<$Res>
    implements $MotherBmiChartResponseDataCopyWith<$Res> {
  factory _$MotherBmiChartResponseDataCopyWith(
          _MotherBmiChartResponseData value,
          $Res Function(_MotherBmiChartResponseData) then) =
      __$MotherBmiChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<MotherBmiChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$MotherBmiChartResponseDataCopyWithImpl<$Res>
    extends _$MotherBmiChartResponseDataCopyWithImpl<$Res>
    implements _$MotherBmiChartResponseDataCopyWith<$Res> {
  __$MotherBmiChartResponseDataCopyWithImpl(_MotherBmiChartResponseData _value,
      $Res Function(_MotherBmiChartResponseData) _then)
      : super(_value, (v) => _then(v as _MotherBmiChartResponseData));

  @override
  _MotherBmiChartResponseData get _value =>
      super._value as _MotherBmiChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_MotherBmiChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MotherBmiChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotherBmiChartResponseData implements _MotherBmiChartResponseData {
  const _$_MotherBmiChartResponseData({required this.data, required this.desc});

  factory _$_MotherBmiChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_MotherBmiChartResponseDataFromJson(json);

  @override
  final List<MotherBmiChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'MotherBmiChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MotherBmiChartResponseData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(desc);

  @JsonKey(ignore: true)
  @override
  _$MotherBmiChartResponseDataCopyWith<_MotherBmiChartResponseData>
      get copyWith => __$MotherBmiChartResponseDataCopyWithImpl<
          _MotherBmiChartResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MotherBmiChartResponseDataToJson(this);
  }
}

abstract class _MotherBmiChartResponseData
    implements MotherBmiChartResponseData {
  const factory _MotherBmiChartResponseData(
      {required List<MotherBmiChartData> data,
      required ChartWarningResponse? desc}) = _$_MotherBmiChartResponseData;

  factory _MotherBmiChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_MotherBmiChartResponseData.fromJson;

  @override
  List<MotherBmiChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MotherBmiChartResponseDataCopyWith<_MotherBmiChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}
