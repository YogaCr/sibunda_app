import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:core/domain/model/result.dart';

mixin FormFieldRepo {
  Future<Result<List<FormGroupData>>> getBabyFormGroupData();
}

class FormFieldRepoDummy with FormFieldRepo {
  FormFieldRepoDummy._();
  static final obj = FormFieldRepoDummy._();
  @override
  Future<Result<List<FormGroupData>>> getBabyFormGroupData() async => Success(babyFormGroupData);
}