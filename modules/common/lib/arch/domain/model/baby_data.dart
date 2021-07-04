import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_data.g.dart';

class BabyAgeOverview {
  final int year; //If 0, it won't be displayed on screen. This applies to other fields.
  final int month;
  final int day;

  BabyAgeOverview({
    required this.year,
    required this.month,
    required this.day,
  });
}

class BabyFormMenuData {
  final int year;
  final int monthStart;
  final int monthEnd;

  BabyFormMenuData({
    required this.year,
    required this.monthStart,
    required this.monthEnd,
  });
}

@JsonSerializable()
class BabyGrowthCheck {
  final String date;
  final String location;
  final String age;
  @JsonKey(name: Const.KEY_MOTHER_WEIGHT)
  final String weight;
  @JsonKey(name: Const.KEY_MOTHER_HEIGHT)
  final String height;
  @JsonKey(name: Const.KEY_HEAD_CIRCUM)
  final String headCircum;
  @JsonKey(name: Const.KEY_IMT)
  final String bmi;
  @JsonKey(name: Const.KEY_CHECKER)
  final String checkerName;

  BabyGrowthCheck({
    required this.date,
    required this.location,
    required this.age,
    required this.weight,
    required this.height,
    required this.headCircum,
    required this.bmi,
    required this.checkerName,
  });

  factory BabyGrowthCheck.fromJson(Map<String, dynamic> map) => _$BabyGrowthCheckFromJson(map);
  Map<String, dynamic> fromJson() => _$BabyGrowthCheckToJson(this);
}