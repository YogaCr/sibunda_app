import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/repo/data_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetCityList {
  Future<Result<List<IdStringModel>>> call();
}
mixin GetCityById {
  Future<Result<IdStringModel>> call(int id);
}

class GetCityListImpl with GetCityList {
  final DataRepo _repo;
  GetCityListImpl(this._repo);
  @override
  Future<Result<List<IdStringModel>>> call() => _repo.getCities();
}
class GetCityByIdImpl with GetCityById {
  final DataRepo _repo;
  GetCityByIdImpl(this._repo);
  @override
  Future<Result<IdStringModel>> call(int id) => _repo.getCityById(id);
}