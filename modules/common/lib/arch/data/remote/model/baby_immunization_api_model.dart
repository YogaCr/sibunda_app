import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_immunization_api_model.g.dart';

// ========== Body ============
@JsonSerializable()
class BabyCreateImmunizationBody {
  final int id;
  final String date;
  final String location;
  final String pic;
  @JsonKey(name: Const.KEY_NO_BATCH)
  final String noBatch;

  BabyCreateImmunizationBody({
    required this.id,
    required this.date,
    required this.location,
    required this.pic,
    required this.noBatch,
  });

  factory BabyCreateImmunizationBody.fromJson(Map<String, dynamic> map) => _$BabyCreateImmunizationBodyFromJson(map);
  Map<String, dynamic> toJson() => _$BabyCreateImmunizationBodyToJson(this);
}


// ========== Response ============

@JsonSerializable()
class BabyImmunizationResponse extends Equatable  {
  final int code;
  final String message;
  final String status;
  final List<BabyImmunizationItemResponse> data;

  BabyImmunizationResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory BabyImmunizationResponse.fromJson(Map<String, dynamic> map) => _$BabyImmunizationResponseFromJson(map);

  @override
  List<Object?> get props => [code, message, status, data];
}

@JsonSerializable()
class BabyImmunizationItemResponse {
  final int id;
  @JsonKey(name: Const.KEY_IMMUNIZATION_ID)
  final int immunizationId;
  final String? date;
  final String? location;
  @JsonKey(name: Const.KEY_NO_BATCH)
  final String? noBatch;
  @JsonKey(name: Const.KEY_BABY_ID)
  final int childId;
  final int month_type;
  final String? pic;
  final BabyImmunizationItemEntityResponse immunization;

  BabyImmunizationItemResponse({
    required this.id,
    required this.immunizationId,
    required this.date,
    required this.location,
    required this.noBatch,
    required this.childId,
    required this.month_type,
    required this.pic,
    required this.immunization,
  });

  factory BabyImmunizationItemResponse.fromJson(Map<String, dynamic> map) => _$BabyImmunizationItemResponseFromJson(map);
  Map<String, dynamic> toJson() => _$BabyImmunizationItemResponseToJson(this);
}

@JsonSerializable()
class BabyImmunizationItemEntityResponse extends Equatable  {
  final int id;
  final String name;

  BabyImmunizationItemEntityResponse({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory BabyImmunizationItemEntityResponse.fromJson(Map<String, dynamic> map) => _$BabyImmunizationItemEntityResponseFromJson(map);
}