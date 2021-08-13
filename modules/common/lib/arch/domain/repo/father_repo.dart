import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';


mixin FatherRepo {
  Future<Result<Father>> getFatherData(ProfileCredential credential);
  Future<Result<bool>> saveFatherData(Father data);
}

class FatherRepoImpl with FatherRepo {
  @override
  Future<Result<Father>> getFatherData(ProfileCredential credential) async => Success(dummyFather);
  @override
  Future<Result<bool>> saveFatherData(Father data) async => Success(true);
}

class FatherRepoDummy with FatherRepo {
  FatherRepoDummy._();
  static final obj = FatherRepoDummy._();

  @override
  Future<Result<Father>> getFatherData(ProfileCredential credential) async => Success(dummyFather);
  @override
  Future<Result<bool>> saveFatherData(Father data) async => Success(true);
}