// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mother.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mother _$MotherFromJson(Map<String, dynamic> json) {
  return Mother(
    name: json['nama'] as String,
    nik: json['nik'] as String,
    salary: json['pembiayaan'] as String,
    jkn: json['no_jkn'] as String,
    faskes1: json['faskes_tk1'] as String,
    faskesRujukan: json['faskes_rujukan'] as String,
    bloodType: json['gol_darah'] as String,
    birthCity: json['tempat_lahir'] as int,
    birthDate: json['tanggal_lahir'] as String,
    education: json['pendidikan'] as String,
    occupancy: json['pekerjaan'] as String,
    address: json['alamat_rumah'] as String,
    phone: json['telp'] as String,
    puskesmasDomisili: json['puskesmas_domisili'] as String,
    cohortRegistNo: json['nomor_register_kohort_ibu'] as String,
  );
}

Map<String, dynamic> _$MotherToJson(Mother instance) => <String, dynamic>{
      'nama': instance.name,
      'nik': instance.nik,
      'pembiayaan': instance.salary,
      'no_jkn': instance.jkn,
      'faskes_tk1': instance.faskes1,
      'faskes_rujukan': instance.faskesRujukan,
      'gol_darah': instance.bloodType,
      'tempat_lahir': instance.birthCity,
      'tanggal_lahir': instance.birthDate,
      'pendidikan': instance.education,
      'pekerjaan': instance.occupancy,
      'alamat_rumah': instance.address,
      'telp': instance.phone,
      'puskesmas_domisili': instance.puskesmasDomisili,
      'nomor_register_kohort_ibu': instance.cohortRegistNo,
    };
