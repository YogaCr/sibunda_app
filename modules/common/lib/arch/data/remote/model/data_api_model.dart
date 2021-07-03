import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_api_model.g.dart';

@JsonSerializable()
class CityResponse {
  final int id;
  @JsonKey(name: Const.KEY_NAME_INDO)
  final String name;

  CityResponse({
    required this.id,
    required this.name,
  });

  factory CityResponse.fromJson(Map<String, dynamic> map) => _$CityResponseFromJson(map);
}