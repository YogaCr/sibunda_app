import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/domain/dummy_chart_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

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


class BabyChartRepoImpl with BabyChartRepo {
  final BabyApi _api;
  final AccountLocalSrc _accountLocalSrc;
  BabyChartRepoImpl({
    required BabyApi api,
    required AccountLocalSrc accountLocalSrc,
  }):
    _api = api,
    _accountLocalSrc = accountLocalSrc
  ;

  @override
  Future<Result<List<BabyWeightChartData>>> getBabyWeightChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      prind("getBabyWeightChartData() res = $res");
      if(res is Success<int>) {
        final id = res.data;
        return Success(await _api.getWeightChart(id));
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail(error: e,);
    }
  }
  @override
  Future<Result<List<BabyKmsChartData>>> getBabyKmsChartData(String babyNik) async => Success(babyKmsChartData);
  @override
  Future<Result<List<BabyLenChartData>>> getBabyLenChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        return Success(await _api.getLenChart(id));
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<List<BabyWeightToLenChartData>>> getBabyWeightToLenChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        return Success(await _api.getWeightToLenChart(id));
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<List<BabyHeadCircumChartData>>> getBabyHeadCircumChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        return Success(await _api.getHeadCircumChart(id));
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<List<BabyBmiChartData>>> getBabyBmiChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        return Success(await _api.getBmiChart(id));
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<List<BabyDevChartData>>> getBabyDevChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        return Success(await _api.getDevChart(id));
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  }

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