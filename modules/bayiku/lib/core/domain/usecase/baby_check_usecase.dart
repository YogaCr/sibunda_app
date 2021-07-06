
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetBabyCheckForm {
  Future<Result<List<FormGroupData>>> call(int month);
}

mixin GetBabyFromWarningStatus {
  Future<Result<List<FormWarningStatus>>> call(String babyNik, int month);
}



class GetBabyCheckFormImpl with GetBabyCheckForm {
  final FormFieldRepo _repo;
  GetBabyCheckFormImpl(this._repo);

  @override
  Future<Result<List<FormGroupData>>> call(int month) async => _repo.getBabyFormGroupData(month);
}

/*
//TODO: GetBabyFromWarningStatusImpl lanjutkan
class GetBabyFromWarningStatusImpl with GetBabyFromWarningStatus {
  final MyBabyRepo _repo;
  GetBabyFromWarningStatusImpl(this._repo);
  @override
  Future<Result<List<FormWarningStatus>>> call(String babyNik, int month);
}
 */