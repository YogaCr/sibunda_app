
import 'package:common/data/dummy_data.dart';
import 'package:common/data/model/family_data.dart';

import '../Result.dart';

mixin FamilyRepo {
  Future<Result<Mother>> getMotherData(String nik);
  Future<Result<Father>> getFatherData(String nik);
  Future<Result<bool>> sendMotherData(Mother data);
  Future<Result<bool>> sendFatherData(Father data);
}


class FamilyDummyRepo with FamilyRepo {
  @override
  Future<Result<Father>> getFatherData(String nik) async => Success(dummyFather);

  @override
  Future<Result<Mother>> getMotherData(String nik) async => Success(dummyMother);

  @override
  Future<Result<bool>> sendFatherData(Father data) async => Success(true);

  @override
  Future<Result<bool>> sendMotherData(Mother data) async => Success(true);
}

//class FamilyApiRepo with FamilyRepo {} //TODO 25 Mei 2021: Buat family repo pake api.