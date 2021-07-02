import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_form_api_model.g.dart';

// ========== Body ===========
@JsonSerializable()
class PregnancyCheckBody {
  @JsonKey(name: Const.KEY_VISIT_DATE)
  final String visitDate;
  @JsonKey(name: Const.KEY_VISIT_PLACE)
  final String visitPlace;
  @JsonKey(name: Const.KEY_CHECKER_NAME)
  final String checkerName;
  @JsonKey(name: Const.KEY_MOTHER_DIFFICULTY)
  final String difficulty;
  @JsonKey(name: Const.KEY_WEEK)
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
  @JsonKey(name: Const.KEY_TRIMESTER_ID)
  final String trimesterId;

  PregnancyCheckBody({
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
    required this.trimesterId,
  });

  factory PregnancyCheckBody.fromJson(Map<String, dynamic> map) => _$PregnancyCheckBodyFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyCheckBodyToJson(this);
}

@JsonSerializable()
class PregnancyShowCheckBody {
  @JsonKey(name: Const.KEY_PREGNANCY_CHECKUP_ID)
  final int checkId;

  PregnancyShowCheckBody({
    required this.checkId,
  });

  factory PregnancyShowCheckBody.fromJson(Map<String, dynamic> map) => _$PregnancyShowCheckBodyFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyShowCheckBodyToJson(this);
}



// ========== Response ===========
@JsonSerializable()
class PregnancyCreateCheckResponse {
  final String message;
  final String status;
  final int code;
  @JsonKey(name: Const.KEY_DATA)
  final PregnancyCreateCheckIdResponse checkupId;

  PregnancyCreateCheckResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.checkupId,
  });

  factory PregnancyCreateCheckResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCreateCheckResponseFromJson(map);
}

@JsonSerializable()
class PregnancyCreateCheckIdResponse {
  @JsonKey(name: Const.KEY_PREGNANCY_CHECKUP_ID)
  final int id;

  PregnancyCreateCheckIdResponse({
    required this.id,
  });

  factory PregnancyCreateCheckIdResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCreateCheckIdResponseFromJson(map);
}