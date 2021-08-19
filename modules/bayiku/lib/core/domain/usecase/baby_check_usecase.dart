
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin GetBabyCheckForm {
  Future<Result<List<FormGroupData>>> call(int month);
}

mixin GetBabyGrowthFormWarningStatus {
  Future<Result<List<FormWarningStatus>>> call({
    required int yearId,
    required int month,
  });
}

mixin GetBabyDevFormWarningStatus {
  Future<Result<List<FormWarningStatus>>> call({
    required int yearId,
    required int month,
  });
}

mixin SaveBabyCheckForm {
  Future<Result<bool>> call(BabyMonthlyFormBody body);
}

mixin SaveBabyCheckUpId {
  Future<Result<bool>> call({
    required int babyId,
    required int month,
    required int id,
  });
}

mixin GetBabyCheckUpId {
  Future<Result<int>> call({
    required int babyId,
    required int month,
  });
}

mixin GetBabyCheckFormAnswer {
  Future<Result<BabyMonthlyFormBody>> call({
    required int babyId,
    required int yearId,
    required int month,
  });
}



class GetBabyCheckFormImpl with GetBabyCheckForm {
  final FormFieldRepo _repo;
  GetBabyCheckFormImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call(int month) async => _repo.getBabyFormGroupData(month);
}

class GetBabyFormWarningStatusImpl with GetBabyGrowthFormWarningStatus {
  final MyBabyRepo _repo;
  GetBabyFormWarningStatusImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call({
    required int yearId,
    required int month,
  }) => _repo.getBabyGrowthWarningStatus(yearId: yearId, month: month);
}

class GetBabyDevFormWarningStatusImpl with GetBabyDevFormWarningStatus {
  final MyBabyRepo _repo;
  GetBabyDevFormWarningStatusImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call({
    required int yearId,
    required int month,
  }) => _repo.getBabyDevWarningStatus(yearId: yearId, month: month);
}

class SaveBabyCheckFormImpl with SaveBabyCheckForm {
  final MyBabyRepo _repo;
  SaveBabyCheckFormImpl(this._repo);
  @override
  Future<Result<bool>> call(BabyMonthlyFormBody body) => _repo.saveBabyMonthlyCheck(body);
}

class SaveBabyCheckUpIdImpl with SaveBabyCheckUpId {
  final MyBabyRepo _repo;
  SaveBabyCheckUpIdImpl(this._repo);
  @override
  Future<Result<bool>> call({
    required int babyId,
    required int month,
    required int id,
  }) => _repo.saveBabyCheckUpId(babyId: babyId, month: month, id: id);
}

class GetBabyCheckUpIdImpl with GetBabyCheckUpId {
  final MyBabyRepo _repo;
  GetBabyCheckUpIdImpl(this._repo);
  @override
  Future<Result<int>> call({
    required int babyId,
    required int month,
  }) => _repo.getBabyCheckUpId(babyId: babyId, month: month);
}

class GetBabyCheckFormAnswerImpl with GetBabyCheckFormAnswer {
  final MyBabyRepo _repo;
  GetBabyCheckFormAnswerImpl(this._repo);
  @override
  Future<Result<BabyMonthlyFormBody>> call({
    required int babyId,
    required int yearId,
    required int month,
  }) async {
    final res = await _repo.getBabyMonthlyCheck(yearId: yearId, month: month);
    prind("GetBabyCheckFormAnswerImpl babyId= $babyId yearId= $yearId month= $month res= $res");
    if(res is Success<BabyMonthlyFormBody>) {
      final data = res.data;
      final res3 = await _repo.saveBabyCheckUpId(babyId: babyId, month: month, id: data.id!);
      if(res3 is Fail<bool>) {
        final errMsg = res3.error?.toString();
        if(!(errMsg?.contains("2067") == true || errMsg?.contains("UNIQUE") == true)) {
          final msg = "Can't save baby form check up id to local";
          prine(msg);
          return Fail(msg: msg, error: res3.error);
        }
      }
    }
    return res;
  }
}