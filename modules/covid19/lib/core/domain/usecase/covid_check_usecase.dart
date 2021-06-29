import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/repo/covid_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetCovidMotherCheckFormData {
  Future<Result<List<FormGroupData>>> call();
}

mixin SubmitCovidMotherCheckForm {
  Future<Result<bool>> call(String motherNik, CovidMotherCheckForm data);
}


class GetCovidMotherCheckFormDataImpl with GetCovidMotherCheckFormData {
  final FormFieldRepo _repo;
  GetCovidMotherCheckFormDataImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call() => _repo.getCovidMotherCheckFormGroupData();
}

class SubmitCovidMotherCheckFormImpl with SubmitCovidMotherCheckForm {
  final CovidRepo _repo;
  SubmitCovidMotherCheckFormImpl(this._repo);
  @override
  Future<Result<bool>> call(String motherNik, CovidMotherCheckForm data) => _repo.submitCovidMotherCheck(motherNik, data);
}