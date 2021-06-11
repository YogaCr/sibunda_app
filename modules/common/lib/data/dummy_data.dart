import 'package:common/data/model/auth_data.dart';

import 'model/family_data.dart';

final dummyAccessToken = "aagajki1831huhf1i38y13";
final dummySignUpData1 = SignUpData(name: "ayu", email: "a@a.a", password: "ayu123");
final dummyLoginData1 = LoginData(email: dummySignUpData1.email, password: dummySignUpData1.password);
final dummySessionData1 = SessionData(dummyAccessToken);


final dummyFather = Father(
  name: "Pak Jo",
  nik: "15000",
  salary: 21000,
  jkn: "JKN Kis 10",
  faskes1: "Kamar rumah",
  faskesRujukan: "Puskesmas 10",
  bloodType: "B",
  birthCity: "Jonggol",
  birthDate: "17 Agustus 1949",
  education: "S4",
  occupancy: "Buruh halus",
  address: "Jl. In Aja Dulu",
  phone: "08123123123123",
);

final dummyMother = Mother(
  name: "Bu Lan",
  nik: "15001",
  salary: 0,
  jkn: "JKN Kis 11",
  faskes1: "Kamar rumah",
  faskesRujukan: "Puskesmas 10",
  bloodType: "C",
  birthCity: "Konoha",
  birthDate: "6 Okt 1973",
  education: "SD",
  occupancy: "Ibu aja",
  address: "Jl. In Aja Dulu",
  phone: "08123456789",
  puskesmasDomisili: "Puskesmas 11",
  cohortRegistNo: "12312345",
);

final dummyChild = Child(
  name: "Anak sinkong",
  childOrder: 10,
  gender: "M",
  nik: "1201902",
  bloodType: "O",
  birthCity: "Asgard",
  birthDate: "12 Okt 2077",
  jkn: "JKN a",
  jknStartDate: "10 Okt 2021",
  babyCohortRegistNo: "12381927921",
  toddlerCohortRegistNo: "123121424",
  hospitalMedicalNumber: "12312412412412",
  birthCertificateNo: "12123124",
);