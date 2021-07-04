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
  Future<Result<PregnancyBabySize?>> call(PregnancyCheckUpId checkUpId);
}

mixin SavePregnancyCheck {
  Future<Result<bool>> call(String motherNik, PregnancyCheck data, int trimester);
}

mixin GetPregnancyCheck {
  Future<Result<PregnancyCheck>> call(PregnancyCheckUpId checkUpId);
}

mixin GetMotherFormWarningStatus {
  Future<Result<List<FormWarningStatus>>> call(PregnancyCheckUpId checkUpId);
}



class GetPregnancyCheckFormImpl with GetPregnancyCheckForm {
  final FormFieldRepo _repo;
  GetPregnancyCheckFormImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call() async => _repo.getPregnancyFormGroupData();
}

class GetPregnancyBabySizeImpl with GetPregnancyBabySize {
  GetPregnancyBabySizeImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<PregnancyBabySize?>> call(PregnancyCheckUpId checkUpId) => _repo.getPregnancyBabySize(checkUpId);
}

class SavePregnancyCheckImpl with SavePregnancyCheck {
  SavePregnancyCheckImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<bool>> call(String motherNik, PregnancyCheck data, int trimester) =>
      _repo.savePregnancyCheck(motherNik, data, trimester);
}

class GetPregnancyCheckImpl with GetPregnancyCheck {
  GetPregnancyCheckImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<PregnancyCheck>> call(PregnancyCheckUpId checkUpId) => _repo.getPregnancyCheck(checkUpId);
}


class GetMotherFormWarningStatusImpl with GetMotherFormWarningStatus {
  GetMotherFormWarningStatusImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<List<FormWarningStatus>>> call(PregnancyCheckUpId checkUpId) => _repo.getMotherWarningStatus(checkUpId);
}