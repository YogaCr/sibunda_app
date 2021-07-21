// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_check_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidCheckFormBody _$CovidCheckFormBodyFromJson(Map<String, dynamic> json) {
  return CovidCheckFormBody(
    date: json['date'] as String,
    is_ibu: json['is_ibu'] as int,
    anak_id: json['anak_id'] as int?,
    answers: (json['answers'] as List<dynamic>)
        .map((e) => CovidCheckQuestionBody.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CovidCheckFormBodyToJson(CovidCheckFormBody instance) =>
    <String, dynamic>{
      'date': instance.date,
      'is_ibu': instance.is_ibu,
      'anak_id': instance.anak_id,
      'answers': instance.answers,
    };

CovidCheckQuestionBody _$CovidCheckQuestionBodyFromJson(
    Map<String, dynamic> json) {
  return CovidCheckQuestionBody(
    q_id: json['q_id'] as int,
    ans: json['ans'] as int,
  );
}

Map<String, dynamic> _$CovidCheckQuestionBodyToJson(
        CovidCheckQuestionBody instance) =>
    <String, dynamic>{
      'q_id': instance.q_id,
      'ans': instance.ans,
    };

CovidCheckFormResponse _$CovidCheckFormResponseFromJson(
    Map<String, dynamic> json) {
  return CovidCheckFormResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: CovidCheckFormDataResponse.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CovidCheckFormResponseToJson(
        CovidCheckFormResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

CovidCheckHistoryResponse _$CovidCheckHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return CovidCheckHistoryResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            CovidCheckFormDataResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CovidCheckHistoryResponseToJson(
        CovidCheckHistoryResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

CovidCheckFormDataResponse _$CovidCheckFormDataResponseFromJson(
    Map<String, dynamic> json) {
  return CovidCheckFormDataResponse(
    date: json['date'] as String,
    is_ibu: json['is_ibu'] as bool,
    user_id: json['user_id'] as int,
    kia_anak_id: json['kia_anak_id'] as int?,
    id: json['id'] as int,
    img_url: json['img_url'] as String,
    result_is_normal: json['result_is_normal'] as bool,
    result_desc: json['result_desc'] as String,
    result_long_desc: json['result_long_desc'] as String,
  );
}

Map<String, dynamic> _$CovidCheckFormDataResponseToJson(
        CovidCheckFormDataResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'is_ibu': instance.is_ibu,
      'user_id': instance.user_id,
      'kia_anak_id': instance.kia_anak_id,
      'id': instance.id,
      'img_url': instance.img_url,
      'result_is_normal': instance.result_is_normal,
      'result_desc': instance.result_desc,
      'result_long_desc': instance.result_long_desc,
    };

CovidFormResponse _$CovidFormResponseFromJson(Map<String, dynamic> json) {
  return CovidFormResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => CovidFormDataResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CovidFormResponseToJson(CovidFormResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

CovidFormDataResponse _$CovidFormDataResponseFromJson(
    Map<String, dynamic> json) {
  return CovidFormDataResponse(
    id: json['id'] as int,
    question: json['question'] as String,
  );
}

Map<String, dynamic> _$CovidFormDataResponseToJson(
        CovidFormDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
    };
