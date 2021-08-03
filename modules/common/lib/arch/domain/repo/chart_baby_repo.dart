import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/model/baby_chart_api_model.dart';
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

  final _babyChartResponse = <BabyChartType, dynamic>{};
  int? _currentId;
  int? get currentId => _currentId;
  set currentId(v) {
    if(v != _currentId) {
      _babyChartResponse.clear();
      _currentId = v;
    }
  }

  @override
  Future<Result<List<BabyWeightChartData>>> getBabyWeightChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      prind("getBabyWeightChartData() res = $res");
      if(res is Success<int>) {
        final id = res.data;
        final BabyWeightChartResponse resp =
          _babyChartResponse[BabyChartType.weight] ??= await _api.getWeightChart(id);
        currentId = id;
        return Success(resp.data.data);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail(error: e,);
    }
  }
  @override
  Future<Result<List<BabyKmsChartData>>> getBabyKmsChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyKmsChartResponse resp =
          _babyChartResponse[BabyChartType.kms] ??= await _api.getKmsChart(id);
        currentId = id;
        return Success(resp.data.data);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<List<BabyLenChartData>>> getBabyLenChartData(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyLenChartResponse resp =
          _babyChartResponse[BabyChartType.len] ??= await _api.getLenChart(id);
        currentId = id;
        return Success(resp.data.data);
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
        final BabyWeightToLenChartResponse resp =
          _babyChartResponse[BabyChartType.weightToLen] ??= await _api.getWeightToLenChart(id);
        currentId = id;
        return Success(resp.data.data);
        //return Success(await _api.getWeightToLenChart(id));
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
        final BabyHeadCircumChartResponse resp =
          _babyChartResponse[BabyChartType.head] ??= await _api.getHeadCircumChart(id);
        currentId = id;
        return Success(resp.data.data);
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
        final BabyBmiChartResponse resp =
          _babyChartResponse[BabyChartType.bmi] ??= await _api.getBmiChart(id);
        currentId = id;
        return Success(resp.data.data);
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
        final BabyDevChartResponse resp =
          _babyChartResponse[BabyChartType.dev] ??= await _api.getDevChart(id);
        currentId = id;
        return Success(resp.data.data);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  }

  @override
  Future<Result<List<FormWarningStatus>>> getBabyWeightChartWarning(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyWeightChartResponse resp =
          _babyChartResponse[BabyChartType.weight] ??= await _api.getWeightChart(id);
        currentId = id;
        final raw = resp.data.desc;
        if(raw == null || raw.desc == null) {
          return Success(List.empty());
        }
        final data = FormWarningStatus.fromChartResponse(raw, isMother: false);
        return Success([data]);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  } //async => Success(babyWeightWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyKmsChartWarning(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyKmsChartResponse resp =
          _babyChartResponse[BabyChartType.kms] ??= await _api.getKmsChart(id);
        currentId = id;
        final raw = resp.data.desc;
        if(raw == null || raw.desc == null) {
          return Success(List.empty());
        }
        final data = FormWarningStatus.fromChartResponse(raw, isMother: false);
        return Success([data]);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  } //async => Success(babyKmsWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyLenChartWarning(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyLenChartResponse resp =
          _babyChartResponse[BabyChartType.len] ??= await _api.getLenChart(id);
        currentId = id;
        final raw = resp.data.desc;
        if(raw == null || raw.desc == null) {
          return Success(List.empty());
        }
        final data = FormWarningStatus.fromChartResponse(raw, isMother: false);
        return Success([data]);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  } //async => Success(babyLenWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyWeightToLenChartWarning(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyWeightToLenChartResponse resp =
          _babyChartResponse[BabyChartType.weightToLen] ??= await _api.getWeightToLenChart(id);
        currentId = id;
        final raw = resp.data.desc;
        if(raw == null || raw.desc == null) {
          return Success(List.empty());
        }
        final data = FormWarningStatus.fromChartResponse(raw, isMother: false);
        return Success([data]);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  } //async => Success(babyWeightToLenWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyHeadCircumChartWarning(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyHeadCircumChartResponse resp =
          _babyChartResponse[BabyChartType.head] ??= await _api.getHeadCircumChart(id);
        currentId = id;
        final raw = resp.data.desc;
        if(raw == null || raw.desc == null) {
          return Success(List.empty());
        }
        final data = FormWarningStatus.fromChartResponse(raw, isMother: false);
        return Success([data]);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  } //async => Success(babyHeadCircumWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyBmiChartWarning(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyBmiChartResponse resp =
          _babyChartResponse[BabyChartType.bmi] ??= await _api.getBmiChart(id);
        currentId = id;
        final raw = resp.data.desc;
        if(raw == null || raw.desc == null) {
          return Success(List.empty());
        }
        final data = FormWarningStatus.fromChartResponse(raw, isMother: false);
        return Success([data]);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  } //async => Success(babyBmiWarning);
  @override
  Future<Result<List<FormWarningStatus>>> getBabyDevChartWarning(String babyNik) async {
    try {
      final res = await _accountLocalSrc.getChildId(babyNik);
      if(res is Success<int>) {
        final id = res.data;
        final BabyDevChartResponse resp =
          _babyChartResponse[BabyChartType.dev] ??= await _api.getDevChart(id);
        currentId = id;
        final raw = resp.data.desc;
        if(raw == null || raw.desc == null) {
          return Success(List.empty());
        }
        final data = FormWarningStatus.fromChartResponse(raw, isMother: false);
        return Success([data]);
      } else {
        return Fail();
      }
    } catch(e) {
      return Fail();
    }
  } //async => Success(babyDevWarning);
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