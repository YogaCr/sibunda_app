import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_api_model.g.dart';

@JsonSerializable()
class CityResponse extends Equatable {
  final int id;
  @JsonKey(name: Const.KEY_NAME_INDO)
  final String name;

  CityResponse({
    required this.id,
    required this.name,
  });

  factory CityResponse.fromJson(Map<String, dynamic> map) => _$CityResponseFromJson(map);
  Map<String, dynamic> toEntityJson() => {
    "id": id, "name": name,
  };

  @override
  List<Object?> get props => [id, name];
}