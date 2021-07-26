import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetBabyNik {
  Future<Result<Map<int, String>>> call();
}

mixin GetBornBabyList {
  Future<Result<List<BabyOverlayData>>> call(String motherNik);
}

mixin GetUnbornBabyList {
  Future<Result<List<BabyOverlayData>>> call(String motherNik);
}

mixin IsBabyBorn {
  Future<Result<bool>> call(int pregnancyId);
}



class GetBabyNikImpl with GetBabyNik {
  final MyBabyRepo _repo;
  GetBabyNikImpl(this._repo);
  @override
  Future<Result<Map<int, String>>> call() => _repo.getBabyNik();
}

class GetBornBabyListImpl with GetBornBabyList {
  final MyBabyRepo _repo;
  GetBornBabyListImpl(this._repo);
  @override
  Future<Result<List<BabyOverlayData>>> call(String motherNik) => _repo.getBornBabyOverlayData(motherNik);
}

class GetUnbornBabyListImpl with GetUnbornBabyList {
  final MyBabyRepo _repo;
  GetUnbornBabyListImpl(this._repo);
  @override
  Future<Result<List<BabyOverlayData>>> call(String motherNik) => _repo.getUnbornBabyOverlayData(motherNik);
}

class IsBabyBornImpl with IsBabyBorn {
  final ChildRepo _repo;
  IsBabyBornImpl(this._repo);
  @override
  Future<Result<bool>> call(int pregnancyId) async {
    final res = await _repo.getProfileByPregnancyId(pregnancyId);
    return Success(res is Success<Profile>);
  }
}