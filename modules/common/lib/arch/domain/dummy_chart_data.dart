import 'dart:math';

import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';

import 'model/chart_data_baby.dart';


// ================ Mother =================

final _motherTfuLimit_low = 18;
final motherTfuData = List<MotherTfuChartData>.generate(21, (i) => MotherTfuChartData(
  week: i,
  upperLimit: _motherTfuLimit_low +i +4,
  lowerLimit: _motherTfuLimit_low +i,
  normalLimit: _motherTfuLimit_low +i +2,
  observed: Random.secure().nextInt(_motherTfuLimit_low +i +10),
));
final motherTfuWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "TFU Bunda tidak normal ya Bun. Bisa konsultasikan ke dokter terdekat ya",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];

final motherDjjData = List<MotherDjjChartData>.generate(21, (i) => MotherDjjChartData(
  week: i,
  upperLimit: 160,
  lowerLimit: 100,
  observed: Random.secure().nextInt(160 +30),
));
final motherDjjWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Denyut Jantung Janin Bunda kurang ya. Silahkan periksa ke faskes ya Bun",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];

final motherMapData = List<MotherMapChartData>.generate(21, (i) => MotherMapChartData(
  week: i,
  lowerLimit: 90,
  observed: Random.secure().nextInt(90 +30),
));
final motherMapWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bunda beresiko mengalami preeklamsia. Segera menghubungi dokter ya Bun",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];

final motherBmiData = List<MotherBmiChartData>.generate(21, (i) => MotherBmiChartData(
  week: i,
  obeseLimit: 30,
  overLimit: 25,
  normalLimit: 18.5,
  observed: Random.secure().nextInt(30 +30),
));
final motherBmiWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bunda obesitas ya bun",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];




// ================ Baby =================

final _babyWeightLimit_low = 2;
final babyWeightChartData = List<BabyWeightChartData>.generate(21, (i) => BabyWeightChartData(
  age: i,
  min3sd: _babyWeightLimit_low +(i*2),
  min2sd: _babyWeightLimit_low +(i*3) +1,
  min1sd: _babyWeightLimit_low +(i*3) +4,
  medianSd: _babyWeightLimit_low +(i*4) +1,
  plus1sd: _babyWeightLimit_low +(i*5) +1,
  plus2sd: _babyWeightLimit_low +(i*6) +1,
  plus3sd: _babyWeightLimit_low +(i*7) +1,
  observed: Random.secure().nextInt(_babyWeightLimit_low +(i*7) +10),
));
final babyWeightWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bayi gemuk ya bun",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];

//final _babyKmsLimit_low = 2;
final babyKmsChartData = List<BabyKmsChartData>.generate(21, (i) => BabyKmsChartData(
  age: i,
  //kbm: i,
  min3sd: _babyWeightLimit_low +(i*2),
  min2sd: _babyWeightLimit_low +(i*3) +1,
  min1sd: _babyWeightLimit_low +(i*3) +4,
  medianSd: _babyWeightLimit_low +(i*4) +1,
  plus1sd: _babyWeightLimit_low +(i*5) +1,
  plus2sd: _babyWeightLimit_low +(i*6) +1,
  plus3sd: _babyWeightLimit_low +(i*7) +1,
  observed: Random.secure().nextInt(_babyWeightLimit_low +(i*7) +10),
));
final babyKmsWarning = <FormWarningStatus>[];

final babyLenChartData = List<BabyLenChartData>.generate(21, (i) => BabyLenChartData(
  age: i,
  min3sd: _babyWeightLimit_low +(i*2),
  min2sd: _babyWeightLimit_low +(i*3) +1,
  min1sd: _babyWeightLimit_low +(i*3) +4,
  medianSd: _babyWeightLimit_low +(i*4) +1,
  plus1sd: _babyWeightLimit_low +(i*5) +1,
  plus2sd: _babyWeightLimit_low +(i*6) +1,
  plus3sd: _babyWeightLimit_low +(i*7) +1,
  observed: Random.secure().nextInt(_babyWeightLimit_low +(i*7) +10),
));
final babyLenWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bayi pendek ya bun",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];

final babyWeightToLenChartData = List<BabyWeightToLenChartData>.generate(21, (i) => BabyWeightToLenChartData(
  len: i,
  min3sd: _babyWeightLimit_low +(i*2),
  min2sd: _babyWeightLimit_low +(i*3) +1,
  min1sd: _babyWeightLimit_low +(i*3) +4,
  medianSd: _babyWeightLimit_low +(i*4) +1,
  plus1sd: _babyWeightLimit_low +(i*5) +1,
  plus2sd: _babyWeightLimit_low +(i*6) +1,
  plus3sd: _babyWeightLimit_low +(i*7) +1,
  observed: Random.secure().nextInt(_babyWeightLimit_low +(i*7) +10),
));
final babyWeightToLenWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bayi pendek dan gemuk",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];

final babyHeadCircumChartData = List<BabyHeadCircumChartData>.generate(21, (i) => BabyHeadCircumChartData(
  age: i,
  min3sd: _babyWeightLimit_low +(i*2),
  min2sd: _babyWeightLimit_low +(i*3) +1,
  min1sd: _babyWeightLimit_low +(i*3) +4,
  medianSd: _babyWeightLimit_low +(i*4) +1,
  plus1sd: _babyWeightLimit_low +(i*5) +1,
  plus2sd: _babyWeightLimit_low +(i*6) +1,
  plus3sd: _babyWeightLimit_low +(i*7) +1,
  observed: Random.secure().nextInt(_babyWeightLimit_low +(i*7) +10),
));
final babyHeadCircumWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bunda, ukuran lingkar kepala bayi tidak normal menurut usia bayi.",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];

final babyBmiChartData = List<BabyBmiChartData>.generate(21, (i) => BabyBmiChartData(
  age: i,
  min3sd: _babyWeightLimit_low +(i*2),
  min2sd: _babyWeightLimit_low +(i*3) +1,
  min1sd: _babyWeightLimit_low +(i*3) +4,
  medianSd: _babyWeightLimit_low +(i*4) +1,
  plus1sd: _babyWeightLimit_low +(i*5) +1,
  plus2sd: _babyWeightLimit_low +(i*6) +1,
  plus3sd: _babyWeightLimit_low +(i*7) +1,
  observed: Random.secure().nextInt(_babyWeightLimit_low +(i*7) +10),
));
final babyBmiWarning = <FormWarningStatus>[];

final babyDevChartData = List<BabyDevChartData>.generate(21, (i) => BabyDevChartData(
  age: i,
  doubtedLimit: 7,
  normalLimit: 9,
  observed: Random.secure().nextInt(9 +20),
));
final babyDevWarning = <FormWarningStatus>[
  FormWarningStatus(
    desc: "Bundaw q, perkembangan bayi bunda tidak normal ya Bundaw",
    action: "Cari Faskes terdekat",
    isSafe: false,
    img: dummyImg,
  ),
];