export 'father.dart';
export 'mother.dart';
export 'child.dart';

class FamilyMember {
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

  FamilyMember({
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
  });
}
/*
class Mother extends FamilyMember {
  final String puskesmasDomisili;
  final String cohortRegistNo;

  Mother({
    required this.puskesmasDomisili,
    required this.cohortRegistNo,
    required String name,
    required String nik,
    required int salary,
    required String jkn,
    required String faskes1,
    required String faskesRujukan,
    required String bloodType,
    required String birthCity,
    required String birthDate,
    required String education,
    required String occupancy,
    required String address,
    required String phone,
  }) : super(
    name: name,
    nik: nik,
    salary: salary,
    jkn: jkn,
    faskes1: faskes1,
    faskesRujukan: faskesRujukan,
    bloodType: bloodType,
    birthCity: birthCity,
    birthDate: birthDate,
    education: education,
    occupancy: occupancy,
    address: address,
    phone: phone,
  );

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

class Father extends FamilyMember {
  Father({
    required String name,
    required String nik,
    required int salary,
    required String jkn,
    required String faskes1,
    required String faskesRujukan,
    required String bloodType,
    required String birthCity,
    required String birthDate,
    required String education,
    required String occupancy,
    required String address,
    required String phone,
  }) : super(
    name: name,
    nik: nik,
    salary: salary,
    jkn: jkn,
    faskes1: faskes1,
    faskesRujukan: faskesRujukan,
    bloodType: bloodType,
    birthCity: birthCity,
    birthDate: birthDate,
    education: education,
    occupancy: occupancy,
    address: address,
    phone: phone,
  );

  factory Father.from(Map<String, String> map) => Father(
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
 */