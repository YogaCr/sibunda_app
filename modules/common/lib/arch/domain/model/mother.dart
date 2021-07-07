
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mother.g.dart';

@JsonSerializable()
class Mother {
  @JsonKey(name: Const.KEY_NAME_INDO)
  final String name;
  @JsonKey(name: Const.KEY_NIK)
  final String nik;
  @JsonKey(name: Const.KEY_SALARY)
  final String salary;
  @JsonKey(name: Const.KEY_JKN)
  final String jkn;
  @JsonKey(name: Const.KEY_FASKES1)
  final String faskes1;
  @JsonKey(name: Const.KEY_FASKES_RUJUKAN)
  final String faskesRujukan;
  @JsonKey(name: Const.KEY_BLOOD_TYPE)
  final String bloodType;
  @JsonKey(name: Const.KEY_BIRTH_PLACE)
  final int birthCity; // city id.
  @JsonKey(name: Const.KEY_BIRTH_DATE)
  final String birthDate;
  @JsonKey(name: Const.KEY_EDUCATION)
  final String education;
  @JsonKey(name: Const.KEY_OCCUPANCY)
  final String occupancy;
  @JsonKey(name: Const.KEY_ADDRESS)
  final String address;
  @JsonKey(name: Const.KEY_PHONE)
  final String phone;
  @JsonKey(name: Const.KEY_PUSKESMAS_DOMISILI)
  final String puskesmasDomisili;
  @JsonKey(name: Const.KEY_COHORT_REG)
  final String cohortRegistNo;

  Mother({
    required this.name,
    required this.nik,
    required this.salary,
    required this.jkn,
    required this.faskes1,
    required this.faskesRujukan,
    required this.bloodType,
    required this.birthCity,
    required this.birthDate,
    required this.education,
    required this.occupancy,
    required this.address,
    required this.phone,
    required this.puskesmasDomisili,
    required this.cohortRegistNo,
  });

  factory Mother.from(Map<String, String> map) => Mother(
    puskesmasDomisili: map[Const.KEY_PUSKESMAS_DOMISILI]!,
    cohortRegistNo: map[Const.KEY_COHORT_REG]!,
    name: map[Const.KEY_NAME_INDO]!,
    nik: map[Const.KEY_NIK]!,
    salary: map[Const.KEY_SALARY]!,
    jkn: map[Const.KEY_JKN]!,
    faskes1: map[Const.KEY_FASKES1]!,
    faskesRujukan: map[Const.KEY_FASKES_RUJUKAN]!,
    bloodType: map[Const.KEY_BLOOD_TYPE]!,
    birthCity: int.parse(map[Const.KEY_BIRTH_PLACE]!),
    birthDate: map[Const.KEY_BIRTH_DATE]!,
    education: map[Const.KEY_EDUCATION]!,
    occupancy: map[Const.KEY_OCCUPANCY]!,
    address: map[Const.KEY_ADDRESS]!,
    phone: map[Const.KEY_PHONE]!,
  );

  factory Mother.fromJson(Map<String, dynamic> json) => _$MotherFromJson(json);
  Map<String, dynamic> get toJson => _$MotherToJson(this);
}