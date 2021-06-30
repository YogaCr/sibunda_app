import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/repo/education_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetEducationMainPanelData {
  Future<Result<List<Tips>>> call(String motherNik);
}

mixin GetEducationHomeTipsData {
  Future<Result<List<Tips>>> call(String motherNik);
}


class GetEducationMainPanelDataImpl with GetEducationMainPanelData {
  final EducationRepo _repo;
  GetEducationMainPanelDataImpl(this._repo);
  @override
  Future<Result<List<Tips>>> call(String motherNik) => _repo.getEducationMainPanelDataList(motherNik);
}

class GetEducationHomeTipsDataImpl with GetEducationHomeTipsData {
  final EducationRepo _repo;
  GetEducationHomeTipsDataImpl(this._repo);
  @override
  Future<Result<List<Tips>>> call(String motherNik) => _repo.getEducationHomeTipsList(motherNik);
}