

import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';

mixin PregnancyCheckRepo {
  Future<Result<PregnancyCheck>> getPregnancyCheck(String motherNik, int week);
  Future<Result<bool>> savePregnancyCheck(PregnancyCheck data);
}

class PregnancyCheckRepoDummy with PregnancyCheckRepo {
  PregnancyCheckRepoDummy._();
  static final obj = PregnancyCheckRepoDummy._();

  @override
  Future<Result<PregnancyCheck>> getPregnancyCheck(String motherNik, int week) async => Success(dummyPregnancyCheck(week));
  @override
  Future<Result<bool>> savePregnancyCheck(PregnancyCheck data) async => Success(true);
}


mixin MotherFoodRecomRepo {
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(int pregnancyWeekAge);
}

class MotherFoodRecomRepoDummy with MotherFoodRecomRepo {
  MotherFoodRecomRepoDummy._();
  static final obj = MotherFoodRecomRepoDummy._();

  @override
  Future<Result<List<MotherFoodRecom>>> getMotherFoodRecoms(int pregnancyWeekAge) async => Success(dummyFoodRecomList(pregnancyWeekAge));
}


mixin MotherPregnancyRepo {
  Future<Result<List<MotherTrimester>>> getMotherTrimester();
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(String motherNik);
  Future<Result<PregnancyBabySize>> getPregnancyBabySize(int pregnancyWeekAge);
}

class MotherPregnancyRepoDummy with MotherPregnancyRepo {
  MotherPregnancyRepoDummy._();
  static final obj = MotherPregnancyRepoDummy._();

  @override
  Future<Result<List<MotherTrimester>>> getMotherTrimester() async => Success(dummyTrimesterList);
  @override
  Future<Result<MotherPregnancyAgeOverview>> getMotherPregnancyAgeOverview(String motherNik) async => Success(dummyPregnancyAgeOverview);
  @override
  Future<Result<PregnancyBabySize>> getPregnancyBabySize(int pregnancyWeekAge) async => Success(dummyPregnancyBabySize(pregnancyWeekAge));
}