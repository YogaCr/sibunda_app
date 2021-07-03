import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_overview_api_model.g.dart';

@JsonSerializable()
class BabyHomeResponse {
  final int code;
  final String message;
  final String status;
  final List<BabyHomeChildResponse> data;

  BabyHomeResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory BabyHomeResponse.fromJson(Map<String, dynamic> map) => _$BabyHomeResponseFromJson(map);
}

@JsonSerializable()
class BabyHomeChildResponse {
  final int id; // child id
  @JsonKey(name: Const.KEY_NAME_INDO)
  final String name;
  final List<BabyHomeChildYearFormResponse> years;

  BabyHomeChildResponse({
    required this.id,
    required this.name,
    required this.years,
  });

  factory BabyHomeChildResponse.fromJson(Map<String, dynamic> map) => _$BabyHomeChildResponseFromJson(map);
}

@JsonSerializable()
class BabyHomeChildYearFormResponse {
  final int id;
  final int year;
  @JsonKey(name: Const.KEY_BABY_ID)
  final int childId;

  BabyHomeChildYearFormResponse({
    required this.id,
    required this.year,
    required this.childId,
  });

  factory BabyHomeChildYearFormResponse.fromJson(Map<String, dynamic> map) => _$BabyHomeChildYearFormResponseFromJson(map);
}