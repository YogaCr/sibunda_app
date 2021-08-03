import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_form_warning_api_model.g.dart';

@JsonSerializable()
class PregnancyCheckFormWarningResponse extends Equatable {
  final int code;
  final String message;
  final String status;
  final PregnancyCheckFormWarningDataResponse data;

  PregnancyCheckFormWarningResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });
  factory PregnancyCheckFormWarningResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCheckFormWarningResponseFromJson(map);

  @override
  List<Object?> get props => [code, message, status, data];
}

@JsonSerializable()
class PregnancyCheckFormWarningDataResponse extends Equatable  {
  @JsonKey(name: Const.KEY_FETUS_GROWTH_DESC)
  final PregnancyCheckFetusGrowthWarningResponse fetusGrowth;
  @JsonKey(name: Const.KEY_WEIGHT_DESC)
  final PregnancyFormWarningDescResponse weight;
  @JsonKey(name: Const.KEY_MOM_PULSE_DESC)
  final PregnancyFormWarningDescResponse momPulse;
  @JsonKey(name: Const.KEY_TFU_DESC)
  final PregnancyFormWarningDescResponse tfu;
  @JsonKey(name: Const.KEY_DJJ_DESC)
  final PregnancyFormWarningDescResponse djj;
  @JsonKey(name: Const.KEY_BABY_MOVEMENT_DESC)
  final PregnancyFormWarningDescResponse babyMovement;

  PregnancyCheckFormWarningDataResponse({
    required this.fetusGrowth,
    required this.weight,
    required this.momPulse,
    required this.tfu,
    required this.djj,
    required this.babyMovement,
  });
  factory PregnancyCheckFormWarningDataResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCheckFormWarningDataResponseFromJson(map);

  @override
  List<Object?> get props => [fetusGrowth, weight, momPulse, tfu, djj, babyMovement];
}

//Baby size overview in pregnancy form
@JsonSerializable()
class PregnancyCheckFetusGrowthWarningResponse extends Equatable  {
  final int week;
  final num? length;
  final num? weight;
  final String? desc;
  @JsonKey(name: Const.KEY_IMG)
  final String? imgLink;

  PregnancyCheckFetusGrowthWarningResponse({
    required this.week,
    required this.length,
    required this.weight,
    required this.desc,
    required this.imgLink,
  });
  factory PregnancyCheckFetusGrowthWarningResponse.fromJson(Map<String, dynamic> map) {
    map["length"] = tryParseNum(map["length"]);
    map["weight"] = tryParseNum(map["weight"]);
    return _$PregnancyCheckFetusGrowthWarningResponseFromJson(map);
  }

  @override
  List<Object?> get props => [week, length, weight, desc, imgLink];
}

@JsonSerializable()
class PregnancyFormWarningDescResponse extends Equatable {
  final int type;
  final String? desc;
  @JsonKey(name: Const.KEY_IS_NORMAL)
  final bool isNormal;
  PregnancyFormWarningDescResponse({
    required this.type,
    required this.desc,
    required this.isNormal,
  });
  factory PregnancyFormWarningDescResponse.fromJson(Map<String, dynamic> map) =>
      _$PregnancyFormWarningDescResponseFromJson(map);

  @override
  List<Object?> get props => [type, desc];
}


/*
@JsonSerializable()
class PregnancyCheckWeightWarningResponse extends Equatable {
  final int type;
  final String desc;
  @JsonKey(name: Const.KEY_IS_NORMAL)
  final bool isNormal;
  PregnancyCheckWeightWarningResponse({
    required this.type,
    required this.desc,
    required this.isNormal,
  });
  factory PregnancyCheckWeightWarningResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCheckWeightWarningResponseFromJson(map);

  @override
  List<Object?> get props => [type, desc];
}

@JsonSerializable()
class PregnancyCheckMomPulseWarningResponse extends Equatable  {
  final int type;
  final String desc;
  @JsonKey(name: Const.KEY_IS_NORMAL)
  final bool isNormal;
  PregnancyCheckMomPulseWarningResponse({
    required this.type,
    required this.desc,
    required this.isNormal,
  });
  factory PregnancyCheckMomPulseWarningResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCheckMomPulseWarningResponseFromJson(map);

  @override
  List<Object?> get props => [type, desc];
}

@JsonSerializable()
class PregnancyCheckTfuWarningResponse extends Equatable  {
  final int type;
  final String desc;
  @JsonKey(name: Const.KEY_IS_NORMAL)
  final bool isNormal;
  PregnancyCheckTfuWarningResponse({
    required this.type,
    required this.desc,
    required this.isNormal,
  });
  factory PregnancyCheckTfuWarningResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCheckTfuWarningResponseFromJson(map);

  @override
  List<Object?> get props => [type, desc];
}

@JsonSerializable()
class PregnancyCheckDjjWarningResponse extends Equatable  {
  final int type;
  final String desc;
  @JsonKey(name: Const.KEY_IS_NORMAL)
  final bool isNormal;
  PregnancyCheckDjjWarningResponse({
    required this.type,
    required this.desc,
    required this.isNormal,
  });
  factory PregnancyCheckDjjWarningResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCheckDjjWarningResponseFromJson(map);

  @override
  List<Object?> get props => [type, desc];
}

@JsonSerializable()
class PregnancyCheckBabyMovementWarningResponse extends Equatable  {
  final int type;
  final String desc;
  @JsonKey(name: Const.KEY_IS_NORMAL)
  final bool isNormal;
  PregnancyCheckBabyMovementWarningResponse({
    required this.type,
    required this.desc,
    required this.isNormal,
  });
  factory PregnancyCheckBabyMovementWarningResponse.fromJson(Map<String, dynamic> map) => _$PregnancyCheckBabyMovementWarningResponseFromJson(map);

  @override
  List<Object?> get props => [type, desc];
}
 */