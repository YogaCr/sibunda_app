
import 'package:common/value/const_values.dart';

class Mother {
  final String name;
  final String nik;
  final int salary;
  final String jkn;
  final String faskes1;
  final String faskesRujukan;
  final String bloodType;
  final String birthCity;
  final String birthDate;
  final String education;
  final String occupancy;
  final String address;
  final String phone;
  final String puskesmasDomisili;
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
    name: map[Const.KEY_NAME]!,
    nik: map[Const.KEY_NIK]!,
    salary: int.parse(map[Const.KEY_SALARY]!),
    jkn: map[Const.KEY_JKN]!,
    faskes1: map[Const.KEY_FASKES1]!,
    faskesRujukan: map[Const.KEY_FASKES_RUJUKAN]!,
    bloodType: map[Const.KEY_BLOOD_TYPE]!,
    birthCity: map[Const.KEY_BIRTH_PLACE]!,
    birthDate: map[Const.KEY_BIRTH_DATE]!,
    education: map[Const.KEY_EDUCATION]!,
    occupancy: map[Const.KEY_OCCUPANCY]!,
    address: map[Const.KEY_ADDRESS]!,
    phone: map[Const.KEY_PHONE]!,
  );
}