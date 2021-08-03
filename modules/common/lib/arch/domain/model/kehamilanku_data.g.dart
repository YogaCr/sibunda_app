// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyCheck _$PregnancyCheckFromJson(Map<String, dynamic> json) {
  return PregnancyCheck(
    id: json['id'] as int?,
    visitDate: json['tanggal_periksa'] as String,
    visitPlace: json['tempat_periksa'] as String,
    checkerName: json['nama_pemeriksa'] as String,
    difficulty: json['keluhan_bunda'] as String,
    pregnancyAge: json['week'] as int,
    babyGender: json['jenis_kelamin'] as String,
    futureVisitDate: json['tanggal_periksa_kembali'] as String,
    HPHT: json['hpht'] as String,
    HPL: json['hpl'] as String,
    motherWeigth: json['bb'] as num,
    motherWeigthDiff: json['kenaikan_bb'] as num,
    motherHeight: json['tb'] as num,
    TFU: json['tfu'] as num,
    DJJ: json['djj'] as num,
    systolicPressure: json['sistolik'] as num,
    diastolicPressure: json['diastolik'] as num,
    MAP: json['map'] as num,
    babyMovement: json['gerakan_bayi'] as int,
    drugPrescript: json['resep_obat'] as String,
    drugAllergy: json['alergi_obat'] as String,
    diseaseHistory: json['riwayat_penyakit'] as String,
    note: json['catatan_khusus'] as String,
    usgUrl: json['img_usg'] as String?,
  );
}

Map<String, dynamic> _$PregnancyCheckToJson(PregnancyCheck instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tanggal_periksa': instance.visitDate,
      'tempat_periksa': instance.visitPlace,
      'nama_pemeriksa': instance.checkerName,
      'keluhan_bunda': instance.difficulty,
      'week': instance.pregnancyAge,
      'jenis_kelamin': instance.babyGender,
      'tanggal_periksa_kembali': instance.futureVisitDate,
      'hpht': instance.HPHT,
      'hpl': instance.HPL,
      'bb': instance.motherWeigth,
      'kenaikan_bb': instance.motherWeigthDiff,
      'tb': instance.motherHeight,
      'tfu': instance.TFU,
      'djj': instance.DJJ,
      'sistolik': instance.systolicPressure,
      'diastolik': instance.diastolicPressure,
      'map': instance.MAP,
      'gerakan_bayi': instance.babyMovement,
      'resep_obat': instance.drugPrescript,
      'alergi_obat': instance.drugAllergy,
      'riwayat_penyakit': instance.diseaseHistory,
      'catatan_khusus': instance.note,
      'img_usg': instance.usgUrl,
    };
