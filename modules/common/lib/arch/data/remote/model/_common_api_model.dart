import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '_common_api_model.g.dart';

@JsonSerializable()
class CommonResponse extends Equatable {
  final int code;
  final String message;
  final String status;

  CommonResponse({
    required this.code,
    required this.message,
    required this.status,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> map) => _$CommonResponseFromJson(map);

  @override
  List<Object?> get props => [code, message, status];
}