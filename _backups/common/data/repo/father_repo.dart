import 'package:common/data/model/father.dart';
import '../Result.dart';
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