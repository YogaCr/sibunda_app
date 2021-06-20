
import 'package:common/arch/domain/model/child.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';


mixin ChildRepo {
  Future<Result<Child>> getChildData(String nik);
  Future<Result<bool>> saveChildData(Child data);
}


class ChildRepoDummy with ChildRepo {
  ChildRepoDummy._();
  static final obj = ChildRepoDummy._();

  @override
  Future<Result<Child>> getChildData(String nik) async => Success(dummyChild);
  @override
  Future<Result<bool>> saveChildData(Child data) async => Success(true);
}