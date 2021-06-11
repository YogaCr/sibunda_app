import 'package:common/data/model/family_data.dart';
import '../Result.dart';
import '../dummy_data.dart';

mixin MotherRepo {
  Future<Result<Mother>> getMotherData(String nik);
  Future<Result<bool>> saveMotherData(Mother data);
}

class MotherRepoDummy with MotherRepo {
  MotherRepoDummy._();
  static final obj = MotherRepoDummy._();

  @override
  Future<Result<Mother>> getMotherData(String nik) async => Success(dummyMother);
  @override
  Future<Result<bool>> saveMotherData(Mother data) async => Success(true);
}