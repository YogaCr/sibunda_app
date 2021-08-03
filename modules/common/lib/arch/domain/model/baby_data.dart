import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/remote/model/baby_neonatal_form_api_model.dart';
import 'package:common/arch/data/remote/model/baby_overview_api_model.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:core/util/_consoles.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../dummy_data.dart';

part 'baby_data.g.dart';

class BabyFormId extends Equatable {
  final int yearId;
  final int month;
  final int? checkUpId;

  BabyFormId({
    required this.yearId,
    required this.month,
    this.checkUpId,
  });

  @override
  List<Object?> get props => [yearId, month, checkUpId,];
}

class BabyAgeOverview {
  /*
  final int year; //If 0, it won't be displayed on screen. This applies to other fields.
  final int month;
  final int day;
   */
  final String desc;
  final ImgData img;

  BabyAgeOverview({
    required this.desc,
    required this.img,
  });

  factory BabyAgeOverview.fromResponse(BabyHomeChildResponse response) => BabyAgeOverview(
    desc: response.age,
    img: imgBabyAgeOverview,
  );
}

class BabyFormMenuData {
  final int id;
  final int year;
  final int monthStart;
  final int monthEnd;
  final ImgData img;

  BabyFormMenuData({
    required this.id,
    required this.year,
    required this.monthStart,
    required this.monthEnd,
    required this.img,
  });

  factory BabyFormMenuData.fromResponse(BabyHomeChildYearFormResponse response) => BabyFormMenuData(
    year: response.year,
    monthStart: (response.year -1) *12 +(response.year == 1 ? 0 : 1),
    monthEnd: response.year *12,
    id: response.id,
    img: ImgData(
      link: response.img_url,
      src: ImgSrc.network,
    ),
  );
}

class BabyOverlayData extends Equatable {
  final int id;
  final String name;
  final String nik;
  final DateTime date; //can be either date of birth or HPL.
      // BTW, if `date` is still in future, it means that the `date` is for HPL.
  final ImgData img;

  BabyOverlayData({
    required this.id,
    required this.name,
    required this.nik,
    required this.date,
    required this.img,
  });

  factory BabyOverlayData.fromProfile(Profile profile) => BabyOverlayData(
    id: profile.id,
    nik: profile.nik,
    name: profile.name,
    date: profile.birthDate,
    img: profile.img,
  );

  factory BabyOverlayData.fromProfileEntity(ProfileEntity profile) => BabyOverlayData(
    id: profile.serverId,
    nik: profile.nik,
    name: profile.name,
    date: profile.birthDate,
    img: dummyImg_profile,
  );
  factory BabyOverlayData.fromProfileEntityAsUnborn({
    required ProfileEntity profile,
    required DateTime hpl,
  }) => BabyOverlayData(
    id: profile.serverId,
    nik: profile.nik,
    name: Strings.baby_candidate,
    date: hpl,
    img: dummyImg_profile,
  );
  factory BabyOverlayData.fromPregnancyEntity({
    required PregnancyEntity entity,
    Profile? profile,
  }) {
    /*
    We decide to not filter the `profile`, cuz `PregnancyEntity.id` is not contained in `Profile`.
    if(profile != null && profile.id != entity.id) {
      prinw("`profile` != null but `profile.id` (${profile.id}) != `entity.id` (${entity.id}). Then, `profile` will be ignored.");
      profile = null;
    }
     */
    return BabyOverlayData(
      id: profile?.id ?? entity.id,
      nik: profile?.nik ?? "<fetus_nik>",
      name: profile?.name ?? Strings.baby_candidate,
      date: entity.hpl,
      img: profile?.img ?? dummyImg_profile,
    );
  }

  @override
  List<Object?> get props => [id, name, date, img];
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

  factory Neonatal6HourForm.fromResponse(Neonatal6HourFormBody response) {
    final map = response.toJson();
    return Neonatal6HourForm.fromJson(map);
  }
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

  factory NeonatalKn1Form.fromResponse(NeonatalKn1FormBody response) {
    final map = response.toJson();
    return NeonatalKn1Form.fromJson(map);
  }
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

  factory NeonatalKn2Form.fromResponse(NeonatalKn2FormBody response) {
    final map = response.toJson();
    return NeonatalKn2Form.fromJson(map);
  }
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

  factory NeonatalKn3Form.fromResponse(NeonatalKn3FormBody response) {
    final map = response.toJson();
    return NeonatalKn3Form.fromJson(map);
  }
}


@JsonSerializable()
class AllNeonatalForm {
  @JsonKey(name: "six_hours")
  final Neonatal6HourForm? sixHour;
  @JsonKey(name: "kn_1")
  final NeonatalKn1Form? kn1;
  @JsonKey(name: "kn_2")
  final NeonatalKn2Form? kn2;
  @JsonKey(name: "kn_3")
  final NeonatalKn3Form? kn3;

  AllNeonatalForm({
    required this.sixHour,
    required this.kn1,
    required this.kn2,
    required this.kn3,
  });

  factory AllNeonatalForm.fromJson(Map<String, dynamic> map) => _$AllNeonatalFormFromJson(map);
  Map<String, dynamic> toJson() => _$AllNeonatalFormToJson(this);

  factory AllNeonatalForm.fromResponse(NeonatalResponse response) {
    final map = response.data.toJson();
    return AllNeonatalForm.fromJson(map);
  }
}
