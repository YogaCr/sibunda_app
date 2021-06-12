import 'package:common/data/model/auth_data.dart';

import 'model/family_data.dart';
import 'model/kehamilanku_data.dart';

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

PregnancyCheck dummyPregnancyCheck(int week) => PregnancyCheck(
  visitDate: "6 Okt 2021",
  visitPlace: "Surabaya",
  checkerName: "Suster Ami",
  difficulty: "Boyok",
  pregnancyAge: week,
  babyGender: "M",
  futureVisitDate: "13 Okt 2021",
  HPHT: "10 Nov 2020",
  HPL: "10 Nov 2021",
  motherWeigth: 100,
  motherWeigthDiff: 10,
  motherHeight: 120,
  TFU: 10,
  DJJ: 100,
  systolicPressure: 110,
  diastolicPressure: 70,
  MAP: 120,
  babyMovement: "Lincah bun",
  drugPrescript: 'Paracetamol',
  drugAllergy: "-",
  diseaseHistory: "-",
  note: "-",
);

final dummyPregnancyAgeOverview = MotherPregnancyAgeOverview(weekAge: 2, daysRemaining: 256);

final dummyTrimesterList = <MotherTrimester>[
  MotherTrimester(trimester: 1, startWeek: 0, endWeek: 12, imgLink: "",),
  MotherTrimester(trimester: 2, startWeek: 13, endWeek: 24, imgLink: "",),
  MotherTrimester(trimester: 3, startWeek: 25, endWeek: 40, imgLink: "",),
];

List<MotherFoodRecom> dummyFoodRecomList(int week) => [
  MotherFoodRecom(food: "Beras", desc: "Makan nasi biar kenyang", imgLink: "https://begnimbe.com/wp-content/uploads/2021/03/Buford-FrenchRice.jpg"),
  MotherFoodRecom(food: "Kacang", desc: "Kacang dapat mengenyangkan jika dimakan dalam skala besar", imgLink: "https://www.jessicagavin.com/wp-content/uploads/2020/05/how-to-cook-pinto-beans-6-1200.jpg"),
  MotherFoodRecom(food: "Susu", desc: "Biar pola makan sempurna, minum susu.", imgLink: "https://www2.biomin.net/fileadmin/user_upload/Articles/2019/Boosting_milk_yield/Milk-production-in-heifers-fed-Digestarom-Dairy-increased-by-0.7-kg-per-day.jpg"),
];

final dummyPregnancyBabySize = PregnancyBabySize(sizeString: "Selada Kampung", babyWeight: 18.3, babyLen: 5.1,);