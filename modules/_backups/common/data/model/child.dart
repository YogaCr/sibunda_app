
import 'package:common/value/const_values.dart';

class Child {
  final String name;
  final int childOrder;
  final String gender; //'M' or 'F'
  final String birthCertificateNo;
  final String nik;
  final String bloodType;
  final String birthCity;
  final String birthDate;
  final String jkn;
  final String jknStartDate;
  final String babyCohortRegistNo;
  final String toddlerCohortRegistNo;
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
    birthCity: map[Const.KEY_BIRTH_PLACE]!,
    birthDate: map[Const.KEY_BIRTH_DATE]!,
    childOrder: int.parse(map[Const.KEY_CHILD_ORDER]!),
    gender: map[Const.KEY_GENDER]!,
    birthCertificateNo: map[Const.KEY_BIRTH_CERT_NO]!,
    jknStartDate: map[Const.KEY_JKN_START_DATE]!,
    babyCohortRegistNo: map[Const.KEY_BABY_COHORT_REG]!,
    toddlerCohortRegistNo: map[Const.KEY_TODDLER_COHORT_REG]!,
    hospitalMedicalNumber: map[Const.KEY_HOSPITAL_MEDIC_NO]!,
  );
}