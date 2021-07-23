import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_overview_api_model.g.dart';

@JsonSerializable()
class PregnancyHomeResponse {
  final String message;
  final String status;
  final int code;
  final List<PregnancyHomeBabyResponse> data;

  PregnancyHomeResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory PregnancyHomeResponse.fromJson(Map<String, dynamic> map) => _$PregnancyHomeResponseFromJson(map);
}

@JsonSerializable()
class PregnancyHomeBabyResponse {
  @JsonKey(name: Const.KEY_ID)
  final int babyId;
  @JsonKey(name: Const.KEY_NAME_INDO)
  final String name;
  @JsonKey(name: Const.KEY_CHILD_ORDER)
  final int? childOrder;
  final int week;
  @JsonKey(name: Const.KEY_REM_DAYS)
  final int remainingDays;
  @JsonKey(name: Const.KEY_FOOD_RECOM)
  final List<PregnancyHomeFoodRecom> foodRecomList;
  @JsonKey(name: Const.KEY_TRIMESTERS)
  final List<PregnancyHomeTrimester> trimesterList;

  PregnancyHomeBabyResponse({
    required this.babyId,
    required this.name,
    required this.childOrder,
    required this.week,
    required this.remainingDays,
    required this.foodRecomList,
    required this.trimesterList,
  });

  factory PregnancyHomeBabyResponse.fromJson(Map<String, dynamic> map) => _$PregnancyHomeBabyResponseFromJson(map);
}

@JsonSerializable()
class PregnancyHomeFoodRecom {
  @JsonKey(name: Const.KEY_FOOD_CATEGORY)
  final String category;
  @JsonKey(name: Const.KEY_FOOD_DESC)
  final String desc;
  final String? img_url;

  PregnancyHomeFoodRecom({
    required this.category,
    required this.desc,
    required this.img_url,
  });

  factory PregnancyHomeFoodRecom.fromJson(Map<String, dynamic> map) => _$PregnancyHomeFoodRecomFromJson(map);
}

@JsonSerializable()
class PregnancyHomeTrimester {
  final int id;
  @JsonKey(name: Const.KEY_TRIMESTER_NO)
  final int no;
  @JsonKey(name: Const.KEY_BABY_ID)
  final int babyId;
  final String img_url;

  PregnancyHomeTrimester({
    required this.id,
    required this.no,
    required this.babyId,
    required this.img_url,
  });

  factory PregnancyHomeTrimester.fromJson(Map<String, dynamic> map) => _$PregnancyHomeTrimesterFromJson(map);
}