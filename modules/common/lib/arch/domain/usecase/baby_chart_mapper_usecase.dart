/*
import 'package:bayiku/core/di/baby_usecase_di.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/usecase/chart_usecase.dart';
import 'package:core/domain/model/result.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GetBabyWeightChartSeries with GetLineSeries {
  @override
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyWeightChart(ownerId);
    if(res is Success<List<BabyWeightChartData>>) {
      final data = res.data;
      return Success(BabyChartLineSeries.getBabyWeightSeries(data));
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyKmsChartSeries with GetLineSeries {
  @override
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyKmsChart(ownerId);
    if(res is Success<List<BabyKmsChartData>>) {
      final data = res.data;
      return Success(BabyChartLineSeries.getBabyKmsSeries(data));
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyLenChartSeries with GetLineSeries {
  @override
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyLenChart(ownerId);
    if(res is Success<List<BabyLenChartData>>) {
      final data = res.data;
      return Success(BabyChartLineSeries.getBabyLenSeries(data));
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyWeightToLenChartSeries with GetLineSeries {
  @override
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyWeightToLenChart(ownerId);
    if(res is Success<List<BabyWeightToLenChartData>>) {
      final data = res.data;
      return Success(BabyChartLineSeries.getBabyWeightToLenSeries(data));
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyHeadCircumChartSeries with GetLineSeries {
  @override
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyHeadCircumChart(ownerId);
    if(res is Success<List<BabyHeadCircumChartData>>) {
      final data = res.data;
      return Success(BabyChartLineSeries.getBabyHeadCircumSeries(data));
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyBmiChartSeries with GetLineSeries {
  @override
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyBmiChart(ownerId);
    if(res is Success<List<BabyBmiChartData>>) {
      final data = res.data;
      return Success(BabyChartLineSeries.getBabyBmiSeries(data));
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyDevChartSeries with GetLineSeries {
  @override
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyDevChart(ownerId);
    if(res is Success<List<BabyDevChartData>>) {
      final data = res.data;
      return Success(BabyChartLineSeries.getBabyDevSeries(data));
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}




class GetBabyWeightChartWarningGeneral with GetChartWarning {
  @override
  Future<Result<List<FormWarningStatus>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyWeightChartWarning(ownerId);
    if(res is Success<List<FormWarningStatus>>) {
      final data = res.data;
      return Success(data);
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyKmsChartWarningGeneral with GetChartWarning {
  @override
  Future<Result<List<FormWarningStatus>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyKmsChartWarning(ownerId);
    if(res is Success<List<FormWarningStatus>>) {
      final data = res.data;
      return Success(data);
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyLenChartWarningGeneral with GetChartWarning {
  @override
  Future<Result<List<FormWarningStatus>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyLenChartWarning(ownerId);
    if(res is Success<List<FormWarningStatus>>) {
      final data = res.data;
      return Success(data);
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyWeightToLenChartWarningGeneral with GetChartWarning {
  @override
  Future<Result<List<FormWarningStatus>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyWeightToLenChartWarning(ownerId);
    if(res is Success<List<FormWarningStatus>>) {
      final data = res.data;
      return Success(data);
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyHeadCircumChartWarningGeneral with GetChartWarning {
  @override
  Future<Result<List<FormWarningStatus>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyHeadCircumChartWarning(ownerId);
    if(res is Success<List<FormWarningStatus>>) {
      final data = res.data;
      return Success(data);
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyBmiChartWarningGeneral with GetChartWarning {
  @override
  Future<Result<List<FormWarningStatus>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyBmiChartWarning(ownerId);
    if(res is Success<List<FormWarningStatus>>) {
      final data = res.data;
      return Success(data);
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
class GetBabyDevChartWarningGeneral with GetChartWarning {
  @override
  Future<Result<List<FormWarningStatus>>> call(String ownerId) async {
    final res = await BabyUseCaseDi.getBabyDevChartWarning(ownerId);
    if(res is Success<List<FormWarningStatus>>) {
      final data = res.data;
      return Success(data);
    } else {
      final fail = res as Fail;
      return Fail(
        code: fail.code,
        msg: fail.msg,
        error: fail.error,
        data: fail.data,
      );
    }
  }
}
 */