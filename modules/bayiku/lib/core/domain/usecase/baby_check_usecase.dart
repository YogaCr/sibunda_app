
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

mixin GetBabyFormWarningStatus {
  Future<Result<List<FormWarningStatus>>> call(String babyNik, int monthId);
}

mixin SaveBabyCheckForm {
  Future<Result<bool>> call(BabyMonthlyFormBody body);
}

mixin SaveBabyCheckUpId {
  Future<Result<bool>> call({
    required String babyNik,
    required int month,
    required int id,
  });
}

mixin GetBabyCheckUpId {
  Future<Result<int>> call({
    required String babyNik,
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

class GetBabyFormWarningStatusImpl with GetBabyFormWarningStatus {
  final MyBabyRepo _repo;
  GetBabyFormWarningStatusImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(String babyNik, int monthId) => _repo.getBabyWarningStatus(babyNik, monthId);
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
    required String babyNik,
    required int month,
    required int id,
  }) => _repo.saveBabyCheckUpId(babyNik: babyNik, month: month, id: id);
}

class GetBabyCheckUpIdImpl with GetBabyCheckUpId {
  final MyBabyRepo _repo;
  GetBabyCheckUpIdImpl(this._repo);
  @override
  Future<Result<int>> call({
    required String babyNik,
    required int month,
  }) => _repo.getBabyCheckUpId(babyNik: babyNik, month: month);
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
    if(res is Success<BabyMonthlyFormBody>) {
      final data = res.data;
      final res2 = await _repo.getBabyNik();
      if(res2 is Success<Map<int, String>>) {
        prind("GetBabyCheckFormAnswerImpl data = ${data.toJson()}");
        final babyNik = res2.data[babyId];
        if(data.id == null) {
          throw "Something wrong with `BabyMonthlyFormBody.id`, it's null.";
        }
        if(babyNik == null) {
          throw "Can't get `babyNik` with `babyId` of '$babyId'";
        }
        final res3 = await _repo.saveBabyCheckUpId(babyNik: babyNik, month: month, id: data.id!);
        if(res3 is! Success<bool>) {
          return Fail(msg: "Can't save baby form check up id to local");
        }
      } else {
        return Fail(msg: "Can't get baby NIK to save form check up id to local");
      }
    }
    return res;
  }
}