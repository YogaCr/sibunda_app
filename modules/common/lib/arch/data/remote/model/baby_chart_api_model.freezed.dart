// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'baby_chart_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BabyWeightChartResponse _$BabyWeightChartResponseFromJson(
    Map<String, dynamic> json) {
  return _BabyWeightChartResponse.fromJson(json);
}

/// @nodoc
class _$BabyWeightChartResponseTearOff {
  const _$BabyWeightChartResponseTearOff();

  _BabyWeightChartResponse call(
      {required String message,
      required String status,
      required int code,
      required BabyWeightChartResponseData data}) {
    return _BabyWeightChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BabyWeightChartResponse fromJson(Map<String, Object> json) {
    return BabyWeightChartResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyWeightChartResponse = _$BabyWeightChartResponseTearOff();

/// @nodoc
mixin _$BabyWeightChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  BabyWeightChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyWeightChartResponseCopyWith<BabyWeightChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyWeightChartResponseCopyWith<$Res> {
  factory $BabyWeightChartResponseCopyWith(BabyWeightChartResponse value,
          $Res Function(BabyWeightChartResponse) then) =
      _$BabyWeightChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String status,
      int code,
      BabyWeightChartResponseData data});

  $BabyWeightChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BabyWeightChartResponseCopyWithImpl<$Res>
    implements $BabyWeightChartResponseCopyWith<$Res> {
  _$BabyWeightChartResponseCopyWithImpl(this._value, this._then);

  final BabyWeightChartResponse _value;
  // ignore: unused_field
  final $Res Function(BabyWeightChartResponse) _then;

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
              as BabyWeightChartResponseData,
    ));
  }

  @override
  $BabyWeightChartResponseDataCopyWith<$Res> get data {
    return $BabyWeightChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$BabyWeightChartResponseCopyWith<$Res>
    implements $BabyWeightChartResponseCopyWith<$Res> {
  factory _$BabyWeightChartResponseCopyWith(_BabyWeightChartResponse value,
          $Res Function(_BabyWeightChartResponse) then) =
      __$BabyWeightChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String status,
      int code,
      BabyWeightChartResponseData data});

  @override
  $BabyWeightChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$BabyWeightChartResponseCopyWithImpl<$Res>
    extends _$BabyWeightChartResponseCopyWithImpl<$Res>
    implements _$BabyWeightChartResponseCopyWith<$Res> {
  __$BabyWeightChartResponseCopyWithImpl(_BabyWeightChartResponse _value,
      $Res Function(_BabyWeightChartResponse) _then)
      : super(_value, (v) => _then(v as _BabyWeightChartResponse));

  @override
  _BabyWeightChartResponse get _value =>
      super._value as _BabyWeightChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BabyWeightChartResponse(
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
              as BabyWeightChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyWeightChartResponse implements _BabyWeightChartResponse {
  const _$_BabyWeightChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BabyWeightChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyWeightChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final BabyWeightChartResponseData data;

  @override
  String toString() {
    return 'BabyWeightChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyWeightChartResponse &&
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
  _$BabyWeightChartResponseCopyWith<_BabyWeightChartResponse> get copyWith =>
      __$BabyWeightChartResponseCopyWithImpl<_BabyWeightChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyWeightChartResponseToJson(this);
  }
}

abstract class _BabyWeightChartResponse implements BabyWeightChartResponse {
  const factory _BabyWeightChartResponse(
      {required String message,
      required String status,
      required int code,
      required BabyWeightChartResponseData data}) = _$_BabyWeightChartResponse;

  factory _BabyWeightChartResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyWeightChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  BabyWeightChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyWeightChartResponseCopyWith<_BabyWeightChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyWeightChartResponseData _$BabyWeightChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BabyWeightChartResponseData.fromJson(json);
}

/// @nodoc
class _$BabyWeightChartResponseDataTearOff {
  const _$BabyWeightChartResponseDataTearOff();

  _BabyWeightChartResponseData call(
      {required List<BabyWeightChartData> data,
      required ChartWarningResponse? desc}) {
    return _BabyWeightChartResponseData(
      data: data,
      desc: desc,
    );
  }

  BabyWeightChartResponseData fromJson(Map<String, Object> json) {
    return BabyWeightChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $BabyWeightChartResponseData = _$BabyWeightChartResponseDataTearOff();

/// @nodoc
mixin _$BabyWeightChartResponseData {
  List<BabyWeightChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyWeightChartResponseDataCopyWith<BabyWeightChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyWeightChartResponseDataCopyWith<$Res> {
  factory $BabyWeightChartResponseDataCopyWith(
          BabyWeightChartResponseData value,
          $Res Function(BabyWeightChartResponseData) then) =
      _$BabyWeightChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<BabyWeightChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$BabyWeightChartResponseDataCopyWithImpl<$Res>
    implements $BabyWeightChartResponseDataCopyWith<$Res> {
  _$BabyWeightChartResponseDataCopyWithImpl(this._value, this._then);

  final BabyWeightChartResponseData _value;
  // ignore: unused_field
  final $Res Function(BabyWeightChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyWeightChartData>,
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
abstract class _$BabyWeightChartResponseDataCopyWith<$Res>
    implements $BabyWeightChartResponseDataCopyWith<$Res> {
  factory _$BabyWeightChartResponseDataCopyWith(
          _BabyWeightChartResponseData value,
          $Res Function(_BabyWeightChartResponseData) then) =
      __$BabyWeightChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<BabyWeightChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$BabyWeightChartResponseDataCopyWithImpl<$Res>
    extends _$BabyWeightChartResponseDataCopyWithImpl<$Res>
    implements _$BabyWeightChartResponseDataCopyWith<$Res> {
  __$BabyWeightChartResponseDataCopyWithImpl(
      _BabyWeightChartResponseData _value,
      $Res Function(_BabyWeightChartResponseData) _then)
      : super(_value, (v) => _then(v as _BabyWeightChartResponseData));

  @override
  _BabyWeightChartResponseData get _value =>
      super._value as _BabyWeightChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_BabyWeightChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyWeightChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyWeightChartResponseData implements _BabyWeightChartResponseData {
  const _$_BabyWeightChartResponseData(
      {required this.data, required this.desc});

  factory _$_BabyWeightChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyWeightChartResponseDataFromJson(json);

  @override
  final List<BabyWeightChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'BabyWeightChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyWeightChartResponseData &&
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
  _$BabyWeightChartResponseDataCopyWith<_BabyWeightChartResponseData>
      get copyWith => __$BabyWeightChartResponseDataCopyWithImpl<
          _BabyWeightChartResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyWeightChartResponseDataToJson(this);
  }
}

abstract class _BabyWeightChartResponseData
    implements BabyWeightChartResponseData {
  const factory _BabyWeightChartResponseData(
      {required List<BabyWeightChartData> data,
      required ChartWarningResponse? desc}) = _$_BabyWeightChartResponseData;

  factory _BabyWeightChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_BabyWeightChartResponseData.fromJson;

  @override
  List<BabyWeightChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyWeightChartResponseDataCopyWith<_BabyWeightChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

BabyKmsChartResponse _$BabyKmsChartResponseFromJson(Map<String, dynamic> json) {
  return _BabyKmsChartResponse.fromJson(json);
}

/// @nodoc
class _$BabyKmsChartResponseTearOff {
  const _$BabyKmsChartResponseTearOff();

  _BabyKmsChartResponse call(
      {required String message,
      required String status,
      required int code,
      required BabyKmsChartResponseData data}) {
    return _BabyKmsChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BabyKmsChartResponse fromJson(Map<String, Object> json) {
    return BabyKmsChartResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyKmsChartResponse = _$BabyKmsChartResponseTearOff();

/// @nodoc
mixin _$BabyKmsChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  BabyKmsChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyKmsChartResponseCopyWith<BabyKmsChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyKmsChartResponseCopyWith<$Res> {
  factory $BabyKmsChartResponseCopyWith(BabyKmsChartResponse value,
          $Res Function(BabyKmsChartResponse) then) =
      _$BabyKmsChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message, String status, int code, BabyKmsChartResponseData data});

  $BabyKmsChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BabyKmsChartResponseCopyWithImpl<$Res>
    implements $BabyKmsChartResponseCopyWith<$Res> {
  _$BabyKmsChartResponseCopyWithImpl(this._value, this._then);

  final BabyKmsChartResponse _value;
  // ignore: unused_field
  final $Res Function(BabyKmsChartResponse) _then;

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
              as BabyKmsChartResponseData,
    ));
  }

  @override
  $BabyKmsChartResponseDataCopyWith<$Res> get data {
    return $BabyKmsChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$BabyKmsChartResponseCopyWith<$Res>
    implements $BabyKmsChartResponseCopyWith<$Res> {
  factory _$BabyKmsChartResponseCopyWith(_BabyKmsChartResponse value,
          $Res Function(_BabyKmsChartResponse) then) =
      __$BabyKmsChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message, String status, int code, BabyKmsChartResponseData data});

  @override
  $BabyKmsChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$BabyKmsChartResponseCopyWithImpl<$Res>
    extends _$BabyKmsChartResponseCopyWithImpl<$Res>
    implements _$BabyKmsChartResponseCopyWith<$Res> {
  __$BabyKmsChartResponseCopyWithImpl(
      _BabyKmsChartResponse _value, $Res Function(_BabyKmsChartResponse) _then)
      : super(_value, (v) => _then(v as _BabyKmsChartResponse));

  @override
  _BabyKmsChartResponse get _value => super._value as _BabyKmsChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BabyKmsChartResponse(
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
              as BabyKmsChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyKmsChartResponse implements _BabyKmsChartResponse {
  const _$_BabyKmsChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BabyKmsChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyKmsChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final BabyKmsChartResponseData data;

  @override
  String toString() {
    return 'BabyKmsChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyKmsChartResponse &&
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
  _$BabyKmsChartResponseCopyWith<_BabyKmsChartResponse> get copyWith =>
      __$BabyKmsChartResponseCopyWithImpl<_BabyKmsChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyKmsChartResponseToJson(this);
  }
}

abstract class _BabyKmsChartResponse implements BabyKmsChartResponse {
  const factory _BabyKmsChartResponse(
      {required String message,
      required String status,
      required int code,
      required BabyKmsChartResponseData data}) = _$_BabyKmsChartResponse;

  factory _BabyKmsChartResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyKmsChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  BabyKmsChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyKmsChartResponseCopyWith<_BabyKmsChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyKmsChartResponseData _$BabyKmsChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BabyKmsChartResponseData.fromJson(json);
}

/// @nodoc
class _$BabyKmsChartResponseDataTearOff {
  const _$BabyKmsChartResponseDataTearOff();

  _BabyKmsChartResponseData call(
      {required List<BabyKmsChartData> data,
      required ChartWarningResponse? desc}) {
    return _BabyKmsChartResponseData(
      data: data,
      desc: desc,
    );
  }

  BabyKmsChartResponseData fromJson(Map<String, Object> json) {
    return BabyKmsChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $BabyKmsChartResponseData = _$BabyKmsChartResponseDataTearOff();

/// @nodoc
mixin _$BabyKmsChartResponseData {
  List<BabyKmsChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyKmsChartResponseDataCopyWith<BabyKmsChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyKmsChartResponseDataCopyWith<$Res> {
  factory $BabyKmsChartResponseDataCopyWith(BabyKmsChartResponseData value,
          $Res Function(BabyKmsChartResponseData) then) =
      _$BabyKmsChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<BabyKmsChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$BabyKmsChartResponseDataCopyWithImpl<$Res>
    implements $BabyKmsChartResponseDataCopyWith<$Res> {
  _$BabyKmsChartResponseDataCopyWithImpl(this._value, this._then);

  final BabyKmsChartResponseData _value;
  // ignore: unused_field
  final $Res Function(BabyKmsChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyKmsChartData>,
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
abstract class _$BabyKmsChartResponseDataCopyWith<$Res>
    implements $BabyKmsChartResponseDataCopyWith<$Res> {
  factory _$BabyKmsChartResponseDataCopyWith(_BabyKmsChartResponseData value,
          $Res Function(_BabyKmsChartResponseData) then) =
      __$BabyKmsChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<BabyKmsChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$BabyKmsChartResponseDataCopyWithImpl<$Res>
    extends _$BabyKmsChartResponseDataCopyWithImpl<$Res>
    implements _$BabyKmsChartResponseDataCopyWith<$Res> {
  __$BabyKmsChartResponseDataCopyWithImpl(_BabyKmsChartResponseData _value,
      $Res Function(_BabyKmsChartResponseData) _then)
      : super(_value, (v) => _then(v as _BabyKmsChartResponseData));

  @override
  _BabyKmsChartResponseData get _value =>
      super._value as _BabyKmsChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_BabyKmsChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyKmsChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyKmsChartResponseData implements _BabyKmsChartResponseData {
  const _$_BabyKmsChartResponseData({required this.data, required this.desc});

  factory _$_BabyKmsChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyKmsChartResponseDataFromJson(json);

  @override
  final List<BabyKmsChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'BabyKmsChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyKmsChartResponseData &&
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
  _$BabyKmsChartResponseDataCopyWith<_BabyKmsChartResponseData> get copyWith =>
      __$BabyKmsChartResponseDataCopyWithImpl<_BabyKmsChartResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyKmsChartResponseDataToJson(this);
  }
}

abstract class _BabyKmsChartResponseData implements BabyKmsChartResponseData {
  const factory _BabyKmsChartResponseData(
      {required List<BabyKmsChartData> data,
      required ChartWarningResponse? desc}) = _$_BabyKmsChartResponseData;

  factory _BabyKmsChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_BabyKmsChartResponseData.fromJson;

  @override
  List<BabyKmsChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyKmsChartResponseDataCopyWith<_BabyKmsChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyLenChartResponse _$BabyLenChartResponseFromJson(Map<String, dynamic> json) {
  return _BabyLenChartResponse.fromJson(json);
}

/// @nodoc
class _$BabyLenChartResponseTearOff {
  const _$BabyLenChartResponseTearOff();

  _BabyLenChartResponse call(
      {required String message,
      required String status,
      required int code,
      required BabyLenChartResponseData data}) {
    return _BabyLenChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BabyLenChartResponse fromJson(Map<String, Object> json) {
    return BabyLenChartResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyLenChartResponse = _$BabyLenChartResponseTearOff();

/// @nodoc
mixin _$BabyLenChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  BabyLenChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyLenChartResponseCopyWith<BabyLenChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyLenChartResponseCopyWith<$Res> {
  factory $BabyLenChartResponseCopyWith(BabyLenChartResponse value,
          $Res Function(BabyLenChartResponse) then) =
      _$BabyLenChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message, String status, int code, BabyLenChartResponseData data});

  $BabyLenChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BabyLenChartResponseCopyWithImpl<$Res>
    implements $BabyLenChartResponseCopyWith<$Res> {
  _$BabyLenChartResponseCopyWithImpl(this._value, this._then);

  final BabyLenChartResponse _value;
  // ignore: unused_field
  final $Res Function(BabyLenChartResponse) _then;

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
              as BabyLenChartResponseData,
    ));
  }

  @override
  $BabyLenChartResponseDataCopyWith<$Res> get data {
    return $BabyLenChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$BabyLenChartResponseCopyWith<$Res>
    implements $BabyLenChartResponseCopyWith<$Res> {
  factory _$BabyLenChartResponseCopyWith(_BabyLenChartResponse value,
          $Res Function(_BabyLenChartResponse) then) =
      __$BabyLenChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message, String status, int code, BabyLenChartResponseData data});

  @override
  $BabyLenChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$BabyLenChartResponseCopyWithImpl<$Res>
    extends _$BabyLenChartResponseCopyWithImpl<$Res>
    implements _$BabyLenChartResponseCopyWith<$Res> {
  __$BabyLenChartResponseCopyWithImpl(
      _BabyLenChartResponse _value, $Res Function(_BabyLenChartResponse) _then)
      : super(_value, (v) => _then(v as _BabyLenChartResponse));

  @override
  _BabyLenChartResponse get _value => super._value as _BabyLenChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BabyLenChartResponse(
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
              as BabyLenChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyLenChartResponse implements _BabyLenChartResponse {
  const _$_BabyLenChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BabyLenChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyLenChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final BabyLenChartResponseData data;

  @override
  String toString() {
    return 'BabyLenChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyLenChartResponse &&
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
  _$BabyLenChartResponseCopyWith<_BabyLenChartResponse> get copyWith =>
      __$BabyLenChartResponseCopyWithImpl<_BabyLenChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyLenChartResponseToJson(this);
  }
}

abstract class _BabyLenChartResponse implements BabyLenChartResponse {
  const factory _BabyLenChartResponse(
      {required String message,
      required String status,
      required int code,
      required BabyLenChartResponseData data}) = _$_BabyLenChartResponse;

  factory _BabyLenChartResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyLenChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  BabyLenChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyLenChartResponseCopyWith<_BabyLenChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyLenChartResponseData _$BabyLenChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BabyLenChartResponseData.fromJson(json);
}

/// @nodoc
class _$BabyLenChartResponseDataTearOff {
  const _$BabyLenChartResponseDataTearOff();

  _BabyLenChartResponseData call(
      {required List<BabyLenChartData> data,
      required ChartWarningResponse? desc}) {
    return _BabyLenChartResponseData(
      data: data,
      desc: desc,
    );
  }

  BabyLenChartResponseData fromJson(Map<String, Object> json) {
    return BabyLenChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $BabyLenChartResponseData = _$BabyLenChartResponseDataTearOff();

/// @nodoc
mixin _$BabyLenChartResponseData {
  List<BabyLenChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyLenChartResponseDataCopyWith<BabyLenChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyLenChartResponseDataCopyWith<$Res> {
  factory $BabyLenChartResponseDataCopyWith(BabyLenChartResponseData value,
          $Res Function(BabyLenChartResponseData) then) =
      _$BabyLenChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<BabyLenChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$BabyLenChartResponseDataCopyWithImpl<$Res>
    implements $BabyLenChartResponseDataCopyWith<$Res> {
  _$BabyLenChartResponseDataCopyWithImpl(this._value, this._then);

  final BabyLenChartResponseData _value;
  // ignore: unused_field
  final $Res Function(BabyLenChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyLenChartData>,
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
abstract class _$BabyLenChartResponseDataCopyWith<$Res>
    implements $BabyLenChartResponseDataCopyWith<$Res> {
  factory _$BabyLenChartResponseDataCopyWith(_BabyLenChartResponseData value,
          $Res Function(_BabyLenChartResponseData) then) =
      __$BabyLenChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<BabyLenChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$BabyLenChartResponseDataCopyWithImpl<$Res>
    extends _$BabyLenChartResponseDataCopyWithImpl<$Res>
    implements _$BabyLenChartResponseDataCopyWith<$Res> {
  __$BabyLenChartResponseDataCopyWithImpl(_BabyLenChartResponseData _value,
      $Res Function(_BabyLenChartResponseData) _then)
      : super(_value, (v) => _then(v as _BabyLenChartResponseData));

  @override
  _BabyLenChartResponseData get _value =>
      super._value as _BabyLenChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_BabyLenChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyLenChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyLenChartResponseData implements _BabyLenChartResponseData {
  const _$_BabyLenChartResponseData({required this.data, required this.desc});

  factory _$_BabyLenChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyLenChartResponseDataFromJson(json);

  @override
  final List<BabyLenChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'BabyLenChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyLenChartResponseData &&
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
  _$BabyLenChartResponseDataCopyWith<_BabyLenChartResponseData> get copyWith =>
      __$BabyLenChartResponseDataCopyWithImpl<_BabyLenChartResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyLenChartResponseDataToJson(this);
  }
}

abstract class _BabyLenChartResponseData implements BabyLenChartResponseData {
  const factory _BabyLenChartResponseData(
      {required List<BabyLenChartData> data,
      required ChartWarningResponse? desc}) = _$_BabyLenChartResponseData;

  factory _BabyLenChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_BabyLenChartResponseData.fromJson;

  @override
  List<BabyLenChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyLenChartResponseDataCopyWith<_BabyLenChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyWeightToLenChartResponse _$BabyWeightToLenChartResponseFromJson(
    Map<String, dynamic> json) {
  return _BabyWeightToLenChartResponse.fromJson(json);
}

/// @nodoc
class _$BabyWeightToLenChartResponseTearOff {
  const _$BabyWeightToLenChartResponseTearOff();

  _BabyWeightToLenChartResponse call(
      {required String message,
      required String status,
      required int code,
      required BabyWeightToLenChartResponseData data}) {
    return _BabyWeightToLenChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BabyWeightToLenChartResponse fromJson(Map<String, Object> json) {
    return BabyWeightToLenChartResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyWeightToLenChartResponse = _$BabyWeightToLenChartResponseTearOff();

/// @nodoc
mixin _$BabyWeightToLenChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  BabyWeightToLenChartResponseData get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyWeightToLenChartResponseCopyWith<BabyWeightToLenChartResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyWeightToLenChartResponseCopyWith<$Res> {
  factory $BabyWeightToLenChartResponseCopyWith(
          BabyWeightToLenChartResponse value,
          $Res Function(BabyWeightToLenChartResponse) then) =
      _$BabyWeightToLenChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String status,
      int code,
      BabyWeightToLenChartResponseData data});

  $BabyWeightToLenChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BabyWeightToLenChartResponseCopyWithImpl<$Res>
    implements $BabyWeightToLenChartResponseCopyWith<$Res> {
  _$BabyWeightToLenChartResponseCopyWithImpl(this._value, this._then);

  final BabyWeightToLenChartResponse _value;
  // ignore: unused_field
  final $Res Function(BabyWeightToLenChartResponse) _then;

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
              as BabyWeightToLenChartResponseData,
    ));
  }

  @override
  $BabyWeightToLenChartResponseDataCopyWith<$Res> get data {
    return $BabyWeightToLenChartResponseDataCopyWith<$Res>(_value.data,
        (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$BabyWeightToLenChartResponseCopyWith<$Res>
    implements $BabyWeightToLenChartResponseCopyWith<$Res> {
  factory _$BabyWeightToLenChartResponseCopyWith(
          _BabyWeightToLenChartResponse value,
          $Res Function(_BabyWeightToLenChartResponse) then) =
      __$BabyWeightToLenChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String status,
      int code,
      BabyWeightToLenChartResponseData data});

  @override
  $BabyWeightToLenChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$BabyWeightToLenChartResponseCopyWithImpl<$Res>
    extends _$BabyWeightToLenChartResponseCopyWithImpl<$Res>
    implements _$BabyWeightToLenChartResponseCopyWith<$Res> {
  __$BabyWeightToLenChartResponseCopyWithImpl(
      _BabyWeightToLenChartResponse _value,
      $Res Function(_BabyWeightToLenChartResponse) _then)
      : super(_value, (v) => _then(v as _BabyWeightToLenChartResponse));

  @override
  _BabyWeightToLenChartResponse get _value =>
      super._value as _BabyWeightToLenChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BabyWeightToLenChartResponse(
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
              as BabyWeightToLenChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyWeightToLenChartResponse implements _BabyWeightToLenChartResponse {
  const _$_BabyWeightToLenChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BabyWeightToLenChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyWeightToLenChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final BabyWeightToLenChartResponseData data;

  @override
  String toString() {
    return 'BabyWeightToLenChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyWeightToLenChartResponse &&
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
  _$BabyWeightToLenChartResponseCopyWith<_BabyWeightToLenChartResponse>
      get copyWith => __$BabyWeightToLenChartResponseCopyWithImpl<
          _BabyWeightToLenChartResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyWeightToLenChartResponseToJson(this);
  }
}

abstract class _BabyWeightToLenChartResponse
    implements BabyWeightToLenChartResponse {
  const factory _BabyWeightToLenChartResponse(
          {required String message,
          required String status,
          required int code,
          required BabyWeightToLenChartResponseData data}) =
      _$_BabyWeightToLenChartResponse;

  factory _BabyWeightToLenChartResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyWeightToLenChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  BabyWeightToLenChartResponseData get data =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyWeightToLenChartResponseCopyWith<_BabyWeightToLenChartResponse>
      get copyWith => throw _privateConstructorUsedError;
}

BabyWeightToLenChartResponseData _$BabyWeightToLenChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BabyWeightToLenChartResponseData.fromJson(json);
}

/// @nodoc
class _$BabyWeightToLenChartResponseDataTearOff {
  const _$BabyWeightToLenChartResponseDataTearOff();

  _BabyWeightToLenChartResponseData call(
      {required List<BabyWeightToLenChartData> data,
      required ChartWarningResponse? desc}) {
    return _BabyWeightToLenChartResponseData(
      data: data,
      desc: desc,
    );
  }

  BabyWeightToLenChartResponseData fromJson(Map<String, Object> json) {
    return BabyWeightToLenChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $BabyWeightToLenChartResponseData =
    _$BabyWeightToLenChartResponseDataTearOff();

/// @nodoc
mixin _$BabyWeightToLenChartResponseData {
  List<BabyWeightToLenChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyWeightToLenChartResponseDataCopyWith<BabyWeightToLenChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyWeightToLenChartResponseDataCopyWith<$Res> {
  factory $BabyWeightToLenChartResponseDataCopyWith(
          BabyWeightToLenChartResponseData value,
          $Res Function(BabyWeightToLenChartResponseData) then) =
      _$BabyWeightToLenChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<BabyWeightToLenChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$BabyWeightToLenChartResponseDataCopyWithImpl<$Res>
    implements $BabyWeightToLenChartResponseDataCopyWith<$Res> {
  _$BabyWeightToLenChartResponseDataCopyWithImpl(this._value, this._then);

  final BabyWeightToLenChartResponseData _value;
  // ignore: unused_field
  final $Res Function(BabyWeightToLenChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyWeightToLenChartData>,
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
abstract class _$BabyWeightToLenChartResponseDataCopyWith<$Res>
    implements $BabyWeightToLenChartResponseDataCopyWith<$Res> {
  factory _$BabyWeightToLenChartResponseDataCopyWith(
          _BabyWeightToLenChartResponseData value,
          $Res Function(_BabyWeightToLenChartResponseData) then) =
      __$BabyWeightToLenChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<BabyWeightToLenChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$BabyWeightToLenChartResponseDataCopyWithImpl<$Res>
    extends _$BabyWeightToLenChartResponseDataCopyWithImpl<$Res>
    implements _$BabyWeightToLenChartResponseDataCopyWith<$Res> {
  __$BabyWeightToLenChartResponseDataCopyWithImpl(
      _BabyWeightToLenChartResponseData _value,
      $Res Function(_BabyWeightToLenChartResponseData) _then)
      : super(_value, (v) => _then(v as _BabyWeightToLenChartResponseData));

  @override
  _BabyWeightToLenChartResponseData get _value =>
      super._value as _BabyWeightToLenChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_BabyWeightToLenChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyWeightToLenChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyWeightToLenChartResponseData
    implements _BabyWeightToLenChartResponseData {
  const _$_BabyWeightToLenChartResponseData(
      {required this.data, required this.desc});

  factory _$_BabyWeightToLenChartResponseData.fromJson(
          Map<String, dynamic> json) =>
      _$_$_BabyWeightToLenChartResponseDataFromJson(json);

  @override
  final List<BabyWeightToLenChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'BabyWeightToLenChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyWeightToLenChartResponseData &&
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
  _$BabyWeightToLenChartResponseDataCopyWith<_BabyWeightToLenChartResponseData>
      get copyWith => __$BabyWeightToLenChartResponseDataCopyWithImpl<
          _BabyWeightToLenChartResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyWeightToLenChartResponseDataToJson(this);
  }
}

abstract class _BabyWeightToLenChartResponseData
    implements BabyWeightToLenChartResponseData {
  const factory _BabyWeightToLenChartResponseData(
          {required List<BabyWeightToLenChartData> data,
          required ChartWarningResponse? desc}) =
      _$_BabyWeightToLenChartResponseData;

  factory _BabyWeightToLenChartResponseData.fromJson(
      Map<String, dynamic> json) = _$_BabyWeightToLenChartResponseData.fromJson;

  @override
  List<BabyWeightToLenChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyWeightToLenChartResponseDataCopyWith<_BabyWeightToLenChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

BabyHeadCircumChartResponse _$BabyHeadCircumChartResponseFromJson(
    Map<String, dynamic> json) {
  return _BabyHeadCircumChartResponse.fromJson(json);
}

/// @nodoc
class _$BabyHeadCircumChartResponseTearOff {
  const _$BabyHeadCircumChartResponseTearOff();

  _BabyHeadCircumChartResponse call(
      {required String message,
      required String status,
      required int code,
      required BabyHeadCircumChartResponseData data}) {
    return _BabyHeadCircumChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BabyHeadCircumChartResponse fromJson(Map<String, Object> json) {
    return BabyHeadCircumChartResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyHeadCircumChartResponse = _$BabyHeadCircumChartResponseTearOff();

/// @nodoc
mixin _$BabyHeadCircumChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  BabyHeadCircumChartResponseData get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyHeadCircumChartResponseCopyWith<BabyHeadCircumChartResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyHeadCircumChartResponseCopyWith<$Res> {
  factory $BabyHeadCircumChartResponseCopyWith(
          BabyHeadCircumChartResponse value,
          $Res Function(BabyHeadCircumChartResponse) then) =
      _$BabyHeadCircumChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      String status,
      int code,
      BabyHeadCircumChartResponseData data});

  $BabyHeadCircumChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BabyHeadCircumChartResponseCopyWithImpl<$Res>
    implements $BabyHeadCircumChartResponseCopyWith<$Res> {
  _$BabyHeadCircumChartResponseCopyWithImpl(this._value, this._then);

  final BabyHeadCircumChartResponse _value;
  // ignore: unused_field
  final $Res Function(BabyHeadCircumChartResponse) _then;

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
              as BabyHeadCircumChartResponseData,
    ));
  }

  @override
  $BabyHeadCircumChartResponseDataCopyWith<$Res> get data {
    return $BabyHeadCircumChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$BabyHeadCircumChartResponseCopyWith<$Res>
    implements $BabyHeadCircumChartResponseCopyWith<$Res> {
  factory _$BabyHeadCircumChartResponseCopyWith(
          _BabyHeadCircumChartResponse value,
          $Res Function(_BabyHeadCircumChartResponse) then) =
      __$BabyHeadCircumChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      String status,
      int code,
      BabyHeadCircumChartResponseData data});

  @override
  $BabyHeadCircumChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$BabyHeadCircumChartResponseCopyWithImpl<$Res>
    extends _$BabyHeadCircumChartResponseCopyWithImpl<$Res>
    implements _$BabyHeadCircumChartResponseCopyWith<$Res> {
  __$BabyHeadCircumChartResponseCopyWithImpl(
      _BabyHeadCircumChartResponse _value,
      $Res Function(_BabyHeadCircumChartResponse) _then)
      : super(_value, (v) => _then(v as _BabyHeadCircumChartResponse));

  @override
  _BabyHeadCircumChartResponse get _value =>
      super._value as _BabyHeadCircumChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BabyHeadCircumChartResponse(
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
              as BabyHeadCircumChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyHeadCircumChartResponse implements _BabyHeadCircumChartResponse {
  const _$_BabyHeadCircumChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BabyHeadCircumChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyHeadCircumChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final BabyHeadCircumChartResponseData data;

  @override
  String toString() {
    return 'BabyHeadCircumChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyHeadCircumChartResponse &&
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
  _$BabyHeadCircumChartResponseCopyWith<_BabyHeadCircumChartResponse>
      get copyWith => __$BabyHeadCircumChartResponseCopyWithImpl<
          _BabyHeadCircumChartResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyHeadCircumChartResponseToJson(this);
  }
}

abstract class _BabyHeadCircumChartResponse
    implements BabyHeadCircumChartResponse {
  const factory _BabyHeadCircumChartResponse(
          {required String message,
          required String status,
          required int code,
          required BabyHeadCircumChartResponseData data}) =
      _$_BabyHeadCircumChartResponse;

  factory _BabyHeadCircumChartResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyHeadCircumChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  BabyHeadCircumChartResponseData get data =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyHeadCircumChartResponseCopyWith<_BabyHeadCircumChartResponse>
      get copyWith => throw _privateConstructorUsedError;
}

BabyHeadCircumChartResponseData _$BabyHeadCircumChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BabyHeadCircumChartResponseData.fromJson(json);
}

/// @nodoc
class _$BabyHeadCircumChartResponseDataTearOff {
  const _$BabyHeadCircumChartResponseDataTearOff();

  _BabyHeadCircumChartResponseData call(
      {required List<BabyHeadCircumChartData> data,
      required ChartWarningResponse? desc}) {
    return _BabyHeadCircumChartResponseData(
      data: data,
      desc: desc,
    );
  }

  BabyHeadCircumChartResponseData fromJson(Map<String, Object> json) {
    return BabyHeadCircumChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $BabyHeadCircumChartResponseData =
    _$BabyHeadCircumChartResponseDataTearOff();

/// @nodoc
mixin _$BabyHeadCircumChartResponseData {
  List<BabyHeadCircumChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyHeadCircumChartResponseDataCopyWith<BabyHeadCircumChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyHeadCircumChartResponseDataCopyWith<$Res> {
  factory $BabyHeadCircumChartResponseDataCopyWith(
          BabyHeadCircumChartResponseData value,
          $Res Function(BabyHeadCircumChartResponseData) then) =
      _$BabyHeadCircumChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<BabyHeadCircumChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$BabyHeadCircumChartResponseDataCopyWithImpl<$Res>
    implements $BabyHeadCircumChartResponseDataCopyWith<$Res> {
  _$BabyHeadCircumChartResponseDataCopyWithImpl(this._value, this._then);

  final BabyHeadCircumChartResponseData _value;
  // ignore: unused_field
  final $Res Function(BabyHeadCircumChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyHeadCircumChartData>,
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
abstract class _$BabyHeadCircumChartResponseDataCopyWith<$Res>
    implements $BabyHeadCircumChartResponseDataCopyWith<$Res> {
  factory _$BabyHeadCircumChartResponseDataCopyWith(
          _BabyHeadCircumChartResponseData value,
          $Res Function(_BabyHeadCircumChartResponseData) then) =
      __$BabyHeadCircumChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<BabyHeadCircumChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$BabyHeadCircumChartResponseDataCopyWithImpl<$Res>
    extends _$BabyHeadCircumChartResponseDataCopyWithImpl<$Res>
    implements _$BabyHeadCircumChartResponseDataCopyWith<$Res> {
  __$BabyHeadCircumChartResponseDataCopyWithImpl(
      _BabyHeadCircumChartResponseData _value,
      $Res Function(_BabyHeadCircumChartResponseData) _then)
      : super(_value, (v) => _then(v as _BabyHeadCircumChartResponseData));

  @override
  _BabyHeadCircumChartResponseData get _value =>
      super._value as _BabyHeadCircumChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_BabyHeadCircumChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyHeadCircumChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyHeadCircumChartResponseData
    implements _BabyHeadCircumChartResponseData {
  const _$_BabyHeadCircumChartResponseData(
      {required this.data, required this.desc});

  factory _$_BabyHeadCircumChartResponseData.fromJson(
          Map<String, dynamic> json) =>
      _$_$_BabyHeadCircumChartResponseDataFromJson(json);

  @override
  final List<BabyHeadCircumChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'BabyHeadCircumChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyHeadCircumChartResponseData &&
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
  _$BabyHeadCircumChartResponseDataCopyWith<_BabyHeadCircumChartResponseData>
      get copyWith => __$BabyHeadCircumChartResponseDataCopyWithImpl<
          _BabyHeadCircumChartResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyHeadCircumChartResponseDataToJson(this);
  }
}

abstract class _BabyHeadCircumChartResponseData
    implements BabyHeadCircumChartResponseData {
  const factory _BabyHeadCircumChartResponseData(
          {required List<BabyHeadCircumChartData> data,
          required ChartWarningResponse? desc}) =
      _$_BabyHeadCircumChartResponseData;

  factory _BabyHeadCircumChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_BabyHeadCircumChartResponseData.fromJson;

  @override
  List<BabyHeadCircumChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyHeadCircumChartResponseDataCopyWith<_BabyHeadCircumChartResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

BabyBmiChartResponse _$BabyBmiChartResponseFromJson(Map<String, dynamic> json) {
  return _BabyBmiChartResponse.fromJson(json);
}

/// @nodoc
class _$BabyBmiChartResponseTearOff {
  const _$BabyBmiChartResponseTearOff();

  _BabyBmiChartResponse call(
      {required String message,
      required String status,
      required int code,
      required BabyBmiChartResponseData data}) {
    return _BabyBmiChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BabyBmiChartResponse fromJson(Map<String, Object> json) {
    return BabyBmiChartResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyBmiChartResponse = _$BabyBmiChartResponseTearOff();

/// @nodoc
mixin _$BabyBmiChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  BabyBmiChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyBmiChartResponseCopyWith<BabyBmiChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyBmiChartResponseCopyWith<$Res> {
  factory $BabyBmiChartResponseCopyWith(BabyBmiChartResponse value,
          $Res Function(BabyBmiChartResponse) then) =
      _$BabyBmiChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message, String status, int code, BabyBmiChartResponseData data});

  $BabyBmiChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BabyBmiChartResponseCopyWithImpl<$Res>
    implements $BabyBmiChartResponseCopyWith<$Res> {
  _$BabyBmiChartResponseCopyWithImpl(this._value, this._then);

  final BabyBmiChartResponse _value;
  // ignore: unused_field
  final $Res Function(BabyBmiChartResponse) _then;

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
              as BabyBmiChartResponseData,
    ));
  }

  @override
  $BabyBmiChartResponseDataCopyWith<$Res> get data {
    return $BabyBmiChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$BabyBmiChartResponseCopyWith<$Res>
    implements $BabyBmiChartResponseCopyWith<$Res> {
  factory _$BabyBmiChartResponseCopyWith(_BabyBmiChartResponse value,
          $Res Function(_BabyBmiChartResponse) then) =
      __$BabyBmiChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message, String status, int code, BabyBmiChartResponseData data});

  @override
  $BabyBmiChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$BabyBmiChartResponseCopyWithImpl<$Res>
    extends _$BabyBmiChartResponseCopyWithImpl<$Res>
    implements _$BabyBmiChartResponseCopyWith<$Res> {
  __$BabyBmiChartResponseCopyWithImpl(
      _BabyBmiChartResponse _value, $Res Function(_BabyBmiChartResponse) _then)
      : super(_value, (v) => _then(v as _BabyBmiChartResponse));

  @override
  _BabyBmiChartResponse get _value => super._value as _BabyBmiChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BabyBmiChartResponse(
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
              as BabyBmiChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyBmiChartResponse implements _BabyBmiChartResponse {
  const _$_BabyBmiChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BabyBmiChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyBmiChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final BabyBmiChartResponseData data;

  @override
  String toString() {
    return 'BabyBmiChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyBmiChartResponse &&
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
  _$BabyBmiChartResponseCopyWith<_BabyBmiChartResponse> get copyWith =>
      __$BabyBmiChartResponseCopyWithImpl<_BabyBmiChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyBmiChartResponseToJson(this);
  }
}

abstract class _BabyBmiChartResponse implements BabyBmiChartResponse {
  const factory _BabyBmiChartResponse(
      {required String message,
      required String status,
      required int code,
      required BabyBmiChartResponseData data}) = _$_BabyBmiChartResponse;

  factory _BabyBmiChartResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyBmiChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  BabyBmiChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyBmiChartResponseCopyWith<_BabyBmiChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyBmiChartResponseData _$BabyBmiChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BabyBmiChartResponseData.fromJson(json);
}

/// @nodoc
class _$BabyBmiChartResponseDataTearOff {
  const _$BabyBmiChartResponseDataTearOff();

  _BabyBmiChartResponseData call(
      {required List<BabyBmiChartData> data,
      required ChartWarningResponse? desc}) {
    return _BabyBmiChartResponseData(
      data: data,
      desc: desc,
    );
  }

  BabyBmiChartResponseData fromJson(Map<String, Object> json) {
    return BabyBmiChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $BabyBmiChartResponseData = _$BabyBmiChartResponseDataTearOff();

/// @nodoc
mixin _$BabyBmiChartResponseData {
  List<BabyBmiChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyBmiChartResponseDataCopyWith<BabyBmiChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyBmiChartResponseDataCopyWith<$Res> {
  factory $BabyBmiChartResponseDataCopyWith(BabyBmiChartResponseData value,
          $Res Function(BabyBmiChartResponseData) then) =
      _$BabyBmiChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<BabyBmiChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$BabyBmiChartResponseDataCopyWithImpl<$Res>
    implements $BabyBmiChartResponseDataCopyWith<$Res> {
  _$BabyBmiChartResponseDataCopyWithImpl(this._value, this._then);

  final BabyBmiChartResponseData _value;
  // ignore: unused_field
  final $Res Function(BabyBmiChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyBmiChartData>,
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
abstract class _$BabyBmiChartResponseDataCopyWith<$Res>
    implements $BabyBmiChartResponseDataCopyWith<$Res> {
  factory _$BabyBmiChartResponseDataCopyWith(_BabyBmiChartResponseData value,
          $Res Function(_BabyBmiChartResponseData) then) =
      __$BabyBmiChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<BabyBmiChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$BabyBmiChartResponseDataCopyWithImpl<$Res>
    extends _$BabyBmiChartResponseDataCopyWithImpl<$Res>
    implements _$BabyBmiChartResponseDataCopyWith<$Res> {
  __$BabyBmiChartResponseDataCopyWithImpl(_BabyBmiChartResponseData _value,
      $Res Function(_BabyBmiChartResponseData) _then)
      : super(_value, (v) => _then(v as _BabyBmiChartResponseData));

  @override
  _BabyBmiChartResponseData get _value =>
      super._value as _BabyBmiChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_BabyBmiChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyBmiChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyBmiChartResponseData implements _BabyBmiChartResponseData {
  const _$_BabyBmiChartResponseData({required this.data, required this.desc});

  factory _$_BabyBmiChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyBmiChartResponseDataFromJson(json);

  @override
  final List<BabyBmiChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'BabyBmiChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyBmiChartResponseData &&
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
  _$BabyBmiChartResponseDataCopyWith<_BabyBmiChartResponseData> get copyWith =>
      __$BabyBmiChartResponseDataCopyWithImpl<_BabyBmiChartResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyBmiChartResponseDataToJson(this);
  }
}

abstract class _BabyBmiChartResponseData implements BabyBmiChartResponseData {
  const factory _BabyBmiChartResponseData(
      {required List<BabyBmiChartData> data,
      required ChartWarningResponse? desc}) = _$_BabyBmiChartResponseData;

  factory _BabyBmiChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_BabyBmiChartResponseData.fromJson;

  @override
  List<BabyBmiChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyBmiChartResponseDataCopyWith<_BabyBmiChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyDevChartResponse _$BabyDevChartResponseFromJson(Map<String, dynamic> json) {
  return _BabyDevChartResponse.fromJson(json);
}

/// @nodoc
class _$BabyDevChartResponseTearOff {
  const _$BabyDevChartResponseTearOff();

  _BabyDevChartResponse call(
      {required String message,
      required String status,
      required int code,
      required BabyDevChartResponseData data}) {
    return _BabyDevChartResponse(
      message: message,
      status: status,
      code: code,
      data: data,
    );
  }

  BabyDevChartResponse fromJson(Map<String, Object> json) {
    return BabyDevChartResponse.fromJson(json);
  }
}

/// @nodoc
const $BabyDevChartResponse = _$BabyDevChartResponseTearOff();

/// @nodoc
mixin _$BabyDevChartResponse {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  BabyDevChartResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyDevChartResponseCopyWith<BabyDevChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyDevChartResponseCopyWith<$Res> {
  factory $BabyDevChartResponseCopyWith(BabyDevChartResponse value,
          $Res Function(BabyDevChartResponse) then) =
      _$BabyDevChartResponseCopyWithImpl<$Res>;
  $Res call(
      {String message, String status, int code, BabyDevChartResponseData data});

  $BabyDevChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BabyDevChartResponseCopyWithImpl<$Res>
    implements $BabyDevChartResponseCopyWith<$Res> {
  _$BabyDevChartResponseCopyWithImpl(this._value, this._then);

  final BabyDevChartResponse _value;
  // ignore: unused_field
  final $Res Function(BabyDevChartResponse) _then;

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
              as BabyDevChartResponseData,
    ));
  }

  @override
  $BabyDevChartResponseDataCopyWith<$Res> get data {
    return $BabyDevChartResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$BabyDevChartResponseCopyWith<$Res>
    implements $BabyDevChartResponseCopyWith<$Res> {
  factory _$BabyDevChartResponseCopyWith(_BabyDevChartResponse value,
          $Res Function(_BabyDevChartResponse) then) =
      __$BabyDevChartResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message, String status, int code, BabyDevChartResponseData data});

  @override
  $BabyDevChartResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$BabyDevChartResponseCopyWithImpl<$Res>
    extends _$BabyDevChartResponseCopyWithImpl<$Res>
    implements _$BabyDevChartResponseCopyWith<$Res> {
  __$BabyDevChartResponseCopyWithImpl(
      _BabyDevChartResponse _value, $Res Function(_BabyDevChartResponse) _then)
      : super(_value, (v) => _then(v as _BabyDevChartResponse));

  @override
  _BabyDevChartResponse get _value => super._value as _BabyDevChartResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_BabyDevChartResponse(
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
              as BabyDevChartResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyDevChartResponse implements _BabyDevChartResponse {
  const _$_BabyDevChartResponse(
      {required this.message,
      required this.status,
      required this.code,
      required this.data});

  factory _$_BabyDevChartResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyDevChartResponseFromJson(json);

  @override
  final String message;
  @override
  final String status;
  @override
  final int code;
  @override
  final BabyDevChartResponseData data;

  @override
  String toString() {
    return 'BabyDevChartResponse(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyDevChartResponse &&
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
  _$BabyDevChartResponseCopyWith<_BabyDevChartResponse> get copyWith =>
      __$BabyDevChartResponseCopyWithImpl<_BabyDevChartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyDevChartResponseToJson(this);
  }
}

abstract class _BabyDevChartResponse implements BabyDevChartResponse {
  const factory _BabyDevChartResponse(
      {required String message,
      required String status,
      required int code,
      required BabyDevChartResponseData data}) = _$_BabyDevChartResponse;

  factory _BabyDevChartResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyDevChartResponse.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get code => throw _privateConstructorUsedError;
  @override
  BabyDevChartResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyDevChartResponseCopyWith<_BabyDevChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyDevChartResponseData _$BabyDevChartResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BabyDevChartResponseData.fromJson(json);
}

/// @nodoc
class _$BabyDevChartResponseDataTearOff {
  const _$BabyDevChartResponseDataTearOff();

  _BabyDevChartResponseData call(
      {required List<BabyDevChartData> data,
      required ChartWarningResponse? desc}) {
    return _BabyDevChartResponseData(
      data: data,
      desc: desc,
    );
  }

  BabyDevChartResponseData fromJson(Map<String, Object> json) {
    return BabyDevChartResponseData.fromJson(json);
  }
}

/// @nodoc
const $BabyDevChartResponseData = _$BabyDevChartResponseDataTearOff();

/// @nodoc
mixin _$BabyDevChartResponseData {
  List<BabyDevChartData> get data => throw _privateConstructorUsedError;
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyDevChartResponseDataCopyWith<BabyDevChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyDevChartResponseDataCopyWith<$Res> {
  factory $BabyDevChartResponseDataCopyWith(BabyDevChartResponseData value,
          $Res Function(BabyDevChartResponseData) then) =
      _$BabyDevChartResponseDataCopyWithImpl<$Res>;
  $Res call({List<BabyDevChartData> data, ChartWarningResponse? desc});

  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class _$BabyDevChartResponseDataCopyWithImpl<$Res>
    implements $BabyDevChartResponseDataCopyWith<$Res> {
  _$BabyDevChartResponseDataCopyWithImpl(this._value, this._then);

  final BabyDevChartResponseData _value;
  // ignore: unused_field
  final $Res Function(BabyDevChartResponseData) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyDevChartData>,
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
abstract class _$BabyDevChartResponseDataCopyWith<$Res>
    implements $BabyDevChartResponseDataCopyWith<$Res> {
  factory _$BabyDevChartResponseDataCopyWith(_BabyDevChartResponseData value,
          $Res Function(_BabyDevChartResponseData) then) =
      __$BabyDevChartResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({List<BabyDevChartData> data, ChartWarningResponse? desc});

  @override
  $ChartWarningResponseCopyWith<$Res>? get desc;
}

/// @nodoc
class __$BabyDevChartResponseDataCopyWithImpl<$Res>
    extends _$BabyDevChartResponseDataCopyWithImpl<$Res>
    implements _$BabyDevChartResponseDataCopyWith<$Res> {
  __$BabyDevChartResponseDataCopyWithImpl(_BabyDevChartResponseData _value,
      $Res Function(_BabyDevChartResponseData) _then)
      : super(_value, (v) => _then(v as _BabyDevChartResponseData));

  @override
  _BabyDevChartResponseData get _value =>
      super._value as _BabyDevChartResponseData;

  @override
  $Res call({
    Object? data = freezed,
    Object? desc = freezed,
  }) {
    return _then(_BabyDevChartResponseData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BabyDevChartData>,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as ChartWarningResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BabyDevChartResponseData implements _BabyDevChartResponseData {
  const _$_BabyDevChartResponseData({required this.data, required this.desc});

  factory _$_BabyDevChartResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_BabyDevChartResponseDataFromJson(json);

  @override
  final List<BabyDevChartData> data;
  @override
  final ChartWarningResponse? desc;

  @override
  String toString() {
    return 'BabyDevChartResponseData(data: $data, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BabyDevChartResponseData &&
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
  _$BabyDevChartResponseDataCopyWith<_BabyDevChartResponseData> get copyWith =>
      __$BabyDevChartResponseDataCopyWithImpl<_BabyDevChartResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BabyDevChartResponseDataToJson(this);
  }
}

abstract class _BabyDevChartResponseData implements BabyDevChartResponseData {
  const factory _BabyDevChartResponseData(
      {required List<BabyDevChartData> data,
      required ChartWarningResponse? desc}) = _$_BabyDevChartResponseData;

  factory _BabyDevChartResponseData.fromJson(Map<String, dynamic> json) =
      _$_BabyDevChartResponseData.fromJson;

  @override
  List<BabyDevChartData> get data => throw _privateConstructorUsedError;
  @override
  ChartWarningResponse? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BabyDevChartResponseDataCopyWith<_BabyDevChartResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}
