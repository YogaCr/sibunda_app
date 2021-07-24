import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_chart_api_model.freezed.dart';
part 'common_chart_api_model.g.dart';

@freezed
class ChartWarningResponse with _$ChartWarningResponse {
  const factory ChartWarningResponse({
    required String? desc,
    required bool is_normal,
  }) = _ChartWarningResponse;
  factory ChartWarningResponse.fromJson(Map<String, dynamic> map) = _ChartWarningResponse.fromJson;
}