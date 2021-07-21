import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'covid_check_api_model.g.dart';


// ========= body ==========

@JsonSerializable()
class CovidCheckFormBody {
  final String date;
  final int is_ibu;
  final int? anak_id; // Can be null if `is_ibu` == 1;
  final List<CovidCheckQuestionBody> answers;

  CovidCheckFormBody({
    required this.date,
    required this.is_ibu,
    required this.anak_id,
    required this.answers,
  });

  factory CovidCheckFormBody.fromJson(Map<String, dynamic> map) => _$CovidCheckFormBodyFromJson(map);
  Map<String, dynamic> toJson() => _$CovidCheckFormBodyToJson(this);
}

@JsonSerializable()
class CovidCheckQuestionBody {
  final int q_id;
  final int ans;

  CovidCheckQuestionBody({
    required this.q_id,
    required this.ans,
  });

  factory CovidCheckQuestionBody.fromJson(Map<String, dynamic> map) => _$CovidCheckQuestionBodyFromJson(map);
  Map<String, dynamic> toJson() => _$CovidCheckQuestionBodyToJson(this);
}


// ========= response ==========

@JsonSerializable()
class CovidCheckFormResponse extends Equatable {
  final int code;
  final String message;
  final String status;
  final CovidCheckFormDataResponse data;

  CovidCheckFormResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory CovidCheckFormResponse.fromJson(Map<String, dynamic> map) => _$CovidCheckFormResponseFromJson(map);
  Map<String, dynamic> toJson() => _$CovidCheckFormResponseToJson(this);

  @override
  List<Object?> get props => [code, message, status, data];
}
@JsonSerializable()
class CovidCheckHistoryResponse extends Equatable {
  final int code;
  final String message;
  final String status;
  final List<CovidCheckFormDataResponse> data;

  CovidCheckHistoryResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory CovidCheckHistoryResponse.fromJson(Map<String, dynamic> map) => _$CovidCheckHistoryResponseFromJson(map);
  Map<String, dynamic> toJson() => _$CovidCheckHistoryResponseToJson(this);

  @override
  List<Object?> get props => [code, message, status, data];
}
@JsonSerializable()
class CovidCheckFormDataResponse extends Equatable {
  final String date;
  final bool is_ibu;
  final int user_id;
  final int? kia_anak_id; // null when `is_ibu` is true.
  final int id; // Check up id
  final String img_url; // Check up id
  final bool result_is_normal;
  final String result_desc;
  final String result_long_desc;
  //final bool result_is_normal;

  CovidCheckFormDataResponse({
    required this.date,
    required this.is_ibu,
    required this.user_id,
    required this.kia_anak_id,
    required this.id,
    required this.img_url,
    required this.result_is_normal,
    required this.result_desc,
    required this.result_long_desc,
    //required this.result_is_normal,
  });

  factory CovidCheckFormDataResponse.fromJson(Map<String, dynamic> map) {
    if(map["is_ibu"] is int) {
      map["is_ibu"] = map["is_ibu"] == 1;
    }
    return _$CovidCheckFormDataResponseFromJson(map);
  }
  Map<String, dynamic> toJson() => _$CovidCheckFormDataResponseToJson(this);

  @override
  List<Object?> get props => [
    /*date, */is_ibu, user_id, kia_anak_id, id,
    result_is_normal, result_desc, result_long_desc, img_url,
  ];
}

/// For form data
@JsonSerializable()
class CovidFormResponse extends Equatable {
  final int code;
  final String message;
  final String status;
  final List<CovidFormDataResponse> data;

  CovidFormResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory CovidFormResponse.fromJson(Map<String, dynamic> map) => _$CovidFormResponseFromJson(map);
  Map<String, dynamic> toJson() => _$CovidFormResponseToJson(this);

  @override
  List<Object?> get props => [code, message, status, data];
}

@JsonSerializable()
class CovidFormDataResponse extends Equatable {
  final int id;
  final String question;

  CovidFormDataResponse({
    required this.id,
    required this.question,
  });

  factory CovidFormDataResponse.fromJson(Map<String, dynamic> map) => _$CovidFormDataResponseFromJson(map);
  Map<String, dynamic> toJson() => _$CovidFormDataResponseToJson(this);

  @override
  List<Object?> get props => [id, question];
}