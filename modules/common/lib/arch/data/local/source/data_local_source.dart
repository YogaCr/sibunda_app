import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin DataLocalSource {
  Future<Result<List<CityEntity>>> getCities();
  Future<Result<CityEntity>> getCityById(int id);
  Future<Result<bool>> saveCities(List<CityEntity> data);
}

class DataLocalSourceImpl with DataLocalSource {
  final CityDao _cityDao;

  DataLocalSourceImpl({
    required CityDao cityDao,
  }): _cityDao = cityDao;

  @override
  Future<Result<List<CityEntity>>> getCities() async {
    try {
      final res = await _cityDao.get();
      return Success(res);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error calling `DataLocalSource.getCities()`", error: e);
    }
  }
  @override
  Future<Result<CityEntity>> getCityById(int id) async {
    final res = await _cityDao.getById(id);
    if(res == null) {
      return Fail(msg: "Can't get city by `id` of '$id'");
    }
    return Success(res);
  }
  @override
  Future<Result<bool>> saveCities(List<CityEntity> data) async {
    try {
      await _cityDao.insertAll(data);
      return Success(true);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error calling `DataLocalSource.saveCities()`", error: e);
    }
  }
}