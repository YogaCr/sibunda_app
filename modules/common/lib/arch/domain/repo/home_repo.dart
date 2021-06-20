

import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/domain/model/profile.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';

mixin ProfileRepo {
  Future<Result<Profile>> getProfile(String email);
}

class ProfileRepoDummy with ProfileRepo {
  ProfileRepoDummy._();
  static final obj = ProfileRepoDummy._();
  @override
  Future<Result<Profile>> getProfile(String email) async => Success(dummyProfile);
}


mixin HomeStatusRepo {
  Future<Result<List<HomeStatus>>> getHomeStatusList(); //TODO params
}

class HomeStatusRepoDummy with HomeStatusRepo {
  HomeStatusRepoDummy._();
  static final obj = HomeStatusRepoDummy._();
  @override
  Future<Result<List<HomeStatus>>> getHomeStatusList() async => Success(dummyStatusList);
}


mixin HomeMenuRepo {
  Future<Result<List<HomeMenu>>> getHomeMenuList(); //TODO params
}
///This should be not dummy.
class HomeMenuRepoDummy with HomeMenuRepo {
  HomeMenuRepoDummy._();
  static final obj = HomeMenuRepoDummy._();
  @override
  Future<Result<List<HomeMenu>>> getHomeMenuList() async => Success(dummyMenuList);
}



mixin TipsRepo {
  Future<Result<List<HomeTips>>> getHomeTipsList(); //TODO params
}

class TipsRepoDummy with TipsRepo {
  TipsRepoDummy._();
  static final obj = TipsRepoDummy._();
  @override
  Future<Result<List<HomeTips>>> getHomeTipsList() async => Success(dummyTipsList);
}