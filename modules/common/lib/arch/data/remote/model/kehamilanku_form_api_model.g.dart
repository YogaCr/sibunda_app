// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_form_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyCheckBody _$PregnancyCheckBodyFromJson(Map<String, dynamic> json) {
  return PregnancyCheckBody(
    id: json['id'] as int?,
    visitDate: json['tanggal_periksa'] as String,
    visitPlace: json['tempat_periksa'] as String,
    checkerName: json['nama_pemeriksa'] as String,
    difficulty: json['keluhan_bunda'] as String,
    pregnancyAge: json['week'] as int,
    babyGender: json['jenis_kelamin'] as String,
    futureVisitDate: json['tanggal_periksa_kembali'] as String,
    HPHT: json['hpht'] as String?,
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
    trimesterId: json['trisemester_id'] as int,
    img_usg: json['img_usg'] as String?,
  );
}

Map<String, dynamic> _$PregnancyCheckBodyToJson(PregnancyCheckBody instance) =>
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
      'trisemester_id': instance.trimesterId,
      'img_usg': instance.img_usg,
    };

PregnancyShowCheckBody _$PregnancyShowCheckBodyFromJson(
    Map<String, dynamic> json) {
  return PregnancyShowCheckBody(
    trisemester_id: json['trisemester_id'] as int,
    week: json['week'] as int,
  );
}

Map<String, dynamic> _$PregnancyShowCheckBodyToJson(
        PregnancyShowCheckBody instance) =>
    <String, dynamic>{
      'trisemester_id': instance.trisemester_id,
      'week': instance.week,
    };

PregnancyCreateCheckResponse _$PregnancyCreateCheckResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyCreateCheckResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    checkupId: PregnancyCreateCheckIdResponse.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PregnancyCreateCheckResponseToJson(
        PregnancyCreateCheckResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.checkupId,
    };

PregnancyCreateCheckIdResponse _$PregnancyCreateCheckIdResponseFromJson(
    Map<String, dynamic> json) {
  return PregnancyCreateCheckIdResponse(
    id: json['weekly_trisemester_checkup_id'] as int,
  );
}

Map<String, dynamic> _$PregnancyCreateCheckIdResponseToJson(
        PregnancyCreateCheckIdResponse instance) =>
    <String, dynamic>{
      'weekly_trisemester_checkup_id': instance.id,
    };
