import 'package:common/arch/data/local/source/data_local_source.dart';
import 'package:common/arch/domain/model/_model_template.dart';

mixin DataRepo {
  Future<List<IdStringModel>> getCities();
}


class DataRepoImpl with DataRepo {
  final DataLocalSource _localSrc;
  DataRepoImpl(this._localSrc);

  @override
  Future<List<IdStringModel>> getCities() async {
    final raw = await _localSrc.getCities();
    return raw.map((e) => IdStringModel(id: e.id, name: e.name)).toList(growable: false);
  }
}