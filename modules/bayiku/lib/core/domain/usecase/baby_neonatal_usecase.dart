import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetNeonatalFormData {
  Future<Result<List<FormGroupData>>> call(int page);
}

mixin SaveNeonatalForm {
  Future<Result<bool>> call({
    required int page,
    required Map<String, dynamic> formData,
  });
}

//TODO: GetNeonatalFormAnswer: blum ada endpoint
mixin GetNeonatalFormAnswer {
  Future<Result<Map<String, dynamic>?>> call({
    required int page,
    required int yearId,
    required int month,
  });
}


class GetNeonatalFormDataImpl with GetNeonatalFormData {
  final FormFieldRepo _repo;
  GetNeonatalFormDataImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call(int page) => _repo.getNeonatalFormData(page);
}

class SaveNeonatalFormImpl with SaveNeonatalForm {
  final MyBabyRepo _repo;
  SaveNeonatalFormImpl(this._repo);
  @override
  Future<Result<bool>> call({
    required int page,
    required Map<String, dynamic> formData,
  }) => _repo.saveNeonatalServiceForm(page: page, formData: formData,);
}

class GetNeonatalFormAnswerImpl with GetNeonatalFormAnswer {
  final MyBabyRepo _repo;
  GetNeonatalFormAnswerImpl(this._repo);
  @override
  Future<Result<Map<String, dynamic>?>> call({
    required int page,
    required int yearId,
    required int month,
  }) async {
    Future<Result<dynamic>> Function({
      required int yearId,
      required int month,
    }) fun;

    switch(page) {
      case 0:
        fun = _repo.getNeonatal6HourAnswer;
        break;
      case 1:
        fun = _repo.getNeonatalKn1Answer;
        break;
      case 2:
        fun = _repo.getNeonatalKn2Answer;
        break;
      case 3:
        fun = _repo.getNeonatalKn3Answer;
        break;
      default: throw "No such `page` of '$page' in `GetNeonatalFormAnswer`";
    }
    final res = await fun(yearId: yearId, month: month);
    if(res is Success) {
      final data = res.data;
      final map = data?.toJson() as Map<String, dynamic>?;
      return Success(map);
    }
    return (res as Fail).copy();
  }
}