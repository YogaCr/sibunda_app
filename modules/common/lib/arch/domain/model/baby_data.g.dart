// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyGrowthCheck _$BabyGrowthCheckFromJson(Map<String, dynamic> json) {
  return BabyGrowthCheck(
    date: json['date'] as String,
    location: json['location'] as String,
    age: json['age'] as String,
    weight: json['bb'] as String,
    height: json['tb'] as String,
    headCircum: json['lingkar_kepala'] as String,
    bmi: json['imt'] as String,
    checkerName: json['pemeriksa'] as String,
  );
}

Map<String, dynamic> _$BabyGrowthCheckToJson(BabyGrowthCheck instance) =>
    <String, dynamic>{
      'date': instance.date,
      'location': instance.location,
      'age': instance.age,
      'bb': instance.weight,
      'tb': instance.height,
      'lingkar_kepala': instance.headCircum,
      'imt': instance.bmi,
      'pemeriksa': instance.checkerName,
    };
