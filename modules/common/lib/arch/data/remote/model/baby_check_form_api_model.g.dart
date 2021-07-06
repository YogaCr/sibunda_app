// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_check_form_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyGetMonthlyFormBody _$BabyGetMonthlyFormBodyFromJson(
    Map<String, dynamic> json) {
  return BabyGetMonthlyFormBody(
    yearId: json['year_id'] as int,
    month: json['month'] as int,
  );
}

Map<String, dynamic> _$BabyGetMonthlyFormBodyToJson(
        BabyGetMonthlyFormBody instance) =>
    <String, dynamic>{
      'year_id': instance.yearId,
      'month': instance.month,
    };

BabyMonthlyFormBody _$BabyMonthlyFormBodyFromJson(Map<String, dynamic> json) {
  return BabyMonthlyFormBody(
    id: json['id'] as int?,
    yearId: json['year_id'] as int,
    month: json['month'] as int,
    date: json['date'] as String,
    location: json['location'] as String,
    checker: json['pemeriksa'] as String,
    age: json['age'] as int,
    weight: json['bb'] as num,
    height: json['tb'] as num,
    headCircum: json['lingkar_kepala'] as num,
    bmi: json['imt'] as num,
    perkembangan_ans: (json['perkembangan_ans'] as List<dynamic>?)
        ?.map((e) => BabyMonthlyDevFormBody.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BabyMonthlyFormBodyToJson(
        BabyMonthlyFormBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year_id': instance.yearId,
      'month': instance.month,
      'date': instance.date,
      'location': instance.location,
      'pemeriksa': instance.checker,
      'age': instance.age,
      'bb': instance.weight,
      'tb': instance.height,
      'lingkar_kepala': instance.headCircum,
      'imt': instance.bmi,
      'perkembangan_ans': instance.perkembangan_ans,
    };

BabyMonthlyDevFormBody _$BabyMonthlyDevFormBodyFromJson(
    Map<String, dynamic> json) {
  return BabyMonthlyDevFormBody(
    ans: json['ans'] as int,
    q_id: json['q_id'] as int,
  );
}

Map<String, dynamic> _$BabyMonthlyDevFormBodyToJson(
        BabyMonthlyDevFormBody instance) =>
    <String, dynamic>{
      'q_id': instance.q_id,
      'ans': instance.ans,
    };

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
