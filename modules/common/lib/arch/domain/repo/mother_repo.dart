import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/model/kehamilanku_overview_api_model.dart';
import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/value/const_values.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';

mixin MotherRepo {
  Future<Result<String>> getMotherNik();
  Future<Result<Mother>> getMotherData(String nik);
  Future<Result<bool>> saveMotherData(Mother data);

  //Future<Result<List<MotherHomeData>>> getMotherHomeData();

  Future<Result<bool>> saveMotherHpl(DateTime date);
  Future<Result<DateTime>> getCurrentMotherHpl();
}

class MotherRepoImpl with MotherRepo {
  final AccountLocalSrc _localSrc;
  MotherRepoImpl({
    required AccountLocalSrc localSrc,
  }):
    _localSrc = localSrc
  ;

  @override
  Future<Result<String>> getMotherNik() async {
    final res1 = await _localSrc.getCurrentEmail();
    if(res1 is Success<String>) {
      final email = res1.data;
      return await _localSrc.getMotherNik(email);
    } else {
      return res1 as Fail<String>;
    }
  }

  @override
  Future<Result<Mother>> getMotherData(String nik) async {
    final map = dummyMother.toJson;
    final res = await _localSrc.getProfileByNik(nik, type: DbConst.TYPE_MOTHER);
    if(res is Success<ProfileEntity>) {
      final prof = res.data;
      map[Const.KEY_NAME_INDO] = prof.name;
      map[Const.KEY_NIK] = prof.nik;
      map[Const.KEY_BIRTH_DATE] = prof.birthDate.toString();
      map[Const.KEY_BIRTH_PLACE] = prof.birthPlace;
      final mother = Mother.fromJson(map);
      return Success(mother);
    } else {
      return Fail();
    }
  }
  Future<Result<bool>> saveMotherData(Mother data);

  //Future<Result<List<MotherHomeData>>> getMotherHomeData();
  @override
  Future<Result<bool>> saveMotherHpl(DateTime date) async {

  }
  Future<Result<DateTime>> getCurrentMotherHpl();
}

class MotherRepoDummy with MotherRepo {
  MotherRepoDummy._();
  static final obj = MotherRepoDummy._();

  @override
  Future<Result<String>> getMotherNik() async => Success("0123012");
  @override
  Future<Result<Mother>> getMotherData(String nik) async => Success(dummyMother);
  @override
  Future<Result<bool>> saveMotherData(Mother data) async => Success(true);
/*
  @override
  Future<Result<List<MotherHomeData>>> getMotherHomeData() async => Success(motherHomeData);
 */
  @override
  Future<Result<bool>> saveMotherHpl(DateTime date) async => Success(true);
  @override
  Future<Result<DateTime>> getCurrentMotherHpl() async => Success(dummyMotherHpl);
}