import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_api_model.g.dart';
part 'auth_api_model.freezed.dart';

@freezed
class CheckEmailAvailabilityResponse with _$CheckEmailAvailabilityResponse {
  const factory CheckEmailAvailabilityResponse({
    required String message,
    required String status,
    required int code,
    required bool available,
  }) = _CheckEmailAvailabilityResponse;
  factory CheckEmailAvailabilityResponse.fromJson(Map<String, dynamic> map) =
  _CheckEmailAvailabilityResponse.fromJson;
}