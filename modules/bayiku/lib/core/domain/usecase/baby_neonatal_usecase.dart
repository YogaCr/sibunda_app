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
  Future<Result<Map<String, dynamic>>> call(int page);
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
