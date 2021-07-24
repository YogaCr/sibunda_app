import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'common_chart_api_model.dart';

part 'baby_chart_api_model.freezed.dart';
part 'baby_chart_api_model.g.dart';

@freezed
class BabyWeightChartResponse with _$BabyWeightChartResponse {
  const factory BabyWeightChartResponse({
    required String message,
    required String status,
    required int code,
    required BabyWeightChartResponseData data,
  }) = _BabyWeightChartResponse;
  factory BabyWeightChartResponse.fromJson(Map<String, dynamic> map) = _BabyWeightChartResponse.fromJson;
}
@freezed
class BabyWeightChartResponseData with _$BabyWeightChartResponseData {
  const factory BabyWeightChartResponseData({
    required List<BabyWeightChartData> data,
    required ChartWarningResponse? desc,
  }) = _BabyWeightChartResponseData;
  factory BabyWeightChartResponseData.fromJson(Map<String, dynamic> map) = _BabyWeightChartResponseData.fromJson;
}


@freezed
class BabyKmsChartResponse with _$BabyKmsChartResponse {
  const factory BabyKmsChartResponse({
    required String message,
    required String status,
    required int code,
    required BabyKmsChartResponseData data,
  }) = _BabyKmsChartResponse;
  factory BabyKmsChartResponse.fromJson(Map<String, dynamic> map) = _BabyKmsChartResponse.fromJson;
}
@freezed
class BabyKmsChartResponseData with _$BabyKmsChartResponseData {
  const factory BabyKmsChartResponseData({
    required List<BabyKmsChartData> data,
    required ChartWarningResponse? desc,
  }) = _BabyKmsChartResponseData;
  factory BabyKmsChartResponseData.fromJson(Map<String, dynamic> map) = _BabyKmsChartResponseData.fromJson;
}


@freezed
class BabyLenChartResponse with _$BabyLenChartResponse {
  const factory BabyLenChartResponse({
    required String message,
    required String status,
    required int code,
    required BabyLenChartResponseData data,
  }) = _BabyLenChartResponse;
  factory BabyLenChartResponse.fromJson(Map<String, dynamic> map) = _BabyLenChartResponse.fromJson;
}
@freezed
class BabyLenChartResponseData with _$BabyLenChartResponseData {
  const factory BabyLenChartResponseData({
    required List<BabyLenChartData> data,
    required ChartWarningResponse? desc,
  }) = _BabyLenChartResponseData;
  factory BabyLenChartResponseData.fromJson(Map<String, dynamic> map) = _BabyLenChartResponseData.fromJson;
}


@freezed
class BabyWeightToLenChartResponse with _$BabyWeightToLenChartResponse {
  const factory BabyWeightToLenChartResponse({
    required String message,
    required String status,
    required int code,
    required BabyWeightToLenChartResponseData data,
  }) = _BabyWeightToLenChartResponse;
  factory BabyWeightToLenChartResponse.fromJson(Map<String, dynamic> map) = _BabyWeightToLenChartResponse.fromJson;
}
@freezed
class BabyWeightToLenChartResponseData with _$BabyWeightToLenChartResponseData {
  const factory BabyWeightToLenChartResponseData({
    required List<BabyWeightToLenChartData> data,
    required ChartWarningResponse? desc,
  }) = _BabyWeightToLenChartResponseData;
  factory BabyWeightToLenChartResponseData.fromJson(Map<String, dynamic> map) = _BabyWeightToLenChartResponseData.fromJson;
}


@freezed
class BabyHeadCircumChartResponse with _$BabyHeadCircumChartResponse {
  const factory BabyHeadCircumChartResponse({
    required String message,
    required String status,
    required int code,
    required BabyHeadCircumChartResponseData data,
  }) = _BabyHeadCircumChartResponse;
  factory BabyHeadCircumChartResponse.fromJson(Map<String, dynamic> map) = _BabyHeadCircumChartResponse.fromJson;
}
@freezed
class BabyHeadCircumChartResponseData with _$BabyHeadCircumChartResponseData {
  const factory BabyHeadCircumChartResponseData({
    required List<BabyHeadCircumChartData> data,
    required ChartWarningResponse? desc,
  }) = _BabyHeadCircumChartResponseData;
  factory BabyHeadCircumChartResponseData.fromJson(Map<String, dynamic> map) = _BabyHeadCircumChartResponseData.fromJson;
}


@freezed
class BabyBmiChartResponse with _$BabyBmiChartResponse {
  const factory BabyBmiChartResponse({
    required String message,
    required String status,
    required int code,
    required BabyBmiChartResponseData data,
  }) = _BabyBmiChartResponse;
  factory BabyBmiChartResponse.fromJson(Map<String, dynamic> map) = _BabyBmiChartResponse.fromJson;
}
@freezed
class BabyBmiChartResponseData with _$BabyBmiChartResponseData {
  const factory BabyBmiChartResponseData({
    required List<BabyBmiChartData> data,
    required ChartWarningResponse? desc,
  }) = _BabyBmiChartResponseData;
  factory BabyBmiChartResponseData.fromJson(Map<String, dynamic> map) = _BabyBmiChartResponseData.fromJson;
}


@freezed
class BabyDevChartResponse with _$BabyDevChartResponse {
  const factory BabyDevChartResponse({
    required String message,
    required String status,
    required int code,
    required BabyDevChartResponseData data,
  }) = _BabyDevChartResponse;
  factory BabyDevChartResponse.fromJson(Map<String, dynamic> map) = _BabyDevChartResponse.fromJson;
}
@freezed
class BabyDevChartResponseData with _$BabyDevChartResponseData {
  const factory BabyDevChartResponseData({
    required List<BabyDevChartData> data,
    required ChartWarningResponse? desc,
  }) = _BabyDevChartResponseData;
  factory BabyDevChartResponseData.fromJson(Map<String, dynamic> map) = _BabyDevChartResponseData.fromJson;
}