import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_form_warning_api_model.g.dart';

//=========== Body ===========
class BabyFormWarningBody {
  final int monthId;
  BabyFormWarningBody({
    required this.monthId,
  });
  Map<String, dynamic> toJson() => {"month_id" : monthId};
}

//=========== Response ===========
@JsonSerializable()
class BabyFormWarningResponse {
  final int code;
  final String message;
  final String status;
  final BabyFormWarningDataResponse data;

  BabyFormWarningResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory BabyFormWarningResponse.fromJson(Map<String, dynamic> map) => _$BabyFormWarningResponseFromJson(map);
  Map<String, dynamic> toJson() => _$BabyFormWarningResponseToJson(this);
}

@JsonSerializable()
class BabyFormWarningDataResponse {
  final BabyFormWarningDescResponse weight;
  final BabyFormWarningDescResponse len;
  final BabyFormWarningDescResponse weightToLen;
  final BabyFormWarningDescResponse headCircum;
  final BabyFormWarningDescResponse imt;

  BabyFormWarningDataResponse({
    required this.weight,
    required this.len,
    required this.weightToLen,
    required this.headCircum,
    required this.imt,
  });

  factory BabyFormWarningDataResponse.fromJson(Map<String, dynamic> map) => _$BabyFormWarningDataResponseFromJson(map);
  Map<String, dynamic> toJson() => _$BabyFormWarningDataResponseToJson(this);
}

@JsonSerializable()
class BabyFormWarningDescResponse {
  final String desc;
  @JsonKey(name: Const.KEY_IS_NORMAL)
  final bool isNormal;

  BabyFormWarningDescResponse({
    required this.desc,
    required this.isNormal,
  });

  factory BabyFormWarningDescResponse.fromJson(Map<String, dynamic> map) => _$BabyFormWarningDescResponseFromJson(map);
  Map<String, dynamic> toJson() => _$BabyFormWarningDescResponseToJson(this);
}