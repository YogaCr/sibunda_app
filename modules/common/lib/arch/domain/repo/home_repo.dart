

import 'package:common/arch/data/remote/api/home_api.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

import '../dummy_data.dart';


mixin HomeStatusRepo {
  Future<Result<List<HomeStatus>>> getHomeStatusList(String motherNik); //TODO params
}

class HomeStatusRepoImpl with HomeStatusRepo {
  final HomeApi _homeApi;
  HomeStatusRepoImpl({
    required HomeApi homeApi,
  }): _homeApi = homeApi
  ;
  @override
  Future<Result<List<HomeStatus>>> getHomeStatusList(String motherNik) async {
    try {
      final res = await _homeApi.getDashboardData();
      if(res.code != 200) {
        return Fail(msg: "`getHomeStatusList()` msg= ${res.message}; status= ${res.status}", code: res.code);
      }
      final list = res.data.kesehatan_keluarga.map((e) => HomeStatus.fromResponse(e)).toList(growable: false);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getHomeStatusList()`", error: e, stack: stack,);
    }
  }
}
class HomeStatusRepoDummy with HomeStatusRepo {
  HomeStatusRepoDummy._();
  static final obj = HomeStatusRepoDummy._();
  @override
  Future<Result<List<HomeStatus>>> getHomeStatusList(String motherNik) async => Success(dummyStatusList);
}


mixin HomeMenuRepo {
  Future<Result<List<HomeMenu>>> getHomeMenuList();
}
///This should be not dummy.
class HomeMenuRepoDummy with HomeMenuRepo {
  HomeMenuRepoDummy._();
  static final obj = HomeMenuRepoDummy._();
  @override
  Future<Result<List<HomeMenu>>> getHomeMenuList() async => Success(dummyMenuList);
}


/*
mixin TipsRepo {
  Future<Result<List<Tips>>> getHomeTipsList(); //TODO params
}

class TipsRepoDummy with TipsRepo {
  TipsRepoDummy._();
  static final obj = TipsRepoDummy._();
  @override
  Future<Result<List<Tips>>> getHomeTipsList() async => Success(dummyTipsList);
}
 */