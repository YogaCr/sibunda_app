// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyGrowthCheck _$BabyGrowthCheckFromJson(Map<String, dynamic> json) {
  return BabyGrowthCheck(
    date: json['date'] as String,
    location: json['location'] as String,
    age: json['age'] as int,
    weight: json['bb'] as num,
    height: json['tb'] as num,
    headCircum: json['lingkar_kepala'] as num,
    bmi: json['imt'] as num,
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

Neonatal6HourForm _$Neonatal6HourFormFromJson(Map<String, dynamic> json) {
  return Neonatal6HourForm(
    weight: json['bb'] as num,
    height: json['tb'] as num,
    headCircum: json['lingkar_kepala'] as num,
    q_imd: json['q_imd'] as int,
    q_vit_k1: json['q_vit_k1'] as int,
    q_salep: json['q_salep'] as int,
    q_imunisasi_hb: json['q_imunisasi_hb'] as int,
    date: json['date'] as String,
    time: json['time'] as String,
    no_batch: json['no_batch'] as String,
    dirujuk_ke: json['dirujuk_ke'] as String,
    petugas: json['petugas'] as String,
    catatan_penting: json['catatan_penting'] as String,
  );
}

Map<String, dynamic> _$Neonatal6HourFormToJson(Neonatal6HourForm instance) =>
    <String, dynamic>{
      'bb': instance.weight,
      'tb': instance.height,
      'lingkar_kepala': instance.headCircum,
      'q_imd': instance.q_imd,
      'q_vit_k1': instance.q_vit_k1,
      'q_salep': instance.q_salep,
      'q_imunisasi_hb': instance.q_imunisasi_hb,
      'date': instance.date,
      'time': instance.time,
      'no_batch': instance.no_batch,
      'dirujuk_ke': instance.dirujuk_ke,
      'petugas': instance.petugas,
      'catatan_penting': instance.catatan_penting,
    };

NeonatalKn1Form _$NeonatalKn1FormFromJson(Map<String, dynamic> json) {
  return NeonatalKn1Form(
    q_menyusu: json['q_menyusu'] as int,
    q_tali_pusat: json['q_tali_pusat'] as int,
    q_vit_k1: json['q_vit_k1'] as int,
    q_salep: json['q_salep'] as int,
    q_imunisasi_hb: json['q_imunisasi_hb'] as int,
    q_skrining_hipotiroid_kongenital:
        json['q_skrining_hipotiroid_kongenital'] as int,
    date: json['date'] as String,
    time: json['time'] as String,
    no_batch: json['no_batch'] as String,
    weight: json['bb'] as num,
    height: json['tb'] as num,
    headCircum: json['lingkar_kepala'] as num,
    dirujuk_ke: json['dirujuk_ke'] as String,
    petugas: json['petugas'] as String,
    catatan_penting: json['catatan_penting'] as String,
    masalah: json['masalah'] as String,
  );
}

Map<String, dynamic> _$NeonatalKn1FormToJson(NeonatalKn1Form instance) =>
    <String, dynamic>{
      'q_menyusu': instance.q_menyusu,
      'q_tali_pusat': instance.q_tali_pusat,
      'q_vit_k1': instance.q_vit_k1,
      'q_salep': instance.q_salep,
      'q_imunisasi_hb': instance.q_imunisasi_hb,
      'q_skrining_hipotiroid_kongenital':
          instance.q_skrining_hipotiroid_kongenital,
      'date': instance.date,
      'time': instance.time,
      'no_batch': instance.no_batch,
      'bb': instance.weight,
      'tb': instance.height,
      'lingkar_kepala': instance.headCircum,
      'dirujuk_ke': instance.dirujuk_ke,
      'petugas': instance.petugas,
      'catatan_penting': instance.catatan_penting,
      'masalah': instance.masalah,
    };

NeonatalKn2Form _$NeonatalKn2FormFromJson(Map<String, dynamic> json) {
  return NeonatalKn2Form(
    q_menyusu: json['q_menyusu'] as int,
    q_tali_pusat: json['q_tali_pusat'] as int,
    q_tanda_bahaya: json['q_tanda_bahaya'] as int,
    q_identifikasi_kuning: json['q_identifikasi_kuning'] as int,
    q_imunisasi_hb: json['q_imunisasi_hb'] as int,
    q_skrining_hipotiroid_kongenital:
        json['q_skrining_hipotiroid_kongenital'] as int,
    date: json['date'] as String,
    time: json['time'] as String,
    no_batch: json['no_batch'] as String,
    weight: json['bb'] as num,
    height: json['tb'] as num,
    headCircum: json['lingkar_kepala'] as num,
    dirujuk_ke: json['dirujuk_ke'] as String,
    petugas: json['petugas'] as String,
    catatan_penting: json['catatan_penting'] as String,
    masalah: json['masalah'] as String,
  );
}

Map<String, dynamic> _$NeonatalKn2FormToJson(NeonatalKn2Form instance) =>
    <String, dynamic>{
      'q_menyusu': instance.q_menyusu,
      'q_tali_pusat': instance.q_tali_pusat,
      'q_tanda_bahaya': instance.q_tanda_bahaya,
      'q_identifikasi_kuning': instance.q_identifikasi_kuning,
      'q_imunisasi_hb': instance.q_imunisasi_hb,
      'q_skrining_hipotiroid_kongenital':
          instance.q_skrining_hipotiroid_kongenital,
      'date': instance.date,
      'time': instance.time,
      'no_batch': instance.no_batch,
      'bb': instance.weight,
      'tb': instance.height,
      'lingkar_kepala': instance.headCircum,
      'dirujuk_ke': instance.dirujuk_ke,
      'petugas': instance.petugas,
      'catatan_penting': instance.catatan_penting,
      'masalah': instance.masalah,
    };

NeonatalKn3Form _$NeonatalKn3FormFromJson(Map<String, dynamic> json) {
  return NeonatalKn3Form(
    q_menyusu: json['q_menyusu'] as int,
    q_tali_pusat: json['q_tali_pusat'] as int,
    q_tanda_bahaya: json['q_tanda_bahaya'] as int,
    q_identifikasi_kuning: json['q_identifikasi_kuning'] as int,
    q_imunisasi_hb: json['q_imunisasi_hb'] as int,
    q_kuning1: json['q_kuning1'] as int,
    q_kuning2: json['q_kuning2'] as int,
    q_kuning3: json['q_kuning3'] as int,
    q_kuning4: json['q_kuning4'] as int,
    q_kuning5: json['q_kuning5'] as int,
    dirujuk_ke: json['dirujuk_ke'] as String,
    petugas: json['petugas'] as String,
    catatan_penting: json['catatan_penting'] as String,
    masalah: json['masalah'] as String,
  );
}

Map<String, dynamic> _$NeonatalKn3FormToJson(NeonatalKn3Form instance) =>
    <String, dynamic>{
      'q_menyusu': instance.q_menyusu,
      'q_tali_pusat': instance.q_tali_pusat,
      'q_tanda_bahaya': instance.q_tanda_bahaya,
      'q_identifikasi_kuning': instance.q_identifikasi_kuning,
      'q_imunisasi_hb': instance.q_imunisasi_hb,
      'q_kuning1': instance.q_kuning1,
      'q_kuning2': instance.q_kuning2,
      'q_kuning3': instance.q_kuning3,
      'q_kuning4': instance.q_kuning4,
      'q_kuning5': instance.q_kuning5,
      'dirujuk_ke': instance.dirujuk_ke,
      'petugas': instance.petugas,
      'catatan_penting': instance.catatan_penting,
      'masalah': instance.masalah,
    };

AllNeonatalForm _$AllNeonatalFormFromJson(Map<String, dynamic> json) {
  return AllNeonatalForm(
    sixHour: json['six_hours'] == null
        ? null
        : Neonatal6HourForm.fromJson(json['six_hours'] as Map<String, dynamic>),
    kn1: json['kn_1'] == null
        ? null
        : NeonatalKn1Form.fromJson(json['kn_1'] as Map<String, dynamic>),
    kn2: json['kn_2'] == null
        ? null
        : NeonatalKn2Form.fromJson(json['kn_2'] as Map<String, dynamic>),
    kn3: json['kn_3'] == null
        ? null
        : NeonatalKn3Form.fromJson(json['kn_3'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AllNeonatalFormToJson(AllNeonatalForm instance) =>
    <String, dynamic>{
      'six_hours': instance.sixHour,
      'kn_1': instance.kn1,
      'kn_2': instance.kn2,
      'kn_3': instance.kn3,
    };
