import 'package:common/arch/data/remote/model/baby_overview_api_model.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_data.g.dart';

class BabyAgeOverview {
  final int year; //If 0, it won't be displayed on screen. This applies to other fields.
  final int month;
  final int day;

  BabyAgeOverview({
    required this.year,
    required this.month,
    required this.day,
  });
}

class BabyFormMenuData {
  final int id;
  final int year;
  final int monthStart;
  final int monthEnd;

  BabyFormMenuData({
    required this.id,
    required this.year,
    required this.monthStart,
    required this.monthEnd,
  });

  factory BabyFormMenuData.fromResponse(BabyHomeChildYearFormResponse response) => BabyFormMenuData(
    year: response.year,
    monthStart: (response.year -1) *12,
    monthEnd: response.year *12,
    id: response.id,
  );
}

@JsonSerializable()
class BabyGrowthCheck {
  final String date;
  final String location;
  final int age;
  @JsonKey(name: Const.KEY_WEIGHT)
  final num weight;
  @JsonKey(name: Const.KEY_HEIGHT)
  final num height;
  @JsonKey(name: Const.KEY_HEAD_CIRCUM)
  final num headCircum;
  @JsonKey(name: Const.KEY_IMT)
  final num bmi;
  @JsonKey(name: Const.KEY_CHECKER)
  final String checkerName;

  BabyGrowthCheck({
    required this.date,
    required this.location,
    required this.age,
    required this.weight,
    required this.height,
    required this.headCircum,
    required this.bmi,
    required this.checkerName,
  });

  factory BabyGrowthCheck.fromJson(Map<String, dynamic> map) => _$BabyGrowthCheckFromJson(map);
  Map<String, dynamic> toJson() => _$BabyGrowthCheckToJson(this);
}


@JsonSerializable()
class Neonatal6HourForm {
  @JsonKey(name: Const.KEY_WEIGHT)
  final num weight;
  @JsonKey(name: Const.KEY_HEIGHT)
  final num height;
  @JsonKey(name: Const.KEY_HEAD_CIRCUM)
  final num headCircum;
  final int q_imd;
  final int q_vit_k1;
  final int q_salep;
  final int q_imunisasi_hb;
  final String date;
  final String time;
  final String no_batch;
  final String dirujuk_ke;
  final String petugas;
  final String catatan_penting;
  //final int monthly_checkup_id;

  Neonatal6HourForm({
    required this.weight,
    required this.height,
    required this.headCircum,
    required this.q_imd,
    required this.q_vit_k1,
    required this.q_salep,
    required this.q_imunisasi_hb,
    required this.date,
    required this.time,
    required this.no_batch,
    required this.dirujuk_ke,
    required this.petugas,
    required this.catatan_penting,
  });

  factory Neonatal6HourForm.fromJson(Map<String, dynamic> map) => _$Neonatal6HourFormFromJson(map);
  Map<String, dynamic> toJson() => _$Neonatal6HourFormToJson(this);
}


@JsonSerializable()
class NeonatalKn1Form {
  final int q_menyusu;
  final int q_tali_pusat;
  final int q_vit_k1;
  final int q_salep;
  final int q_imunisasi_hb;
  final int q_skrining_hipotiroid_kongenital;
  final String date;
  final String time;
  final String no_batch;
  @JsonKey(name: Const.KEY_WEIGHT)
  final num weight;
  @JsonKey(name: Const.KEY_HEIGHT)
  final num height;
  @JsonKey(name: Const.KEY_HEAD_CIRCUM)
  final num headCircum;
  final String dirujuk_ke;
  final String petugas;
  final String catatan_penting;
  final String masalah;
  //final int monthly_checkup_id;

  NeonatalKn1Form({
    required this.q_menyusu,
    required this.q_tali_pusat,
    required this.q_vit_k1,
    required this.q_salep,
    required this.q_imunisasi_hb,
    required this.q_skrining_hipotiroid_kongenital,
    required this.date,
    required this.time,
    required this.no_batch,
    required this.weight,
    required this.height,
    required this.headCircum,
    required this.dirujuk_ke,
    required this.petugas,
    required this.catatan_penting,
    required this.masalah,
    //required this.monthly_checkup_id,
  });

  factory NeonatalKn1Form.fromJson(Map<String, dynamic> map) => _$NeonatalKn1FormFromJson(map);
  Map<String, dynamic> toJson() => _$NeonatalKn1FormToJson(this);
}

@JsonSerializable()
class NeonatalKn2Form {
  final int q_menyusu;
  final int q_tali_pusat;
  final int q_tanda_bahaya;
  final int q_identifikasi_kuning;
  final int q_imunisasi_hb;
  final int q_skrining_hipotiroid_kongenital;
  final String date;
  final String time;
  final String no_batch;
  @JsonKey(name: Const.KEY_WEIGHT)
  final num weight;
  @JsonKey(name: Const.KEY_HEIGHT)
  final num height;
  @JsonKey(name: Const.KEY_HEAD_CIRCUM)
  final num headCircum;
  final String dirujuk_ke;
  final String petugas;
  final String catatan_penting;
  final String masalah;
  //final int monthly_checkup_id;

  NeonatalKn2Form({
    required this.q_menyusu,
    required this.q_tali_pusat,
    required this.q_tanda_bahaya,
    required this.q_identifikasi_kuning,
    required this.q_imunisasi_hb,
    required this.q_skrining_hipotiroid_kongenital,
    required this.date,
    required this.time,
    required this.no_batch,
    required this.weight,
    required this.height,
    required this.headCircum,
    required this.dirujuk_ke,
    required this.petugas,
    required this.catatan_penting,
    required this.masalah,
    //required this.monthly_checkup_id,
  });

  factory NeonatalKn2Form.fromJson(Map<String, dynamic> map) => _$NeonatalKn2FormFromJson(map);
  Map<String, dynamic> toJson() => _$NeonatalKn2FormToJson(this);
}


@JsonSerializable()
class NeonatalKn3Form {
  final int q_menyusu;
  final int q_tali_pusat;
  final int q_tanda_bahaya;
  final int q_identifikasi_kuning;
  final int q_imunisasi_hb;
  final int q_kuning1;
  final int q_kuning2;
  final int q_kuning3;
  final int q_kuning4;
  final int q_kuning5;
  final String dirujuk_ke;
  final String petugas;
  final String catatan_penting;
  final String masalah;
  //final int monthly_checkup_id;

  NeonatalKn3Form({
    required this.q_menyusu,
    required this.q_tali_pusat,
    required this.q_tanda_bahaya,
    required this.q_identifikasi_kuning,
    required this.q_imunisasi_hb,
    required this.q_kuning1,
    required this.q_kuning2,
    required this.q_kuning3,
    required this.q_kuning4,
    required this.q_kuning5,
    required this.dirujuk_ke,
    required this.petugas,
    required this.catatan_penting,
    required this.masalah,
    //required this.monthly_checkup_id,
  });

  factory NeonatalKn3Form.fromJson(Map<String, dynamic> map) => _$NeonatalKn3FormFromJson(map);
  Map<String, dynamic> toJson() => _$NeonatalKn3FormToJson(this);
}
