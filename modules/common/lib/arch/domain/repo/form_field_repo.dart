import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:core/domain/model/result.dart';

mixin FormFieldRepo {
  Future<Result<List<FormGroupData>>> getBabyFormGroupData(int month);
  Future<Result<List<FormGroupData>>> getPregnancyFormGroupData();
  Future<Result<List<FormGroupData>>> getPregnancyImmunizationFormGroupData();
  Future<Result<List<FormGroupData>>> getBabyImmunizationFormGroupData();
  Future<Result<List<FormGroupData>>> getCovidMotherCheckFormGroupData();
}

class FormFieldRepoDummy with FormFieldRepo {
  FormFieldRepoDummy._();
  static final obj = FormFieldRepoDummy._();
  @override
  Future<Result<List<FormGroupData>>> getBabyFormGroupData(int month) async => Success(getBabyFormGroupData_dummy(month));
  @override
  Future<Result<List<FormGroupData>>> getPregnancyFormGroupData() async => Success(motherFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getPregnancyImmunizationFormGroupData() async => Success(pregnancyImmunizationFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getBabyImmunizationFormGroupData() async => Success(babyImmunizationFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getCovidMotherCheckFormGroupData() async => Success(covidMotherCheckFormGroupData);
}