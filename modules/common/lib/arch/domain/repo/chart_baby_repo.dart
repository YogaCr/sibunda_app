import 'package:common/arch/domain/dummy_chart_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:core/domain/model/result.dart';

mixin BabyChartRepo {
  Future<Result<List<BabyWeightChartData>>> getBabyWeightChartData(String babyNik);
  Future<Result<List<BabyKmsChartData>>> getBabyKmsChartData(String babyNik);
  Future<Result<List<BabyLenChartData>>> getBabyLenChartData(String babyNik);
  Future<Result<List<BabyWeightToLenChartData>>> getBabyWeightToLenChartData(String babyNik);
  Future<Result<List<BabyHeadCircumChartData>>> getBabyHeadCircumChartData(String babyNik);
  Future<Result<List<BabyBmiChartData>>> getBabyBmiChartData(String babyNik);
  Future<Result<List<BabyDevChartData>>> getBabyDevChartData(String babyNik);

  Future<Result<List<FormWarningStatus>>> getBabyWeightChartWarning(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyKmsChartWarning(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyLenChartWarning(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyWeightToLenChartWarning(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyHeadCircumChartWarning(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyBmiChartWarning(String babyNik);
  Future<Result<List<FormWarningStatus>>> getBabyDevChartWarning(String babyNik);
}


class BabyChartRepoDummy with BabyChartRepo {
  BabyChartRepoDummy._();
  static final obj = BabyChartRepoDummy._();

  @override
  Future<Result<List<BabyWeightChartData>>> getBabyWeightChartData(String babyNik) async => Success(babyWeightChartData);
  @override
  Future<Result<List<BabyKmsChartData>>> getBabyKmsChartData(String babyNik) async => Success(babyKmsChartData);
  @override
  Future<Result<List<BabyLenChartData>>> getBabyLenChartData(String babyNik) async => Success(babyLenChartData);
  @override
  Future<Result<List<BabyWeightToLenChartData>>> getBabyWeightToLenChartData(String babyNik) async => Success(babyWeightToLenChartData);
  @override
  Future<Result<List<BabyHeadCircumChartData>>> getBabyHeadCircumChartData(String babyNik) async => Success(babyHeadCircumChartData);
  @override
  Future<Result<List<BabyBmiChartData>>> getBabyBmiChartData(String babyNik) async => Success(babyBmiChartData);
  @override
  Future<Result<List<BabyDevChartData>>> getBabyDevChartData(String babyNik) async => Success(babyDevChartData);

  @override
  Future<Result<List<FormWarningStatus>>> getBabyWeightChartWarning(String babyNik) async => Success(babyWeightWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyKmsChartWarning(String babyNik) async => Success(babyKmsWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyLenChartWarning(String babyNik) async => Success(babyLenWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyWeightToLenChartWarning(String babyNik) async => Success(babyWeightToLenWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyHeadCircumChartWarning(String babyNik) async => Success(babyHeadCircumWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyBmiChartWarning(String babyNik) async => Success(babyBmiWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyDevChartWarning(String babyNik) async => Success(babyDevWarning);
}