import 'package:common/arch/data/remote/api/home_api.dart';
import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

import '../dummy_data.dart';

mixin EducationRepo {
  Future<Result<List<Tips>>> getEducationMainPanelDataList(String motherNik);
  Future<Result<List<Tips>>> getEducationHomeTipsList(String motherNik);
  Future<Result<TipsDetail>> getEducationDetail(Tips data);
  Future<Result<List<Tips>>> getHomeTipsList(String motherNik);
}


class EducationRepoImpl with EducationRepo {
  final HomeApi _homeApi;

  EducationRepoImpl({
    required HomeApi homeApi,
  }):
    _homeApi = homeApi
  ;

  @override
  Future<Result<List<Tips>>> getEducationMainPanelDataList(String motherNik) async {
    try {
      final res = await _homeApi.getInfoCarousel();
      if(res.code != 200) {
        return Fail(msg: "`getEducationMainPanelDataList()` msg= ${res.message} status= ${res.status}", code: res.code);
      }
      final list = res.data.map((e) => Tips.fromTipsResponse(e)).toList(growable: false);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getEducationMainPanelDataList()`", error: e);
    }
  }
  @override
  Future<Result<List<Tips>>> getEducationHomeTipsList(String motherNik) async {
    try {
      final res = await _homeApi.getInfoLatest();
      if(res.code != 200) {
        return Fail(msg: "`getEducationHomeTipsList()` msg= ${res.message} status= ${res.status}", code: res.code);
      }
      final list = res.data.map((e) => Tips.fromTipsResponse(e)).toList(growable: false);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getEducationHomeTipsList()`", error: e);
    }
  }
  @override
  Future<Result<TipsDetail>> getEducationDetail(Tips data) async {
    //TODO: Msh dummy, omongi Amir buat endpoint detailnya.
    final i = dummyTipsList.indexOf(data);
    return i >= 0
        ? Success(dummyTipsDetailList[i])
        : Fail();
  }

  @override
  Future<Result<List<Tips>>> getHomeTipsList(String motherNik) async {
    try {
      final res = await _homeApi.getDashboardData();
      if(res.code != 200) {
        return Fail(msg: "`getHomeTipsList()` msg= ${res.message} status= ${res.status}", code: res.code);
      }
      final list = res.data.tips_dan_info.map((e) => Tips.fromHomeResponse(e)).toList(growable: false);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getHomeTipsList()`", error: e);
    }
  }
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