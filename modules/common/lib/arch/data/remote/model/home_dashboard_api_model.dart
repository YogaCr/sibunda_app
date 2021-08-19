import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

import 'home_tips_api_model.dart';

part 'home_dashboard_api_model.g.dart';

@JsonSerializable()
class HomeDashboardResponse {
  final int code;
  final String message;
  final String status;
  final HomeDashboardDataResponse data;

  HomeDashboardResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory HomeDashboardResponse.fromJson(Map<String, dynamic> map) => _$HomeDashboardResponseFromJson(map);
  Map<String, dynamic> toJson() => _$HomeDashboardResponseToJson(this);
}

@JsonSerializable()
class HomeDashboardDataResponse {
  final HomeDashboardDataHeaderResponse header;
  final List<HomeDashboardDataWarningResponse> kesehatan_keluarga;
  final List<TipsDataResponse> tips_dan_info;

  HomeDashboardDataResponse({
    required this.header,
    required this.kesehatan_keluarga,
    required this.tips_dan_info,
  });

  factory HomeDashboardDataResponse.fromJson(Map<String, dynamic> map) => _$HomeDashboardDataResponseFromJson(map);
  Map<String, dynamic> toJson() => _$HomeDashboardDataResponseToJson(this);
}

@JsonSerializable()
class HomeDashboardDataHeaderResponse {
  final String? img_url;
  final String name;
  @JsonKey(name: Const.KEY_AGE)
  final String ageDesc; //For desc

  HomeDashboardDataHeaderResponse({
    required this.img_url,
    required this.name,
    required this.ageDesc, //For desc
  });

  factory HomeDashboardDataHeaderResponse.fromJson(Map<String, dynamic> map) => _$HomeDashboardDataHeaderResponseFromJson(map);
  Map<String, dynamic> toJson() => _$HomeDashboardDataHeaderResponseToJson(this);
}

@JsonSerializable()
class HomeDashboardDataWarningResponse {
  final String? img_url;
  final String desc;
  final bool is_normal;

  HomeDashboardDataWarningResponse({
    required this.img_url,
    required this.desc,
    required this.is_normal,
  });

  factory HomeDashboardDataWarningResponse.fromJson(Map<String, dynamic> map) {
    if(map["desc"] == null) {
      map["desc"] = "<null>";
    }
    return _$HomeDashboardDataWarningResponseFromJson(map);
  }
  Map<String, dynamic> toJson() => _$HomeDashboardDataWarningResponseToJson(this);
}

/*
@JsonSerializable()
class HomeDashboardDataTipsResponse {
  final String? img_url;
  final String desc;

  HomeDashboardDataTipsResponse({
    required this.img_url,
    required this.desc,
  });

  factory HomeDashboardDataTipsResponse.fromJson(Map<String, dynamic> map) => _$HomeDashboardDataTipsResponseFromJson(map);
  Map<String, dynamic> toJson() => _$HomeDashboardDataTipsResponseToJson(this);
}
 */