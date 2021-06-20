import 'package:common/arch/domain/model/father.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';


mixin FatherRepo {
  Future<Result<Father>> getFatherData(String nik);
  Future<Result<bool>> saveFatherData(Father data);
}

class FatherRepoDummy with FatherRepo {
  FatherRepoDummy._();
  static final obj = FatherRepoDummy._();

  @override
  Future<Result<Father>> getFatherData(String nik) async => Success(dummyFather);
  @override
  Future<Result<bool>> saveFatherData(Father data) async => Success(true);
}