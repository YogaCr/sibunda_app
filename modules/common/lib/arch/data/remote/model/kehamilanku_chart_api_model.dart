import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'common_chart_api_model.dart';

part 'kehamilanku_chart_api_model.g.dart';
part 'kehamilanku_chart_api_model.freezed.dart';


@freezed
class MotherTfuChartResponse with _$MotherTfuChartResponse {
  const factory MotherTfuChartResponse({
    required String message,
    required String status,
    required int code,
    required MotherTfuChartResponseData data,
  }) = _MotherTfuChartResponse;
  factory MotherTfuChartResponse.fromJson(Map<String, dynamic> map) = _MotherTfuChartResponse.fromJson;
}
@freezed
class MotherTfuChartResponseData with _$MotherTfuChartResponseData {
  const factory MotherTfuChartResponseData({
    required List<MotherTfuChartData> data,
    required ChartWarningResponse? desc,
  }) = _MotherTfuChartResponseData;
  factory MotherTfuChartResponseData.fromJson(Map<String, dynamic> map) = _MotherTfuChartResponseData.fromJson;
}


@freezed
class MotherDjjChartResponse with _$MotherDjjChartResponse {
  const factory MotherDjjChartResponse({
    required String message,
    required String status,
    required int code,
    required MotherDjjChartResponseData data,
  }) = _MotherDjjChartResponse;
  factory MotherDjjChartResponse.fromJson(Map<String, dynamic> map) = _MotherDjjChartResponse.fromJson;
}
@freezed
class MotherDjjChartResponseData with _$MotherDjjChartResponseData {
  const factory MotherDjjChartResponseData({
    required List<MotherDjjChartData> data,
    required ChartWarningResponse? desc,
  }) = _MotherDjjChartResponseData;
  factory MotherDjjChartResponseData.fromJson(Map<String, dynamic> map) = _MotherDjjChartResponseData.fromJson;
}


@freezed
class MotherMapChartResponse with _$MotherMapChartResponse {
  const factory MotherMapChartResponse({
    required String message,
    required String status,
    required int code,
    required MotherMapChartResponseData data,
  }) = _MotherMapChartResponse;
  factory MotherMapChartResponse.fromJson(Map<String, dynamic> map) = _MotherMapChartResponse.fromJson;
}
@freezed
class MotherMapChartResponseData with _$MotherMapChartResponseData {
  const factory MotherMapChartResponseData({
    required List<MotherMapChartData> data,
    required ChartWarningResponse? desc,
  }) = _MotherMapChartResponseData;
  factory MotherMapChartResponseData.fromJson(Map<String, dynamic> map) = _MotherMapChartResponseData.fromJson;
}


@freezed
class MotherBmiChartResponse with _$MotherBmiChartResponse {
  const factory MotherBmiChartResponse({
    required String message,
    required String status,
    required int code,
    required MotherBmiChartResponseData data,
  }) = _MotherBmiChartResponse;
  factory MotherBmiChartResponse.fromJson(Map<String, dynamic> map) = _MotherBmiChartResponse.fromJson;
}
@freezed
class MotherBmiChartResponseData with _$MotherBmiChartResponseData {
  const factory MotherBmiChartResponseData({
    required List<MotherBmiChartData> data,
    required ChartWarningResponse? desc,
  }) = _MotherBmiChartResponseData;
  factory MotherBmiChartResponseData.fromJson(Map<String, dynamic> map) = _MotherBmiChartResponseData.fromJson;
}


/*
@JsonSerializable()
class PregnancyChartTfuResponse {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_THRESHOLD)
  final num lowerLimit;
  @JsonKey(name: Const.KEY_NORMAL_THRESHOLD)
  final num normalLimit;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  final num input;

  PregnancyChartTfuResponse({
  	required this.week,
  	required this.lowerLimit,
  	required this.normalLimit,
  	required this.upperLimit,
  	required this.input,
  });

  factory PregnancyChartTfuResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartTfuResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartTfuResponseToJson(this);
}

@JsonSerializable()
class PregnancyChartDjjResponse {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_THRESHOLD)
  final num lowerLimit;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  final num input;

  PregnancyChartDjjResponse({
  	required this.week,
  	required this.lowerLimit,
  	required this.upperLimit,
  	required this.input,
  });

  factory PregnancyChartDjjResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartDjjResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartDjjResponseToJson(this);
}

@JsonSerializable()
class PregnancyChartMapResponse {
  final int week;
  @JsonKey(name: Const.KEY_TOP_THRESHOLD)
  final num upperLimit;
  final num input;

  PregnancyChartMapResponse({
  	required this.week,
  	required this.upperLimit,
  	required this.input,
  });

  factory PregnancyChartMapResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartMapResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartMapResponseToJson(this);
}

@JsonSerializable()
class PregnancyChartWeightResponse {
  final int week;
  @JsonKey(name: Const.KEY_BOTTOM_OBESITY_THRESHOLD)
  final num obeseLimit;
  @JsonKey(name: Const.KEY_BOTTOM_OVER_THRESHOLD)
  final num overLimit;
  @JsonKey(name: Const.KEY_BOTTOM_NORMAL_THRESHOLD)
  final num normalLimit;
  final num input;

  PregnancyChartWeightResponse({
  	required this.week,
  	required this.obeseLimit,
  	required this.overLimit,
  	required this.normalLimit,
  	required this.input,
  });

  factory PregnancyChartWeightResponse.fromJson(Map<String, dynamic> map) => _$PregnancyChartWeightResponseFromJson(map);
  Map<String, dynamic> toJson() => _$PregnancyChartWeightResponseToJson(this);
}
 */