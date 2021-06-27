
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetBabyCheckForm {
  Future<Result<List<FormGroupData>>> call();
}

class GetBabyCheckFormImpl with GetBabyCheckForm {
  final FormFieldRepo _repo;
  GetBabyCheckFormImpl(this._repo);

  @override
  Future<Result<List<FormGroupData>>> call() async => _repo.getBabyFormGroupData();
}