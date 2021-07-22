// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) {
  return CityResponse(
    id: json['id'] as int,
    name: json['nama'] as String,
  );
}

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
    };

_$_BioResponse _$_$_BioResponseFromJson(Map<String, dynamic> json) {
  return _$_BioResponse(
    message: json['message'] as String,
    status: json['status'] as String,
    code: json['code'] as int,
    data: (json['data'] as List<dynamic>)
        .map((e) => BioMotherResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_BioResponseToJson(_$_BioResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };

_$_BioMotherResponse _$_$_BioMotherResponseFromJson(Map<String, dynamic> json) {
  return _$_BioMotherResponse(
    id: json['id'] as int,
    user_id: json['user_id'] as int,
    nama: json['nama'] as String,
    nik: json['nik'] as String,
    pembiayaan: json['pembiayaan'] as String,
    no_jkn: json['no_jkn'] as String,
    faskes_tk1: json['faskes_tk1'] as String,
    faskes_rujukan: json['faskes_rujukan'] as String,
    gol_darah: json['gol_darah'] as String,
    tempat_lahir: json['tempat_lahir'] as int,
    tanggal_lahir: json['tanggal_lahir'] as String,
    pendidikan: json['pendidikan'] as String,
    pekerjaan: json['pekerjaan'] as String,
    alamat_rumah: json['alamat_rumah'] as String,
    telp: json['telp'] as String,
    puskesmas_domisili: json['puskesmas_domisili'] as String,
    nomor_register_kohort_ibu: json['nomor_register_kohort_ibu'] as String,
    kia_ayah:
        BioFatherResponse.fromJson(json['kia_ayah'] as Map<String, dynamic>),
    kia_anak: (json['kia_anak'] as List<dynamic>)
        .map((e) => BioChildResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_BioMotherResponseToJson(
        _$_BioMotherResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'nama': instance.nama,
      'nik': instance.nik,
      'pembiayaan': instance.pembiayaan,
      'no_jkn': instance.no_jkn,
      'faskes_tk1': instance.faskes_tk1,
      'faskes_rujukan': instance.faskes_rujukan,
      'gol_darah': instance.gol_darah,
      'tempat_lahir': instance.tempat_lahir,
      'tanggal_lahir': instance.tanggal_lahir,
      'pendidikan': instance.pendidikan,
      'pekerjaan': instance.pekerjaan,
      'alamat_rumah': instance.alamat_rumah,
      'telp': instance.telp,
      'puskesmas_domisili': instance.puskesmas_domisili,
      'nomor_register_kohort_ibu': instance.nomor_register_kohort_ibu,
      'kia_ayah': instance.kia_ayah,
      'kia_anak': instance.kia_anak,
    };

_$_BioFatherResponse _$_$_BioFatherResponseFromJson(Map<String, dynamic> json) {
  return _$_BioFatherResponse(
    id: json['id'] as int,
    nama: json['nama'] as String,
    nik: json['nik'] as String,
    pembiayaan: json['pembiayaan'] as String,
    no_jkn: json['no_jkn'] as String,
    faskes_tk1: json['faskes_tk1'] as String,
    faskes_rujukan: json['faskes_rujukan'] as String,
    gol_darah: json['gol_darah'] as String,
    tempat_lahir: json['tempat_lahir'] as int,
    tanggal_lahir: json['tanggal_lahir'] as String,
    pendidikan: json['pendidikan'] as String,
    pekerjaan: json['pekerjaan'] as String,
    alamat_rumah: json['alamat_rumah'] as String,
    telp: json['telp'] as String,
  );
}

Map<String, dynamic> _$_$_BioFatherResponseToJson(
        _$_BioFatherResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'nik': instance.nik,
      'pembiayaan': instance.pembiayaan,
      'no_jkn': instance.no_jkn,
      'faskes_tk1': instance.faskes_tk1,
      'faskes_rujukan': instance.faskes_rujukan,
      'gol_darah': instance.gol_darah,
      'tempat_lahir': instance.tempat_lahir,
      'tanggal_lahir': instance.tanggal_lahir,
      'pendidikan': instance.pendidikan,
      'pekerjaan': instance.pekerjaan,
      'alamat_rumah': instance.alamat_rumah,
      'telp': instance.telp,
    };

_$_BioChildResponse _$_$_BioChildResponseFromJson(Map<String, dynamic> json) {
  return _$_BioChildResponse(
    id: json['id'] as int,
    nama: json['nama'] as String,
    anak_ke: json['anak_ke'] as int?,
    no_akte_kelahiran: json['no_akte_kelahiran'] as String?,
    nik: json['nik'] as String?,
    jenis_kelamin: json['jenis_kelamin'] as String?,
    gol_darah: json['gol_darah'] as String?,
    tempat_lahir: json['tempat_lahir'] as int?,
    tanggal_lahir: json['tanggal_lahir'] as String?,
    no_jkn: json['no_jkn'] as String?,
    tanggal_berlaku_jkn: json['tanggal_berlaku_jkn'] as String?,
    no_kohort: json['no_kohort'] as String?,
    no_catatan_medik: json['no_catatan_medik'] as String?,
    hpl: json['hpl'] as String?,
    hpht: json['hpht'] as String?,
    is_janin: json['is_janin'] as bool,
  );
}

Map<String, dynamic> _$_$_BioChildResponseToJson(
        _$_BioChildResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'anak_ke': instance.anak_ke,
      'no_akte_kelahiran': instance.no_akte_kelahiran,
      'nik': instance.nik,
      'jenis_kelamin': instance.jenis_kelamin,
      'gol_darah': instance.gol_darah,
      'tempat_lahir': instance.tempat_lahir,
      'tanggal_lahir': instance.tanggal_lahir,
      'no_jkn': instance.no_jkn,
      'tanggal_berlaku_jkn': instance.tanggal_berlaku_jkn,
      'no_kohort': instance.no_kohort,
      'no_catatan_medik': instance.no_catatan_medik,
      'hpl': instance.hpl,
      'hpht': instance.hpht,
      'is_janin': instance.is_janin,
    };
