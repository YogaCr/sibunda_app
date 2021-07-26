// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_tips_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TipsResponse _$TipsResponseFromJson(Map<String, dynamic> json) {
  return _TipsResponse.fromJson(json);
}

/// @nodoc
class _$TipsResponseTearOff {
  const _$TipsResponseTearOff();

  _TipsResponse call(
      {required int code,
      required String message,
      required String status,
      required List<TipsDataResponse> data}) {
    return _TipsResponse(
      code: code,
      message: message,
      status: status,
      data: data,
    );
  }

  TipsResponse fromJson(Map<String, Object> json) {
    return TipsResponse.fromJson(json);
  }
}

/// @nodoc
const $TipsResponse = _$TipsResponseTearOff();

/// @nodoc
mixin _$TipsResponse {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<TipsDataResponse> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipsResponseCopyWith<TipsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsResponseCopyWith<$Res> {
  factory $TipsResponseCopyWith(
          TipsResponse value, $Res Function(TipsResponse) then) =
      _$TipsResponseCopyWithImpl<$Res>;
  $Res call(
      {int code, String message, String status, List<TipsDataResponse> data});
}

/// @nodoc
class _$TipsResponseCopyWithImpl<$Res> implements $TipsResponseCopyWith<$Res> {
  _$TipsResponseCopyWithImpl(this._value, this._then);

  final TipsResponse _value;
  // ignore: unused_field
  final $Res Function(TipsResponse) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
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
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TipsDataResponse>,
    ));
  }
}

/// @nodoc
abstract class _$TipsResponseCopyWith<$Res>
    implements $TipsResponseCopyWith<$Res> {
  factory _$TipsResponseCopyWith(
          _TipsResponse value, $Res Function(_TipsResponse) then) =
      __$TipsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int code, String message, String status, List<TipsDataResponse> data});
}

/// @nodoc
class __$TipsResponseCopyWithImpl<$Res> extends _$TipsResponseCopyWithImpl<$Res>
    implements _$TipsResponseCopyWith<$Res> {
  __$TipsResponseCopyWithImpl(
      _TipsResponse _value, $Res Function(_TipsResponse) _then)
      : super(_value, (v) => _then(v as _TipsResponse));

  @override
  _TipsResponse get _value => super._value as _TipsResponse;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_TipsResponse(
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
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TipsDataResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TipsResponse implements _TipsResponse {
  const _$_TipsResponse(
      {required this.code,
      required this.message,
      required this.status,
      required this.data});

  factory _$_TipsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_TipsResponseFromJson(json);

  @override
  final int code;
  @override
  final String message;
  @override
  final String status;
  @override
  final List<TipsDataResponse> data;

  @override
  String toString() {
    return 'TipsResponse(code: $code, message: $message, status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TipsResponse &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$TipsResponseCopyWith<_TipsResponse> get copyWith =>
      __$TipsResponseCopyWithImpl<_TipsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TipsResponseToJson(this);
  }
}

abstract class _TipsResponse implements TipsResponse {
  const factory _TipsResponse(
      {required int code,
      required String message,
      required String status,
      required List<TipsDataResponse> data}) = _$_TipsResponse;

  factory _TipsResponse.fromJson(Map<String, dynamic> json) =
      _$_TipsResponse.fromJson;

  @override
  int get code => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  List<TipsDataResponse> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TipsResponseCopyWith<_TipsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

TipsDataResponse _$TipsDataResponseFromJson(Map<String, dynamic> json) {
  return _TipsDataResponse.fromJson(json);
}

/// @nodoc
class _$TipsDataResponseTearOff {
  const _$TipsDataResponseTearOff();

  _TipsDataResponse call(
      {required int id,
      required String? img_url,
      required String desc,
      required int? user_id,
      required TipsCategoryResponse tips_category,
      required String content,
      required String created_at,
      required String updated_at}) {
    return _TipsDataResponse(
      id: id,
      img_url: img_url,
      desc: desc,
      user_id: user_id,
      tips_category: tips_category,
      content: content,
      created_at: created_at,
      updated_at: updated_at,
    );
  }

  TipsDataResponse fromJson(Map<String, Object> json) {
    return TipsDataResponse.fromJson(json);
  }
}

/// @nodoc
const $TipsDataResponse = _$TipsDataResponseTearOff();

/// @nodoc
mixin _$TipsDataResponse {
  int get id => throw _privateConstructorUsedError;
  String? get img_url => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  TipsCategoryResponse get tips_category => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipsDataResponseCopyWith<TipsDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsDataResponseCopyWith<$Res> {
  factory $TipsDataResponseCopyWith(
          TipsDataResponse value, $Res Function(TipsDataResponse) then) =
      _$TipsDataResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? img_url,
      String desc,
      int? user_id,
      TipsCategoryResponse tips_category,
      String content,
      String created_at,
      String updated_at});

  $TipsCategoryResponseCopyWith<$Res> get tips_category;
}

/// @nodoc
class _$TipsDataResponseCopyWithImpl<$Res>
    implements $TipsDataResponseCopyWith<$Res> {
  _$TipsDataResponseCopyWithImpl(this._value, this._then);

  final TipsDataResponse _value;
  // ignore: unused_field
  final $Res Function(TipsDataResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? img_url = freezed,
    Object? desc = freezed,
    Object? user_id = freezed,
    Object? tips_category = freezed,
    Object? content = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      img_url: img_url == freezed
          ? _value.img_url
          : img_url // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      tips_category: tips_category == freezed
          ? _value.tips_category
          : tips_category // ignore: cast_nullable_to_non_nullable
              as TipsCategoryResponse,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $TipsCategoryResponseCopyWith<$Res> get tips_category {
    return $TipsCategoryResponseCopyWith<$Res>(_value.tips_category, (value) {
      return _then(_value.copyWith(tips_category: value));
    });
  }
}

/// @nodoc
abstract class _$TipsDataResponseCopyWith<$Res>
    implements $TipsDataResponseCopyWith<$Res> {
  factory _$TipsDataResponseCopyWith(
          _TipsDataResponse value, $Res Function(_TipsDataResponse) then) =
      __$TipsDataResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? img_url,
      String desc,
      int? user_id,
      TipsCategoryResponse tips_category,
      String content,
      String created_at,
      String updated_at});

  @override
  $TipsCategoryResponseCopyWith<$Res> get tips_category;
}

/// @nodoc
class __$TipsDataResponseCopyWithImpl<$Res>
    extends _$TipsDataResponseCopyWithImpl<$Res>
    implements _$TipsDataResponseCopyWith<$Res> {
  __$TipsDataResponseCopyWithImpl(
      _TipsDataResponse _value, $Res Function(_TipsDataResponse) _then)
      : super(_value, (v) => _then(v as _TipsDataResponse));

  @override
  _TipsDataResponse get _value => super._value as _TipsDataResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? img_url = freezed,
    Object? desc = freezed,
    Object? user_id = freezed,
    Object? tips_category = freezed,
    Object? content = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_TipsDataResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      img_url: img_url == freezed
          ? _value.img_url
          : img_url // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      tips_category: tips_category == freezed
          ? _value.tips_category
          : tips_category // ignore: cast_nullable_to_non_nullable
              as TipsCategoryResponse,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TipsDataResponse implements _TipsDataResponse {
  const _$_TipsDataResponse(
      {required this.id,
      required this.img_url,
      required this.desc,
      required this.user_id,
      required this.tips_category,
      required this.content,
      required this.created_at,
      required this.updated_at});

  factory _$_TipsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_TipsDataResponseFromJson(json);

  @override
  final int id;
  @override
  final String? img_url;
  @override
  final String desc;
  @override
  final int? user_id;
  @override
  final TipsCategoryResponse tips_category;
  @override
  final String content;
  @override
  final String created_at;
  @override
  final String updated_at;

  @override
  String toString() {
    return 'TipsDataResponse(id: $id, img_url: $img_url, desc: $desc, user_id: $user_id, tips_category: $tips_category, content: $content, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TipsDataResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.img_url, img_url) ||
                const DeepCollectionEquality()
                    .equals(other.img_url, img_url)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(other.user_id, user_id) ||
                const DeepCollectionEquality()
                    .equals(other.user_id, user_id)) &&
            (identical(other.tips_category, tips_category) ||
                const DeepCollectionEquality()
                    .equals(other.tips_category, tips_category)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(img_url) ^
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(user_id) ^
      const DeepCollectionEquality().hash(tips_category) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(updated_at);

  @JsonKey(ignore: true)
  @override
  _$TipsDataResponseCopyWith<_TipsDataResponse> get copyWith =>
      __$TipsDataResponseCopyWithImpl<_TipsDataResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TipsDataResponseToJson(this);
  }
}

abstract class _TipsDataResponse implements TipsDataResponse {
  const factory _TipsDataResponse(
      {required int id,
      required String? img_url,
      required String desc,
      required int? user_id,
      required TipsCategoryResponse tips_category,
      required String content,
      required String created_at,
      required String updated_at}) = _$_TipsDataResponse;

  factory _TipsDataResponse.fromJson(Map<String, dynamic> json) =
      _$_TipsDataResponse.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get img_url => throw _privateConstructorUsedError;
  @override
  String get desc => throw _privateConstructorUsedError;
  @override
  int? get user_id => throw _privateConstructorUsedError;
  @override
  TipsCategoryResponse get tips_category => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  String get created_at => throw _privateConstructorUsedError;
  @override
  String get updated_at => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TipsDataResponseCopyWith<_TipsDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

TipsCategoryResponse _$TipsCategoryResponseFromJson(Map<String, dynamic> json) {
  return _TipsCategoryResponse.fromJson(json);
}

/// @nodoc
class _$TipsCategoryResponseTearOff {
  const _$TipsCategoryResponseTearOff();

  _TipsCategoryResponse call({required int id, required String name}) {
    return _TipsCategoryResponse(
      id: id,
      name: name,
    );
  }

  TipsCategoryResponse fromJson(Map<String, Object> json) {
    return TipsCategoryResponse.fromJson(json);
  }
}

/// @nodoc
const $TipsCategoryResponse = _$TipsCategoryResponseTearOff();

/// @nodoc
mixin _$TipsCategoryResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipsCategoryResponseCopyWith<TipsCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsCategoryResponseCopyWith<$Res> {
  factory $TipsCategoryResponseCopyWith(TipsCategoryResponse value,
          $Res Function(TipsCategoryResponse) then) =
      _$TipsCategoryResponseCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$TipsCategoryResponseCopyWithImpl<$Res>
    implements $TipsCategoryResponseCopyWith<$Res> {
  _$TipsCategoryResponseCopyWithImpl(this._value, this._then);

  final TipsCategoryResponse _value;
  // ignore: unused_field
  final $Res Function(TipsCategoryResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TipsCategoryResponseCopyWith<$Res>
    implements $TipsCategoryResponseCopyWith<$Res> {
  factory _$TipsCategoryResponseCopyWith(_TipsCategoryResponse value,
          $Res Function(_TipsCategoryResponse) then) =
      __$TipsCategoryResponseCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$TipsCategoryResponseCopyWithImpl<$Res>
    extends _$TipsCategoryResponseCopyWithImpl<$Res>
    implements _$TipsCategoryResponseCopyWith<$Res> {
  __$TipsCategoryResponseCopyWithImpl(
      _TipsCategoryResponse _value, $Res Function(_TipsCategoryResponse) _then)
      : super(_value, (v) => _then(v as _TipsCategoryResponse));

  @override
  _TipsCategoryResponse get _value => super._value as _TipsCategoryResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_TipsCategoryResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TipsCategoryResponse implements _TipsCategoryResponse {
  const _$_TipsCategoryResponse({required this.id, required this.name});

  factory _$_TipsCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_TipsCategoryResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'TipsCategoryResponse(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TipsCategoryResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$TipsCategoryResponseCopyWith<_TipsCategoryResponse> get copyWith =>
      __$TipsCategoryResponseCopyWithImpl<_TipsCategoryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TipsCategoryResponseToJson(this);
  }
}

abstract class _TipsCategoryResponse implements TipsCategoryResponse {
  const factory _TipsCategoryResponse({required int id, required String name}) =
      _$_TipsCategoryResponse;

  factory _TipsCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$_TipsCategoryResponse.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TipsCategoryResponseCopyWith<_TipsCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
