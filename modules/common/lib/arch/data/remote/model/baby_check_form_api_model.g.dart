// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_check_form_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyCheckDevFormDataResponse _$BabyCheckDevFormDataResponseFromJson(
    Map<String, dynamic> json) {
  return BabyCheckDevFormDataResponse(
    id: json['id'] as int,
    no: json['no'] as int,
    question: json['question'] as String,
    img_url: json['img_url'] as String?,
    month_start: json['month_start'] as int,
    month_until: json['month_until'] as int,
  );
}

Map<String, dynamic> _$BabyCheckDevFormDataResponseToJson(
        BabyCheckDevFormDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'question': instance.question,
      'img_url': instance.img_url,
      'month_start': instance.month_start,
      'month_until': instance.month_until,
    };
