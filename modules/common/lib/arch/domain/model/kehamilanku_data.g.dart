// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyCheck _$PregnancyCheckFromJson(Map<String, dynamic> json) {
  return PregnancyCheck(
    visitDate: json['tanggal_periksa'] as String,
    visitPlace: json['tempat_periksa'] as String,
    checkerName: json['nama_pemeriksa'] as String,
    difficulty: json['keluhan_bunda'] as String,
    pregnancyAge: json['usia_kehamilan'] as int,
    babyGender: json['kelamin_bayi'] as String,
    futureVisitDate: json['tanggal_periksa_kembali'] as String,
    HPHT: json['hpht'] as String,
    HPL: json['hpl'] as String,
    motherWeigth: json['berat_badan_bunda'] as int,
    motherWeigthDiff: json['kenaikan_berat_badan_bunda'] as int,
    motherHeight: json['tinggi_badan_bunda'] as int,
    TFU: json['tfu'] as int,
    DJJ: json['djj'] as int,
    systolicPressure: json['tekanan_darah_sistolik'] as int,
    diastolicPressure: json['tekanan_darah_diastolik'] as int,
    MAP: json['map'] as int,
    babyMovement: json['gerakan_bayi'] as String,
    drugPrescript: json['resep_obat'] as String,
    drugAllergy: json['alergi_obat'] as String,
    diseaseHistory: json['riwayat_penyakit'] as String,
    note: json['catatan_khusus'] as String,
  );
}

Map<String, dynamic> _$PregnancyCheckToJson(PregnancyCheck instance) =>
    <String, dynamic>{
      'tanggal_periksa': instance.visitDate,
      'tempat_periksa': instance.visitPlace,
      'nama_pemeriksa': instance.checkerName,
      'keluhan_bunda': instance.difficulty,
      'usia_kehamilan': instance.pregnancyAge,
      'kelamin_bayi': instance.babyGender,
      'tanggal_periksa_kembali': instance.futureVisitDate,
      'hpht': instance.HPHT,
      'hpl': instance.HPL,
      'berat_badan_bunda': instance.motherWeigth,
      'kenaikan_berat_badan_bunda': instance.motherWeigthDiff,
      'tinggi_badan_bunda': instance.motherHeight,
      'tfu': instance.TFU,
      'djj': instance.DJJ,
      'tekanan_darah_sistolik': instance.systolicPressure,
      'tekanan_darah_diastolik': instance.diastolicPressure,
      'map': instance.MAP,
      'gerakan_bayi': instance.babyMovement,
      'resep_obat': instance.drugPrescript,
      'alergi_obat': instance.drugAllergy,
      'riwayat_penyakit': instance.diseaseHistory,
      'catatan_khusus': instance.note,
    };
