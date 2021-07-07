import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/domain/model/_model_template.dart';

mixin DataLocalSource {
  Future<List<CityEntity>> getCities();
}

class DataLocalSourceImpl with DataLocalSource {
  final CityDao _cityDao;

  DataLocalSourceImpl({
    required CityDao cityDao,
  }): _cityDao = cityDao;

  @override
  Future<List<CityEntity>> getCities() => _cityDao.get();
}