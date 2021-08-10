// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immunization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImmunizationFill _$ImmunizationFillFromJson(Map<String, dynamic> json) {
  return ImmunizationFill(
    responsibleName: json['nama_penanggungjawab'] as String,
    date: json['tanggal_imunisasi'] as String,
    place: json['tempat_imunisasi'] as String,
    noBatch: json['no_batch'] as String,
  );
}

Map<String, dynamic> _$ImmunizationFillToJson(ImmunizationFill instance) =>
    <String, dynamic>{
      'nama_penanggungjawab': instance.responsibleName,
      'tanggal_imunisasi': instance.date,
      'tempat_imunisasi': instance.place,
      'no_batch': instance.noBatch,
    };
