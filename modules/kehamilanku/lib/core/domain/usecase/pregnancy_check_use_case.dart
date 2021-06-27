import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:common/arch/domain/repo/form_warning_status_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetPregnancyCheckForm {
  Future<Result<List<FormGroupData>>> call();
}

mixin GetPregnancyBabySize {
  Future<Result<PregnancyBabySize>> call(int pregnancyWeekAge);
}

mixin SavePregnancyCheck {
  Future<Result<bool>> call(PregnancyCheck data);
}

mixin GetPregnancyCheck {
  Future<Result<PregnancyCheck>> call(String motherNik, int week);
}

mixin GetMotherFormWarningStatus {
  Future<Result<List<FormWarningStatus>>> call(String motherNik, int week);
}



class GetPregnancyCheckFormImpl with GetPregnancyCheckForm {
  final FormFieldRepo _repo;
  GetPregnancyCheckFormImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call() async => _repo.getPregnancyFormGroupData();
}

class GetPregnancyBabySizeImpl with GetPregnancyBabySize {
  GetPregnancyBabySizeImpl(this._repo);
  final MotherPregnancyRepo _repo;
  @override
  Future<Result<PregnancyBabySize>> call(int pregnancyWeekAge) => _repo.getPregnancyBabySize(pregnancyWeekAge);
}

class SavePregnancyCheckImpl with SavePregnancyCheck {
  SavePregnancyCheckImpl(this._repo);
  final PregnancyCheckRepo _repo;
  @override
  Future<Result<bool>> call(PregnancyCheck data) => _repo.savePregnancyCheck(data);
}

class GetPregnancyCheckImpl with GetPregnancyCheck {
  GetPregnancyCheckImpl(this._repo);
  final PregnancyCheckRepo _repo;
  @override
  Future<Result<PregnancyCheck>> call(String motherNik, int week) =>
      _repo.getPregnancyCheck(motherNik, week);
}


class GetMotherFormWarningStatusImpl with GetMotherFormWarningStatus {
  GetMotherFormWarningStatusImpl(this._repo);
  final FormWarningStatusRepo _repo;
  @override
  Future<Result<List<FormWarningStatus>>> call(String motherNik, int week) => _repo.getMotherWarningStatus(motherNik, week);
}