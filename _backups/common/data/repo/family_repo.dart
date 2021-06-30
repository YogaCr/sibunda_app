
export 'father_repo.dart';
export 'mother_repo.dart';
export 'child_repo.dart';

/*
mixin FamilyRepo {
  Future<Result<Mother>> getMotherData(String nik);
  Future<Result<Father>> getFatherData(String nik);
  Future<Result<Father>> getChildData(String nik);
  Future<Result<bool>> sendMotherData(Mother data);
  Future<Result<bool>> sendFatherData(Father data);
  Future<Result<bool>> sendChildData(Father data);
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

  @override
  Future<Result<Father>> getChildData(String nik) {
    // TODO: implement getChildData
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> sendChildData(Father data) {
    // TODO: implement sendChildData
    throw UnimplementedError();
  }
}

//class FamilyApiRepo with FamilyRepo {} //TODO 25 Mei 2021: Buat family repo pake api.

 */