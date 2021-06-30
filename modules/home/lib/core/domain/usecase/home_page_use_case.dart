import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/education_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetHomeStatusList {
  Future<Result<List<HomeStatus>>> call(String motherNik);
}

mixin GetHomeMenuList {
  Future<Result<List<HomeMenu>>> call();
}

mixin GetHomeTipsList {
  Future<Result<List<Tips>>> call(String motherNik);
}


class GetHomeStatusListImpl with GetHomeStatusList {
  GetHomeStatusListImpl(this._repo);
  final HomeStatusRepo _repo;
  @override
  Future<Result<List<HomeStatus>>> call(String motherNik) => _repo.getHomeStatusList(motherNik);
}

class GetHomeMenuListImpl with GetHomeMenuList {
  GetHomeMenuListImpl(this._repo);
  final HomeMenuRepo _repo;
  @override
  Future<Result<List<HomeMenu>>> call() => _repo.getHomeMenuList();
}

class GetHomeTipsListImpl with GetHomeTipsList {
  GetHomeTipsListImpl(this._repo);
  final EducationRepo _repo;
  @override
  Future<Result<List<Tips>>> call(String motherNik) => _repo.getHomeTipsList(motherNik);
}

