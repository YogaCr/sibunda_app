import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_form_api_model.g.dart';

// ========== Body ===========
@JsonSerializable()
class PregnancyCheckBody {
  final int? id;
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
  final String? HPHT;
  @JsonKey(name: Const.KEY_HPL)
  final String HPL;
  @JsonKey(name: Const.KEY_WEIGHT)
  final num motherWeigth; // in kg
  @JsonKey(name: Const.KEY_WEIGHT_DIFF)
  final num motherWeigthDiff; // in kg
  @JsonKey(name: Const.KEY_HEIGHT)
  final num motherHeight; // in cm
  @JsonKey(name: Const.KEY_TFU)
  final num TFU;
  @JsonKey(name: Const.KEY_DJJ)
  final num DJJ;
  @JsonKey(name: Const.KEY_SYSTOLIC_PRESSURE)
  final num systolicPressure;
  @JsonKey(name: Const.KEY_DIASTOLIC_PRESSURE)
  final num diastolicPressure;
  @JsonKey(name: Const.KEY_MAP)
  final num MAP;
  @JsonKey(name: Const.KEY_BABY_MOVEMENT)
  final int babyMovement;
  @JsonKey(name: Const.KEY_DRUG_PRESCRIPT)
  final String drugPrescript;
  @JsonKey(name: Const.KEY_DRUG_ALLERGY)
  final String drugAllergy;
  @JsonKey(name: Const.KEY_DISEASE_HISTORY)
  final String diseaseHistory;
  @JsonKey(name: Const.KEY_SPECIAL_NOTE)
  final String note;
  @JsonKey(name: Const.KEY_TRIMESTER_ID)
  final int trimesterId;
  final String? img_usg;

  PregnancyCheckBody({
    required this.id,
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
    required this.img_usg,
  });

  factory PregnancyCheckBody.fromJson(Map<String, dynamic> map) {
    // /*
    map[Const.KEY_WEIGHT] = tryParseNum(map[Const.KEY_WEIGHT]);
    map[Const.KEY_WEIGHT_DIFF] = tryParseNum(map[Const.KEY_WEIGHT_DIFF]);
    map[Const.KEY_HEIGHT] = tryParseNum(map[Const.KEY_HEIGHT]);
    map[Const.KEY_TFU] = tryParseNum(map[Const.KEY_TFU]);
    map[Const.KEY_DJJ] = tryParseNum(map[Const.KEY_DJJ]);
    map[Const.KEY_SYSTOLIC_PRESSURE] = tryParseNum(map[Const.KEY_SYSTOLIC_PRESSURE]);
    map[Const.KEY_DIASTOLIC_PRESSURE] = tryParseNum(map[Const.KEY_DIASTOLIC_PRESSURE]);
    map[Const.KEY_MAP] = tryParseNum(map[Const.KEY_MAP]);
    map[Const.KEY_BABY_MOVEMENT] = tryParseInt(map[Const.KEY_BABY_MOVEMENT]);
    // */
    return _$PregnancyCheckBodyFromJson(map);
  }
  Map<String, dynamic> toJson() => _$PregnancyCheckBodyToJson(this);

  factory PregnancyCheckBody.fromModel({
    required PregnancyCheck model,
    required int trimesterId,
  }) {
    final map = model.toJson();
    map[Const.KEY_TRIMESTER_ID] = trimesterId;
    return PregnancyCheckBody.fromJson(map);
  }
}

@JsonSerializable()
class PregnancyShowCheckBody {
  //@JsonKey(name: Const.KEY_PREGNANCY_CHECKUP_ID)
  final int trisemester_id;
  final int week;

  PregnancyShowCheckBody({
    required this.trisemester_id,
    required this.week,
  });

  factory PregnancyShowCheckBody.fromJson(Map<String, dynamic> map) => _$PregnancyShowCheckBodyFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyShowCheckBodyToJson(this);
}

class PregnancyShowAnalysisBody {
  //@JsonKey(name: Const.KEY_PREGNANCY_CHECKUP_ID)
  final int weekly_trisemester_checkup_id;

  PregnancyShowAnalysisBody({
    required this.weekly_trisemester_checkup_id,
  });

  //factory PregnancyShowAnalysisBody.fromJson(Map<String, dynamic> map) => _$PregnancyShowAnalysisBodyFromJson(map);
  Map<String, dynamic> toJson() => {
    "weekly_trisemester_checkup_id": weekly_trisemester_checkup_id,
  };
}



// ========== Response ===========
@JsonSerializable()
class PregnancyCreateCheckResponse extends Equatable {
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

  @override
  List<Object?> get props => [code, message, status, checkupId];
}

@JsonSerializable()
class PregnancyCreateCheckIdResponse extends Equatable {
  @JsonKey(name: Const.KEY_PREGNANCY_CHECKUP_ID)
  final int id;

  PregnancyCreateCheckIdResponse({
    required this.id,
  });

  factory PregnancyCreateCheckIdResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCreateCheckIdResponseFromJson(map);

  @override
  List<Object?> get props => [id];
}