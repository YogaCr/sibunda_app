import 'package:common/value/const_values.dart';
export 'common_data.dart';

class PregnancyCheck {
  final String visitDate;
  final String visitPlace;
  final String checkerName;
  final String difficulty;
  final int pregnancyAge; // in week
  final String babyGender;
  final String futureVisitDate;
  final String HPHT;
  final String HPL;
  final int motherWeigth; // in kg
  final int motherWeigthDiff; // in kg
  final int motherHeight; // in cm
  final int TFU;
  final int DJJ;
  final int systolicPressure;
  final int diastolicPressure;
  final int MAP;
  final String babyMovement;
  final String drugPrescript;
  final String drugAllergy;
  final String diseaseHistory;
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