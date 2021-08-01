import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/util/map_util.dart';
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

  factory Neonatal6HourFormBody.fromJson(Map<String, dynamic> map) =>
      _$Neonatal6HourFormBodyFromJson(
          parseAllParsableValuesToNum(
              parseAllBoolToNum(map)
          )
      );
  Map<String, dynamic> toJson() => _$Neonatal6HourFormBodyToJson(this);

  factory Neonatal6HourFormBody.fromModel(Neonatal6HourForm model, {
    required int monthly_checkup_id,
  }) {
    final map = model.toJson();
    map["monthly_checkup_id"] = monthly_checkup_id;
    return Neonatal6HourFormBody.fromJson(map);
  }
}


@JsonSerializable()
class NeonatalKn1FormBody {
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

  NeonatalKn1FormBody({
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

  factory NeonatalKn1FormBody.fromJson(Map<String, dynamic> map) =>
      _$NeonatalKn1FormBodyFromJson(
          parseAllParsableValuesToNum(
              parseAllBoolToNum(map)
          )
      );
  Map<String, dynamic> toJson() => _$NeonatalKn1FormBodyToJson(this);

  factory NeonatalKn1FormBody.fromModel(NeonatalKn1Form model, {
    required int monthly_checkup_id,
  }) {
    final map = model.toJson();
    map["monthly_checkup_id"] = monthly_checkup_id;
    return NeonatalKn1FormBody.fromJson(map);
  }
}

@JsonSerializable()
class NeonatalKn2FormBody {
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
  final int monthly_checkup_id;

  NeonatalKn2FormBody({
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
  required this.monthly_checkup_id,
  });

  factory NeonatalKn2FormBody.fromJson(Map<String, dynamic> map) =>
      _$NeonatalKn2FormBodyFromJson(
          parseAllParsableValuesToNum(
              parseAllBoolToNum(map)
          )
      );
  Map<String, dynamic> toJson() => _$NeonatalKn2FormBodyToJson(this);

  factory NeonatalKn2FormBody.fromModel(NeonatalKn2Form model, {
    required int monthly_checkup_id,
  }) {
    final map = model.toJson();
    map["monthly_checkup_id"] = monthly_checkup_id;
    return NeonatalKn2FormBody.fromJson(map);
  }
}


@JsonSerializable()
class NeonatalKn3FormBody {
  final int q_menyusu;
  final int q_tali_pusat;
  final int q_tanda_bahaya;
  final int q_identifikasi_kuning;
  //final int q_imunisasi_hb;
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
    required this.q_tanda_bahaya,
    required this.q_identifikasi_kuning,
    //required this.q_imunisasi_hb,
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

  factory NeonatalKn3FormBody.fromJson(Map<String, dynamic> map) =>
      _$NeonatalKn3FormBodyFromJson(
          parseAllParsableValuesToNum(
              parseAllBoolToNum(map)
          )
      );
  Map<String, dynamic> toJson() => _$NeonatalKn3FormBodyToJson(this);

  factory NeonatalKn3FormBody.fromModel(NeonatalKn3Form model, {
    required int monthly_checkup_id,
  }) {
    final map = model.toJson();
    map["monthly_checkup_id"] = monthly_checkup_id;
    return NeonatalKn3FormBody.fromJson(map);
  }
}


/*
================
Response
================
 */

@JsonSerializable()
class NeonatalResponse {
  final String message;
  final String status;
  final int code;
  final NeonatalDataResponse data;

  NeonatalResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory NeonatalResponse.fromJson(Map<String, dynamic> map) => _$NeonatalResponseFromJson(map);
  Map<String, dynamic> toJson() => _$NeonatalResponseToJson(this);
}

@JsonSerializable()
class NeonatalDataResponse {
  final Neonatal6HourFormBody? six_hours;
  final NeonatalKn1FormBody? kn_1;
  final NeonatalKn2FormBody? kn_2;
  final NeonatalKn3FormBody? kn_3;

  NeonatalDataResponse({
    required this.six_hours,
    required this.kn_1,
    required this.kn_2,
    required this.kn_3,
  });

  factory NeonatalDataResponse.fromJson(Map<String, dynamic> map) => _$NeonatalDataResponseFromJson(map);
  Map<String, dynamic> toJson() => _$NeonatalDataResponseToJson(this);
}