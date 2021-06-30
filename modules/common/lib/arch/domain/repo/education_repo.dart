import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';

mixin EducationRepo {
  Future<Result<List<Tips>>> getEducationMainPanelDataList(String motherNik);
  Future<Result<List<Tips>>> getEducationHomeTipsList(String motherNik);
  Future<Result<TipsDetail>> getEducationDetail(Tips data);
  Future<Result<List<Tips>>> getHomeTipsList(String motherNik);
}


class EducationRepoDummy with EducationRepo {
  EducationRepoDummy._();
  static final obj = EducationRepoDummy._();

  @override
  Future<Result<List<Tips>>> getEducationMainPanelDataList(String motherNik) async => Success(dummyTipsList);
  @override
  Future<Result<List<Tips>>> getEducationHomeTipsList(String motherNik) async => Success(dummyTipsList);
  @override
  Future<Result<TipsDetail>> getEducationDetail(Tips data) async {
    final i = dummyTipsList.indexOf(data);
    return i >= 0
        ? Success(dummyTipsDetailList[i])
        : Fail();
  }
  @override
  Future<Result<List<Tips>>> getHomeTipsList(String motherNik) async => Success(dummyTipsList);
}