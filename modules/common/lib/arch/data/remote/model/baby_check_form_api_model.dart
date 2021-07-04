import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_check_form_api_model.g.dart';

@JsonSerializable()
class BabyCheckDevFormDataResponse {
  final int id;
  final int no;
  final String question;
  final String? img_url;
  final int month_start;
  final int month_until;

  BabyCheckDevFormDataResponse({
    required this.id,
    required this.no,
    required this.question,
    required this.img_url,
    required this.month_start,
    required this.month_until,
  });
  factory BabyCheckDevFormDataResponse.fromJson(Map<String, dynamic> map) => _$BabyCheckDevFormDataResponseFromJson(map);
}

