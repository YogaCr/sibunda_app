import 'dart:io';

import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:common/arch/domain/repo/form_warning_status_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetPregnancyCheckForm {
  Future<Result<List<FormGroupData>>> call();
}

mixin GetPregnancyBabySize {
  Future<Result<PregnancyBabySize?>> call(PregnancyCheckUpWeek checkUpWeek);
}

mixin SavePregnancyCheck {
  Future<Result<int>> call(int pregnancyId, PregnancyCheck data, int trimesterId);
}

mixin SaveUsgImg {
  Future<Result<File?>> call({
    required int pregnancyId,
    required ImgData imgFile,
    required int checkUpId,
  });
}

mixin GetPregnancyCheck {
  Future<Result<PregnancyCheck>> call(PregnancyCheckUpWeek checkUpWeek);
}

mixin GetMotherFormWarningStatus {
  Future<Result<List<FormWarningStatus>>> call(PregnancyCheckUpWeek checkUpWeek);
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
  Future<Result<PregnancyBabySize?>> call(PregnancyCheckUpWeek checkUpWeek) => _repo.getPregnancyBabySize(checkUpWeek);
}

class SavePregnancyCheckImpl with SavePregnancyCheck {
  SavePregnancyCheckImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<int>> call(int pregnancyId, PregnancyCheck data, int trimesterId) =>
      _repo.savePregnancyCheck(pregnancyId, data, trimesterId);
}

class SaveUsgImgImpl with SaveUsgImg {
  SaveUsgImgImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<File?>> call({
    required int pregnancyId,
    required ImgData imgFile,
    required int checkUpId,
  }) => _repo.saveUsgImg(pregnancyId: pregnancyId, imgFile: imgFile, checkUpId: checkUpId);
}

class GetPregnancyCheckImpl with GetPregnancyCheck {
  GetPregnancyCheckImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<PregnancyCheck>> call(PregnancyCheckUpWeek checkUpWeek) => _repo.getPregnancyCheck(checkUpWeek);
}


class GetMotherFormWarningStatusImpl with GetMotherFormWarningStatus {
  GetMotherFormWarningStatusImpl(this._repo);
  final PregnancyRepo _repo;
  @override
  Future<Result<List<FormWarningStatus>>> call(PregnancyCheckUpWeek checkUpWeek) => _repo.getMotherWarningStatus(checkUpWeek);
}