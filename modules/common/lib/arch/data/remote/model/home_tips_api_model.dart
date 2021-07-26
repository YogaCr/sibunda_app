
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_tips_api_model.freezed.dart';
part 'home_tips_api_model.g.dart';

@freezed
class TipsResponse with _$TipsResponse {
  const factory TipsResponse({
    required int code,
    required String message,
    required String status,
    required List<TipsDataResponse> data,
  }) = _TipsResponse;
  factory TipsResponse.fromJson(Map<String, dynamic> map) = _TipsResponse.fromJson;
}

@freezed
class TipsDataResponse with _$TipsDataResponse {
  const factory TipsDataResponse({
    required int id,
    required String? img_url,
    required String desc,
    required int? user_id,
    required TipsCategoryResponse tips_category,
    required String content,
    required String created_at,
    required String updated_at,
  }) = _TipsDataResponse;
  factory TipsDataResponse.fromJson(Map<String, dynamic> map) = _TipsDataResponse.fromJson;
}

@freezed
class TipsCategoryResponse with _$TipsCategoryResponse {
  const factory TipsCategoryResponse({
    required int id,
    required String name,
  }) = _TipsCategoryResponse;
  factory TipsCategoryResponse.fromJson(Map<String, dynamic> map) = _TipsCategoryResponse.fromJson;
}