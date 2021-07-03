import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_immunization_api_model.g.dart';

@JsonSerializable()
class PregnancyCreateImmunizationBody {
  @JsonKey(name: Const.KEY_IMMUNIZATION_ID)
  final int immunizationId;
  final String date;
  final String location;
  final String pic;

  PregnancyCreateImmunizationBody({
    required this.immunizationId,
    required this.date,
    required this.location,
    required this.pic,
  });

  factory PregnancyCreateImmunizationBody.fromJson(Map<String, dynamic> map) => _$PregnancyCreateImmunizationBodyFromJson(map);
}

@JsonSerializable()
class PregnancyImmunizationResponse extends Equatable  {
  final int id;
  @JsonKey(name: Const.KEY_IMMUNIZATION_ID)
  final int immunizationId;
  final String? date;
  final String? location;
  @JsonKey(name: Const.KEY_TRIMESTER_NO)
  final int trimester;
  @JsonKey(name: Const.KEY_PIC)
  final String? imgLink;

  PregnancyImmunizationResponse({
    required this.id,
    required this.immunizationId,
    required this.date,
    required this.location,
    required this.trimester,
    required this.imgLink,
  });

  factory PregnancyImmunizationResponse.fromJson(Map<String, dynamic> map) => _$PregnancyImmunizationResponseFromJson(map);

  @override
  List<Object?> get props => [id, immunizationId, date, location, trimester, imgLink];
}