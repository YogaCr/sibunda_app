import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_overview_api_model.g.dart';


//=========== Response ===========
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
  Map<String, dynamic> toJson() => _$BabyHomeResponseToJson(this);
}

@JsonSerializable()
class BabyHomeChildResponse {
  final int id; // child id
  final String nik; // child id
  @JsonKey(name: Const.KEY_NAME_INDO)
  final String name;
  final int anak_ke;
  final String age;
  final List<BabyHomeChildYearFormResponse> years;

  BabyHomeChildResponse({
    required this.id,
    required this.nik,
    required this.name,
    required this.anak_ke,
    required this.age,
    required this.years,
  });

  factory BabyHomeChildResponse.fromJson(Map<String, dynamic> map) => _$BabyHomeChildResponseFromJson(map);
  Map<String, dynamic> toJson() => _$BabyHomeChildResponseToJson(this);
}

@JsonSerializable()
class BabyHomeChildYearFormResponse {
  final int id;
  final int year;
  @JsonKey(name: Const.KEY_BABY_ID)
  final int childId;
  final String img_url;

  BabyHomeChildYearFormResponse({
    required this.id,
    required this.year,
    required this.childId,
    required this.img_url,
  });

  factory BabyHomeChildYearFormResponse.fromJson(Map<String, dynamic> map) => _$BabyHomeChildYearFormResponseFromJson(map);
  Map<String, dynamic> toJson() => _$BabyHomeChildYearFormResponseToJson(this);
}