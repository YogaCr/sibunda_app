import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin GetHomeStatusList {
  Future<Result<List<HomeStatus>>> call();
}

mixin GetHomeMenuList {
  Future<Result<List<HomeMenu>>> call();
}

mixin GetHomeTipsList {
  Future<Result<List<HomeTips>>> call();
}


class GetHomeStatusListImpl with GetHomeStatusList {
  GetHomeStatusListImpl(this._repo);
  final HomeStatusRepo _repo;
  @override
  Future<Result<List<HomeStatus>>> call() => _repo.getHomeStatusList();
}

class GetHomeMenuListImpl with GetHomeMenuList {
  GetHomeMenuListImpl(this._repo);
  final HomeMenuRepo _repo;
  @override
  Future<Result<List<HomeMenu>>> call() => _repo.getHomeMenuList();
}

class GetHomeTipsListImpl with GetHomeTipsList {
  GetHomeTipsListImpl(this._repo);
  final TipsRepo _repo;
  @override
  Future<Result<List<HomeTips>>> call() => _repo.getHomeTipsList();
}

