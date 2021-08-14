
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'child.g.dart';

@JsonSerializable()
class Child {
  @JsonKey(name: Const.KEY_NAME_INDO)
  final String name;
  @JsonKey(name: Const.KEY_CHILD_ORDER)
  final int childOrder;
  @JsonKey(name: Const.KEY_BABY_GENDER)
  final String gender; //'M' or 'F'
  @JsonKey(name: Const.KEY_BIRTH_CERT_NO)
  final String birthCertificateNo;
  @JsonKey(name: Const.KEY_NIK)
  final String nik;
  @JsonKey(name: Const.KEY_BLOOD_TYPE)
  final String bloodType;
  @JsonKey(name: Const.KEY_BIRTH_PLACE)
  final int birthCity;
  @JsonKey(name: Const.KEY_BIRTH_DATE)
  final String birthDate;
  @JsonKey(name: Const.KEY_JKN)
  final String jkn;
  @JsonKey(name: Const.KEY_JKN_START_DATE)
  final String jknStartDate;
  @JsonKey(name: Const.KEY_BABY_COHORT_REG)
  final String babyCohortRegistNo;
  @JsonKey(name: Const.KEY_TODDLER_COHORT_REG)
  final String? toddlerCohortRegistNo;
  @JsonKey(name: Const.KEY_HOSPITAL_MEDIC_NO)
  final String hospitalMedicalNumber;

  Child({
    required this.name,
    required this.childOrder,
    required this.gender, //'M' or 'F'
    required this.birthCertificateNo,
    required this.nik,
    required this.bloodType,
    required this.birthCity,
    required this.birthDate,
    required this.jkn,
    required this.jknStartDate,
    required this.babyCohortRegistNo,
    required this.toddlerCohortRegistNo,
    required this.hospitalMedicalNumber,
  });

  factory Child.from(Map<String, String> map) => Child(
    name: map[Const.KEY_NAME]!,
    nik: map[Const.KEY_NIK]!,
    jkn: map[Const.KEY_JKN]!,
    bloodType: map[Const.KEY_BLOOD_TYPE]!,
    birthCity: int.parse(map[Const.KEY_BIRTH_PLACE]!),
    birthDate: map[Const.KEY_BIRTH_DATE]!,
    childOrder: int.parse(map[Const.KEY_CHILD_ORDER]!),
    gender: map[Const.KEY_GENDER]!,
    birthCertificateNo: map[Const.KEY_BIRTH_CERT_NO]!,
    jknStartDate: map[Const.KEY_JKN_START_DATE]!,
    babyCohortRegistNo: map[Const.KEY_BABY_COHORT_REG]!,
    toddlerCohortRegistNo: map[Const.KEY_TODDLER_COHORT_REG],
    hospitalMedicalNumber: map[Const.KEY_HOSPITAL_MEDIC_NO]!,
  );

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
  Map<String, dynamic> get toJson => _$ChildToJson(this);
}