import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/source/data_local_source.dart';
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin DataRepo {
  Future<Result<List<IdStringModel>>> getCities();
  Future<Result<bool>> saveCities(List<IdStringModel> data);
}


class DataRepoImpl with DataRepo {
  final DataLocalSource _localSrc;
  final DataApi _api;
  DataRepoImpl({
    required DataLocalSource localSrc,
    required DataApi api,
  }):
    _api = api,
    _localSrc = localSrc
  ;

  @override
  Future<Result<List<IdStringModel>>> getCities() async {
    var res1 = await _localSrc.getCities();
    prind("`DataRepo.getCities()` city from local first res1 = $res1");
    if(res1 is Success<List<CityEntity>>) {
      var raw = res1.data;
      if(raw.isEmpty) {
        try {
          final res = await _api.getCity();
          prind("`DataRepo.getCities()` city from api res = $res");
          raw = res.map((e) => CityEntity(id: e.id, name: e.name)).toList(growable: false);
          final res2 = await _localSrc.saveCities(raw);
          prind("`DataRepo.getCities()` save to local res2 = $res2");
          if(res2 is Fail<bool>) {
            prine("Can't save downloaded city data list in `DataRepo.getCities()`; fail = $res2");
          }
        } catch(e, stack) {
          prine("Error calling `DataRepo.getCities()`; e= $e");
          prine(stack);
          return Fail(msg: "Error calling `DataRepo.getCities()`", error: e);
        }
      }
      final list = raw.map((e) => IdStringModel(id: e.id, name: e.name)).toList(growable: false);
      return Success(list);
    } else {
      return (res1 as Fail<List<CityEntity>>).copy();
    }
  }
  @override
  Future<Result<bool>> saveCities(List<IdStringModel> data) => _localSrc.saveCities(
    data.map((e) => CityEntity(id: e.id, name: e.name)).toList(growable: false),
  );
}