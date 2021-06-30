
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/config/routes.dart';
import 'package:common/res/string/_string.dart';
import 'package:core/domain/model/range.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'model/auth.dart';
import 'model/child.dart';
import 'model/covid_data.dart';
import 'model/education_data.dart';
import 'model/father.dart';
import 'model/form_warning_status.dart';
import 'model/immunization.dart';
import 'model/kehamilanku_data.dart';
import 'model/home_data.dart';
import 'model/mother.dart';
import 'model/notif_data.dart';
import 'model/profile_data.dart';

final faker = Faker();

final dummyImg = ImgData(link: "", isLocal: true);
final dummyImg_smillingCat = ImgData(link: "_smiling_cat.jpg", package: GlobalRoutes.common, isLocal: true);
final dummyImg_profile_sm = ImgData(link: "pic_profile_example.png", package: GlobalRoutes.common, isLocal: true);
final dummyImg_pick = ImgData(link: "ic_plus_color.png", package: GlobalRoutes.common, isLocal: true);
final dummyImg_profile = ImgData(link: "ic_profile.png", package: GlobalRoutes.common, isLocal: true);

final dummyEmail = "a@a.a";
final dummyName = "ayu";
final dummyPswd = "ayu123";

final dummyAccessToken = "aagajki1831huhf1i38y13";
final dummySignUpData1 = SignUpData(name: dummyName, email: dummyEmail, password: dummyPswd);
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


final dummyPregnancyAgeOverview = MotherPregnancyAgeOverview(weekAge: 2, daysRemaining: 256);
final dummyBabyAgeOverview = BabyAgeOverview(year: 1, month: 10, day: 3);


/*
=====================
Kehamilanku
=====================
 */
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

final dummyPregnancyBabySizes = <PregnancyBabySize>[
  PregnancyBabySize(sizeString: "Selada Kampung", babyWeight: 18.3, babyLen: 5.1,),
  PregnancyBabySize(sizeString: "Selada Hijau", babyWeight: 28.3, babyLen: 6.1,),
  PregnancyBabySize(sizeString: "Selada Kuning", babyWeight: 58.3, babyLen: 9.1,),
  PregnancyBabySize(sizeString: "Selada Merah", babyWeight: 98.3, babyLen: 19.1,),
];

PregnancyBabySize dummyPregnancyBabySize(int week) => dummyPregnancyBabySizes[week % dummyPregnancyBabySizes.length];

final dummyProfile = Profile(
  name: dummyName,
  email: dummyEmail,
  img: dummyImg_profile_sm,
);

final dummyStatusList = <HomeStatus>[
  HomeStatus(desc: "Selamat Berat Badan Bunda Normal", imgLink: "", color: Colors.green,),
  HomeStatus(desc: "Gerakan Anak Bunda Kurang Nih Bun!", imgLink: "", color: Colors.red,),
];

final dummyMenuList = <HomeMenu>[
  HomeMenu(name: Strings.my_pregnancy, moduleName: GlobalRoutes.kehamilanku, imgLink: "",),
  HomeMenu(name: Strings.my_baby, moduleName: GlobalRoutes.bayiku, imgLink: "",),
  HomeMenu(name: Strings.covid_19, moduleName: GlobalRoutes.covid19, imgLink: "",),
];

final dummyTipsList = <Tips>[
  Tips(title: "Nih Bun 5 Makanan Rekomendasi untuk Bunda Hamil Trimester 2", kind: "Kehamilan", img: dummyImg,),
  Tips(title: "Perkembangan Janin Usia 9 Minggu Kehamilan, Yuk Bun Ketahui Selengkapnya!", kind: "Kehamilan", img: dummyImg_smillingCat,),
  Tips(title: "Yuk Bun Ketahui Pola Asuh Bayi Baru Lahir Sampai Usia 1,5 Tahun", kind: "Kehamilan", img: dummyImg,),
  Tips(title: "Bagaimana Cara Memberikan ASI ke Bayi Baru Lahir 0-28 Hari (Neonatus)?", kind: "Kehamilan", img: dummyImg,),
];

final List<TipsDetail> dummyTipsDetailList = List.generate(dummyTipsList.length, (i) => TipsDetail(
  tips: dummyTipsList[i],
  desc: faker.lorem.words(700).join(" "),
  date: DateTime.now().add(Duration(days: i)),
));

final dummyNotifList = <HomeNotifMsg>[
  HomeNotifMsg(title: "Selamat Datang di SiBunda", desc: "Satu aplikasi untuk semua tahap kehamilan dan kesehatan bayi bunda, mulai dari usia 0 - 6 tahun", time: "12.00 - 11/05/2021", imgLink: "",),
  HomeNotifMsg(title: "Sudahkah Anda Mandi?", desc: "Mandi dapat menyegarkan badan", time: "12.00 - 11/05/2021", imgLink: "",),
  HomeNotifMsg(title: "Tahu kah Anda?", desc: "Minum air 1 liter per hari dapat menghilangkan rasa haus", time: "12.00 - 11/05/2021", imgLink: "",),
];

final dummyMessageList = <HomeNotifMsg>[
  HomeNotifMsg(title: "Bunda, Pastikan Kehamilan Bunda Sehat Ya", desc: "Jangan lupa untuk periksa rutin ya, serta selalu isikan data perkembangan bunda dan calon buah hati di aplikasi ya.", time: "12.00 - 11/05/2021", imgLink: "",),
  HomeNotifMsg(title: "Sudahkah Anda Mandi?", desc: "Mandi dapat menyegarkan badan", time: "12.00 - 11/05/2021", imgLink: "",),
  HomeNotifMsg(title: "Tahu kah Anda?", desc: "Minum air 1 liter per hari dapat menghilangkan rasa haus", time: "12.00 - 11/05/2021", imgLink: "",),
];


//============ FormWarningStatus ==============

final motherWarningStatusList = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Berat Badan Bunda kurang sesuai ya Bun. ",
    action: "Lihat rekomendasi makanan",
    isSafe: false,
    imgLink: "",
  ),
  FormWarningStatus(
    desc: "Denyut Jantung Janin Bunda kurang ya. Silahkan periksa ke faskes ya Bun",
    action: "Cari Faskes terdekat",
    isSafe: false,
    imgLink: "",
  ),
  FormWarningStatus(
    desc: "Selamat Bunda! \nTinggi Fundus Uterus Bunda normal ya Bun.",
    action: "Cari Faskes terdekat",
    isSafe: true,
    imgLink: "",
  ),
];

final babyWarningStatusList = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bunda, berat badan bayi tidak normal ya Bun menurut usia bayi.",
    action: "Cari Faskes terdekat",
    isSafe: false,
    imgLink: "",
  ),
  FormWarningStatus(
    desc: "Selamat Bunda! \n Panjang badan atau tinggi badan menurut usia bayi normal.",
    action: "Cari Faskes terdekat",
    isSafe: true,
    imgLink: "",
  ),
  FormWarningStatus(
    desc: "Bunda, berat badan bayi menurut panjang/tinggi badan tidak normal.",
    action: "Cari Faskes terdekat",
    isSafe: false,
    imgLink: "",
  ),
];


// ========== Immunization ============
final motherImmunizationList = <ImmunizationData>[
  ImmunizationData(name: "Tetanus", date: "13 Desember 2020"),
  ImmunizationData(name: "Tetanus", date: "17 Desember 2020"),
  ImmunizationData(name: "Tetanus",),
  ImmunizationData(name: "Tetanus",),
  ImmunizationData(name: "Tetanus", date: "14 November 2021"),
  ImmunizationData(name: "Tetanus",),
];
final babyImmunizationList = <ImmunizationData>[
  ImmunizationData(name: "Hepatitis B (<24 Jam)", date: "13 Desember 2020"),
  ImmunizationData(name: "BCG", date: "17 Desember 2020"),
  ImmunizationData(name: "Polio Tetes 1",),
  ImmunizationData(name: "DPT-HB-Hib 1",),
  ImmunizationData(name: "Polio Tetes 2", date: "14 November 2021"),
  ImmunizationData(name: "DPT-HB-Hib 2",),
];

final motherImmunizationDetailList = motherImmunizationList.map((e) => ImmunizationDetail(
  immunization: e,
  noDetail: true,
)).toList(growable: false);
final babyImmunizationDetailList = babyImmunizationList.map((e) => ImmunizationDetail(
  immunization: e,
  monthRange: IntRange(0, 4),
  batchNo: e.date != null ? "001" : null,
)).toList(growable: false);


final motherImmunizationOverview = ImmunizationOverview(text: "Yuk cek apakah Bunda sudah mendapatkan semua imunisasi ya Bun", imgLink: "");
final babyImmunizationOverview = ImmunizationOverview(text: "Yuk cek apakah Bayi sudah mendapatkan semua imunisasi ya Bun", imgLink: "");

final motherImmunizationGroupList = <ImmunizationDetailGroup>[
  ImmunizationDetailGroup(
    immunizationList: motherImmunizationDetailList.sublist(0, 2),
    header: "Trimester 1",
  ),
  ImmunizationDetailGroup(
    immunizationList: motherImmunizationDetailList.sublist(2, 4),
    header: "Trimester 2",
  ),
  ImmunizationDetailGroup(
    immunizationList: motherImmunizationDetailList.sublist(4, 6),
    header: "Trimester 3",
  ),
];

final babyImmunizationGroupList = <ImmunizationDetailGroup>[
  ImmunizationDetailGroup(
    immunizationList: babyImmunizationDetailList.sublist(0, 2),
    header: "Bulan ke 0 - 2",
  ),
  ImmunizationDetailGroup(
    immunizationList: babyImmunizationDetailList.sublist(2, 4),
    header: "Bulan ke 3 - 4",
  ),
  ImmunizationDetailGroup(
    immunizationList: babyImmunizationDetailList.sublist(4, 6),
    header: "Bulan ke 5 - 20++",
  ),
];


final covidHomeOverview = CovidHomeOverview(
  title: "Bunda, jangan lupa tetap jaga kesehatan Bunda dan si Kecil ya",
  img: dummyImg,
);

final covidHomeMenu = <HomeGraphMenu>[
  HomeGraphMenu(
    name: "Cek Covid-19 untuk Bayi",
    img: dummyImg,
  ),
  HomeGraphMenu(
    name: "Cek Covid-19 untuk Bunda",
    img: dummyImg,
  ),
];

final covidHomeCheckHistory = <CovidCheckHistory>[
  CovidCheckHistory(
    date: "12 Januari 2020",
    person: "Bayi",
    img: dummyImg,
    category: CovidCategory.normal,
  ),
  CovidCheckHistory(
    date: "12 Januari 2020",
    person: "Bunda",
    img: dummyImg,
    category: CovidCategory.pdp,
  ),
];