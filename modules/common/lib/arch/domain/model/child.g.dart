// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) {
  return Child(
    name: json['nama'] as String,
    childOrder: json['anak_ke'] as int,
    gender: json['kelamin'] as String,
    birthCertificateNo: json['no_akte'] as String,
    nik: json['nik'] as String,
    bloodType: json['gol_darah'] as String,
    birthCity: json['tempat_lahir'] as String,
    birthDate: json['tanggal_lahir'] as String,
    jkn: json['no_jkn'] as String,
    jknStartDate: json['tgl_berlaku_jkn'] as String,
    babyCohortRegistNo: json['nomor_register_kohort_bayi'] as String,
    toddlerCohortRegistNo: json['nomor_register_kohort_balita'] as String,
    hospitalMedicalNumber: json['no_catatan_medis_rs'] as String,
  );
}

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'nama': instance.name,
      'anak_ke': instance.childOrder,
      'kelamin': instance.gender,
      'no_akte': instance.birthCertificateNo,
      'nik': instance.nik,
      'gol_darah': instance.bloodType,
      'tempat_lahir': instance.birthCity,
      'tanggal_lahir': instance.birthDate,
      'no_jkn': instance.jkn,
      'tgl_berlaku_jkn': instance.jknStartDate,
      'nomor_register_kohort_bayi': instance.babyCohortRegistNo,
      'nomor_register_kohort_balita': instance.toddlerCohortRegistNo,
      'no_catatan_medis_rs': instance.hospitalMedicalNumber,
    };
