import 'package:common/data/Result.dart';
import 'package:common/data/dummy_data.dart';
import 'package:common/data/model/kehamilanku_data.dart';

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