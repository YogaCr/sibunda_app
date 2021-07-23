import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_overview_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/util/times.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kehamilanku_data.g.dart';

@JsonSerializable()
class PregnancyCheck {
  @JsonKey(name: Const.KEY_VISIT_DATE)
  final String visitDate;
  @JsonKey(name: Const.KEY_VISIT_PLACE)
  final String visitPlace;
  @JsonKey(name: Const.KEY_CHECKER_NAME)
  final String checkerName;
  @JsonKey(name: Const.KEY_MOTHER_DIFFICULTY)
  final String difficulty;
  @JsonKey(name: Const.KEY_WEEK)
  final int pregnancyAge; // in week
  @JsonKey(name: Const.KEY_BABY_GENDER)
  final String babyGender;
  @JsonKey(name: Const.KEY_FUTURE_VISIT_DATE)
  final String futureVisitDate;
  @JsonKey(name: Const.KEY_HPHT)
  final String HPHT;
  @JsonKey(name: Const.KEY_HPL)
  final String HPL;
  @JsonKey(name: Const.KEY_WEIGHT)
  final int motherWeigth; // in kg
  @JsonKey(name: Const.KEY_WEIGHT_DIFF)
  final int motherWeigthDiff; // in kg
  @JsonKey(name: Const.KEY_HEIGHT)
  final int motherHeight; // in cm
  @JsonKey(name: Const.KEY_TFU)
  final int TFU;
  @JsonKey(name: Const.KEY_DJJ)
  final int DJJ;
  @JsonKey(name: Const.KEY_SYSTOLIC_PRESSURE)
  final int systolicPressure;
  @JsonKey(name: Const.KEY_DIASTOLIC_PRESSURE)
  final int diastolicPressure;
  @JsonKey(name: Const.KEY_MAP)
  final int MAP;
  @JsonKey(name: Const.KEY_BABY_MOVEMENT)
  final int babyMovement; //movement count //TODO: pasang cek pada vm tuk mrubah format
  @JsonKey(name: Const.KEY_DRUG_PRESCRIPT)
  final String drugPrescript;
  @JsonKey(name: Const.KEY_DRUG_ALLERGY)
  final String drugAllergy;
  @JsonKey(name: Const.KEY_DISEASE_HISTORY)
  final String diseaseHistory;
  @JsonKey(name: Const.KEY_SPECIAL_NOTE)
  final String note;

  PregnancyCheck({
    required this.visitDate,
    required this.visitPlace,
    required this.checkerName,
    required this.difficulty,
    required this.pregnancyAge,
    required this.babyGender,
    required this.futureVisitDate,
    required this.HPHT,
    required this.HPL,
    required this.motherWeigth,
    required this.motherWeigthDiff,
    required this.motherHeight,
    required this.TFU,
    required this.DJJ,
    required this.systolicPressure,
    required this.diastolicPressure,
    required this.MAP,
    required this.babyMovement,
    required this.drugPrescript,
    required this.drugAllergy,
    required this.diseaseHistory,
    required this.note,
  });


  factory PregnancyCheck.from(Map<String, String> map) => PregnancyCheck(
    visitDate: map[Const.KEY_VISIT_DATE]!,
    visitPlace: map[Const.KEY_VISIT_PLACE]!,
    checkerName: map[Const.KEY_CHECKER_NAME]!,
    difficulty: map[Const.KEY_MOTHER_DIFFICULTY]!,
    pregnancyAge: int.parse(map[Const.KEY_PREGNANCY_AGE]!),
    babyGender: map[Const.KEY_BABY_GENDER]!,
    futureVisitDate: map[Const.KEY_FUTURE_VISIT_DATE]!,
    HPHT: map[Const.KEY_HPHT]!,
    HPL: map[Const.KEY_HPL]!,
    motherWeigth: int.parse(map[Const.KEY_WEIGHT]!),
    motherWeigthDiff: int.parse(map[Const.KEY_WEIGHT_DIFF]!),
    motherHeight: int.parse(map[Const.KEY_HEIGHT]!),
    TFU: int.parse(map[Const.KEY_TFU]!),
    DJJ: int.parse(map[Const.KEY_DJJ]!),
    systolicPressure: int.parse(map[Const.KEY_SYSTOLIC_PRESSURE]!),
    diastolicPressure: int.parse(map[Const.KEY_DIASTOLIC_PRESSURE]!),
    MAP: int.parse(map[Const.KEY_MAP]!),
    babyMovement: int.parse(map[Const.KEY_BABY_MOVEMENT]!),
    drugPrescript: map[Const.KEY_DRUG_PRESCRIPT]!,
    drugAllergy: map[Const.KEY_DRUG_ALLERGY]!,
    diseaseHistory: map[Const.KEY_DISEASE_HISTORY]!,
    note: map[Const.KEY_SPECIAL_NOTE]!,
  );

  factory PregnancyCheck.fromJson(Map<String, dynamic> json) {
    if(json[Const.KEY_HPHT] == null) {
      final hpl = json[Const.KEY_HPL];
      final hplDate = parseDate(hpl);
      json[Const.KEY_HPHT] = getHpht(hplDate).toString();
    }
    return _$PregnancyCheckFromJson(json);
  }
  Map<String, dynamic> toJson() => _$PregnancyCheckToJson(this);

  factory PregnancyCheck.fromResponse(PregnancyCheckBody response) {
    final respMap = response.toJson();
    return PregnancyCheck.fromJson(respMap);
  }
}

class PregnancyCheckUpId extends Equatable {
  final String motherNik;
  final int week;
  final int id;

  PregnancyCheckUpId({
    required this.motherNik,
    required this.week,
    required this.id,
  });

  PregnancyCheckUpId.fromResponse({
    required this.motherNik,
    required this.week,
    required PregnancyCreateCheckIdResponse response,
  }): id = response.id;

  @override
  List<Object?> get props => [motherNik, week, id];
}

/*
======================
HOME
======================
 */

class MotherPregnancyAgeOverview {
  final int weekAge;
  final int daysRemaining;
  final ImgData img;

  MotherPregnancyAgeOverview({
    required this.weekAge,
    required this.daysRemaining,
    required this.img,
  });
}

class MotherTrimester {
  final int id;
  final int trimester;
  final int startWeek;
  final int endWeek;
  final ImgData img;

  MotherTrimester({
    required this.id,
    required this.trimester,
    required this.startWeek,
    required this.endWeek,
    required this.img,
  });

  factory MotherTrimester.fromResponse(PregnancyHomeTrimester response) {
    final startWeek = (response.no -1) *12 +1;
    final endWeek = response.no *12;
    return MotherTrimester(
      id: response.id,
      trimester: response.no,
      startWeek: startWeek,
      endWeek: endWeek,
      img: ImgData(
        link: response.img_url,
        src: ImgSrc.network,
      ),
    );
  }
}

class MotherFoodRecom {
  final ImgData? img;
  final String food;
  final String desc;

  MotherFoodRecom({
    required this.img,
    required this.food,
    required this.desc,
  });

  factory MotherFoodRecom.fromResponse(PregnancyHomeFoodRecom response) {
    return MotherFoodRecom(
      food: response.category,
      desc: response.desc,
      img: response.img_url != null ? ImgData(
        link: response.img_url!,
        src: ImgSrc.network,
      ) : null,
    );
  }
}


/*
======================
Weekly Check Form
======================
 */

class PregnancyBabySize {
  final String sizeString;
  final double? babyLen;
  final double? babyWeight;

  PregnancyBabySize({
    required this.sizeString,
    required this.babyWeight,
    required this.babyLen,
  });

  factory PregnancyBabySize.fromResponse(PregnancyCheckFetusGrowthWarningResponse response) =>
      PregnancyBabySize(
        sizeString: response.desc!,
        babyLen: response.length?.toDouble(),
        babyWeight: response.weight?.toDouble(),
      );
}




class MotherHomeBabyData {
  final int babyId;
  final String babyName;
  final int? childOrder;
  //final int week;
  //final int remainingDays;
  final MotherPregnancyAgeOverview pregnancyAge;
  final List<MotherFoodRecom> foodRecomList;
  final List<MotherTrimester> trimesterList;

  MotherHomeBabyData({
    required this.babyId,
    required this.babyName,
    required this.childOrder,
    required this.pregnancyAge,
    required this.foodRecomList,
    required this.trimesterList,
  });

  factory MotherHomeBabyData.fromResponse(PregnancyHomeBabyResponse response) {
    return MotherHomeBabyData(
      babyId: response.babyId,
      babyName: response.name,
      childOrder: response.childOrder,
      pregnancyAge: MotherPregnancyAgeOverview(
        weekAge: response.week,
        daysRemaining: response.remainingDays,
        img: imgPregnancyAgeOverview,
      ),
      foodRecomList: response.foodRecomList.map((e) => MotherFoodRecom.fromResponse(e)).toList(growable: false),
      trimesterList: response.trimesterList.map((e) => MotherTrimester.fromResponse(e)).toList(growable: false),
    );
  }
}
/*
@JsonSerializable()
class MotherFoodRecom {
  @JsonKey(name: Const.KEY_FOOD_CATEGORY)
  final String category;
  @JsonKey(name: Const.KEY_FOOD_DESC)
  final String desc;

  MotherFoodRecom({
    required this.category,
    required this.desc,
  });

  factory PregnancyHomeFoodRecom.fromJson(Map<String, dynamic> map) => _$PregnancyHomeFoodRecomFromJson(map);
}
 */
/*
@JsonSerializable()
class PregnancyHomeTrimester {
  final int id;
  @JsonKey(name: Const.KEY_TRIMESTER_NO)
  final int no;
  @JsonKey(name: Const.KEY_BABY_ID)
  final int babyId;

  PregnancyHomeTrimester({
    required this.id,
    required this.no,
    required this.babyId,
  });

  factory PregnancyHomeTrimester.fromJson(Map<String, dynamic> map) => _$PregnancyHomeTrimesterFromJson(map);
}
 */