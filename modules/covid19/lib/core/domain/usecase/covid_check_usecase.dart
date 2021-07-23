import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/repo/covid_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetCovidMotherCheckFormData {
  Future<Result<List<FormGroupData>>> call();
}
mixin GetCovidBabyCheckFormData {
  Future<Result<List<FormGroupData>>> call();
}

mixin SubmitCovidMotherCheckForm {
  Future<Result<FormWarningStatus>> call(String motherNik, Map<int, dynamic> data);
}

mixin SubmitCovidBabyCheckForm {
  Future<Result<FormWarningStatus>> call(String babyNik, Map<int, dynamic> data);
}


class GetCovidMotherCheckFormDataImpl with GetCovidMotherCheckFormData {
  final FormFieldRepo _repo;
  GetCovidMotherCheckFormDataImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call() => _repo.getCovidMotherCheckFormGroupData();
}
class GetCovidBabyCheckFormDataImpl with GetCovidBabyCheckFormData {
  final FormFieldRepo _repo;
  GetCovidBabyCheckFormDataImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call() => _repo.getCovidBabyCheckFormGroupData();
}

class SubmitCovidMotherCheckFormImpl with SubmitCovidMotherCheckForm {
  final CovidRepo _repo;
  SubmitCovidMotherCheckFormImpl(this._repo);
  @override
  Future<Result<FormWarningStatus>> call(String motherNik, Map<int, dynamic> data) =>
      _repo.submitCovidMotherCheck(motherNik, data);
}

class SubmitCovidBabyCheckFormImpl with SubmitCovidBabyCheckForm {
  final CovidRepo _repo;
  SubmitCovidBabyCheckFormImpl(this._repo);
  @override
  Future<Result<FormWarningStatus>> call(String babyNik, Map<int, dynamic> data) =>
      _repo.submitCovidBabyCheck(babyNik, data);
}