import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_data.g.dart';

@JsonSerializable()
class PregnancyCheck {
  @JsonKey(name: Const.KEY_VISIT_DATE)
  final String visitDate;
  @JsonKey(name: Const.KEY_VISIT_PLACE)
  final String visitPlace;
  @JsonKey(name: Const.KEY_CHECKER_NAME)
  final String checkerName;
  @JsonKey(name: Const.KEY_MOTHER_DIFFICULTY)
  final String difficulty;
  @JsonKey(name: Const.KEY_PREGNANCY_AGE)
  final int pregnancyAge; // in week
  @JsonKey(name: Const.KEY_BABY_GENDER)
  final String babyGender;
  @JsonKey(name: Const.KEY_FUTURE_VISIT_DATE)
  final String futureVisitDate;
  @JsonKey(name: Const.KEY_HPHT)
  final String HPHT;
  @JsonKey(name: Const.KEY_HPL)
  final String HPL;
  @JsonKey(name: Const.KEY_MOTHER_WEIGHT)
  final int motherWeigth; // in kg
  @JsonKey(name: Const.KEY_MOTHER_WEIGHT_DIFF)
  final int motherWeigthDiff; // in kg
  @JsonKey(name: Const.KEY_MOTHER_HEIGHT)
  final int motherHeight; // in cm
  @JsonKey(name: Const.KEY_TFU)
  final int TFU;
  @JsonKey(name: Const.KEY_DJJ)
  final int DJJ;
  @JsonKey(name: Const.KEY_SYSTOLIC_PRESSURE)
  final int systolicPressure;
  @JsonKey(name: Const.KEY_DIASTOLIC_PRESSURE)
  final int diastolicPressure;
  @JsonKey(name: Const.KEY_MAP)
  final int MAP;
  @JsonKey(name: Const.KEY_BABY_MOVEMENT)
  final String babyMovement;
  @JsonKey(name: Const.KEY_DRUG_PRESCRIPT)
  final String drugPrescript;
  @JsonKey(name: Const.KEY_DRUG_ALLERGY)
  final String drugAllergy;
  @JsonKey(name: Const.KEY_DISEASE_HISTORY)
  final String diseaseHistory;
  @JsonKey(name: Const.KEY_SPECIAL_NOTE)
  final String note;

  PregnancyCheck({
    required this.visitDate,
    required this.visitPlace,
    required this.checkerName,
    required this.difficulty,
    required this.pregnancyAge,
    required this.babyGender,
    required this.futureVisitDate,
    required this.HPHT,
    required this.HPL,
    required this.motherWeigth,
    required this.motherWeigthDiff,
    required this.motherHeight,
    required this.TFU,
    required this.DJJ,
    required this.systolicPressure,
    required this.diastolicPressure,
    required this.MAP,
    required this.babyMovement,
    required this.drugPrescript,
    required this.drugAllergy,
    required this.diseaseHistory,
    required this.note,
  });


  factory PregnancyCheck.from(Map<String, String> map) => PregnancyCheck(
    visitDate: map[Const.KEY_VISIT_DATE]!,
    visitPlace: map[Const.KEY_VISIT_PLACE]!,
    checkerName: map[Const.KEY_CHECKER_NAME]!,
    difficulty: map[Const.KEY_MOTHER_DIFFICULTY]!,
    pregnancyAge: int.parse(map[Const.KEY_PREGNANCY_AGE]!),
    babyGender: map[Const.KEY_BABY_GENDER]!,
    futureVisitDate: map[Const.KEY_FUTURE_VISIT_DATE]!,
    HPHT: map[Const.KEY_HPHT]!,
    HPL: map[Const.KEY_HPL]!,
    motherWeigth: int.parse(map[Const.KEY_MOTHER_WEIGHT]!),
    motherWeigthDiff: int.parse(map[Const.KEY_MOTHER_WEIGHT_DIFF]!),
    motherHeight: int.parse(map[Const.KEY_MOTHER_HEIGHT]!),
    TFU: int.parse(map[Const.KEY_TFU]!),
    DJJ: int.parse(map[Const.KEY_DJJ]!),
    systolicPressure: int.parse(map[Const.KEY_SYSTOLIC_PRESSURE]!),
    diastolicPressure: int.parse(map[Const.KEY_DIASTOLIC_PRESSURE]!),
    MAP: int.parse(map[Const.KEY_MAP]!),
    babyMovement: map[Const.KEY_BABY_MOVEMENT]!,
    drugPrescript: map[Const.KEY_DRUG_PRESCRIPT]!,
    drugAllergy: map[Const.KEY_DRUG_ALLERGY]!,
    diseaseHistory: map[Const.KEY_DISEASE_HISTORY]!,
    note: map[Const.KEY_SPECIAL_NOTE]!,
  );

  factory PregnancyCheck.fromJson(Map<String, dynamic> json) => _$PregnancyCheckFromJson(json);
  Map<String, dynamic> toJson() => _$PregnancyCheckToJson(this);
}


/*
======================
HOME
======================
 */

class MotherPregnancyAgeOverview {
  final int weekAge;
  final int daysRemaining;

  MotherPregnancyAgeOverview({
    required this.weekAge,
    required this.daysRemaining,
  });
}

class MotherTrimester {
  final int trimester;
  final int startWeek;
  final int endWeek;
  final String imgLink;

  MotherTrimester({
    required this.trimester,
    required this.startWeek,
    required this.endWeek,
    required this.imgLink,
  });
}

class MotherFoodRecom {
  final String imgLink;
  final String food;
  final String desc;

  MotherFoodRecom({
    required this.imgLink,
    required this.food,
    required this.desc,
  });
}


/*
======================
Weekly Check Form
======================
 */

class PregnancyBabySize {
  final String sizeString;
  final double babyLen;
  final double babyWeight;

  PregnancyBabySize({
    required this.sizeString,
    required this.babyWeight,
    required this.babyLen,
  });
}