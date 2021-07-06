import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_neonatal_form_api_model.g.dart';


@JsonSerializable()
class Neonatal6HourFormBody {
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
  final int monthly_checkup_id;

  Neonatal6HourFormBody({
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
    required this.monthly_checkup_id,
  });

  factory Neonatal6HourFormBody.fromJson(Map<String, dynamic> map) => _$Neonatal6HourFormBodyFromJson(map);
  Map<String, dynamic> toJson() => _$Neonatal6HourFormBodyToJson(this);

  factory Neonatal6HourFormBody.fromModel(Neonatal6HourForm model, {
    required int monthly_checkup_id,
  }) {
    final map = model.toJson();
    map["monthly_checkup_id"] = monthly_checkup_id;
    return Neonatal6HourFormBody.fromJson(map);
  }
}

/// This is for KN1 and KN2 form.
@JsonSerializable()
class NeonatalKn1n2FormBody {
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
  final int monthly_checkup_id;

  NeonatalKn1n2FormBody({
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
  required this.monthly_checkup_id,
  });

  factory NeonatalKn1n2FormBody.fromJson(Map<String, dynamic> map) => _$NeonatalKn1n2FormBodyFromJson(map);
  Map<String, dynamic> toJson() => _$NeonatalKn1n2FormBodyToJson(this);

  factory NeonatalKn1n2FormBody.fromModel(NeonatalKn1n2Form model, {
    required int monthly_checkup_id,
  }) {
    final map = model.toJson();
    map["monthly_checkup_id"] = monthly_checkup_id;
    return NeonatalKn1n2FormBody.fromJson(map);
  }
}


@JsonSerializable()
class NeonatalKn3FormBody {
  final int q_menyusu;
  final int q_tali_pusat;
  final int q_vit_k1;
  final int q_salep;
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
  final int monthly_checkup_id;

  NeonatalKn3FormBody({
    required this.q_menyusu,
    required this.q_tali_pusat,
    required this.q_vit_k1,
    required this.q_salep,
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
    required this.monthly_checkup_id,
  });

  factory NeonatalKn3FormBody.fromJson(Map<String, dynamic> map) => _$NeonatalKn3FormBodyFromJson(map);
  Map<String, dynamic> toJson() => _$NeonatalKn3FormBodyToJson(this);

  factory NeonatalKn3FormBody.fromModel(NeonatalKn3Form model, {
    required int monthly_checkup_id,
  }) {
    final map = model.toJson();
    map["monthly_checkup_id"] = monthly_checkup_id;
    return NeonatalKn3FormBody.fromJson(map);
  }
}

