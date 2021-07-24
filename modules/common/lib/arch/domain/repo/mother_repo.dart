import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/local/source/pregnancy_local_source.dart';
import 'package:common/arch/data/remote/model/kehamilanku_overview_api_model.dart';
import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/value/const_values.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/annotation/data_annotation.dart';

import '../dummy_data.dart';

mixin MotherRepo {
  Future<Result<String>> getMotherNik();
  Future<Result<Mother>> getMotherData(String nik);
  Future<Result<bool>> saveMotherData(Mother data);

  //Future<Result<List<MotherHomeData>>> getMotherHomeData();

  Future<Result<bool>> saveMotherHpl(DateTime date);
  Future<Result<DateTime?>> getCurrentMotherHpl();
  Future<Result<bool>> deleteCurrentMotherHpl();

  Future<Result<bool>> saveMotherHpht(DateTime date);
  Future<Result<DateTime?>> getCurrentMotherHpht();

  Future<Result<int?>> getCurrentPregnancyId();
  Future<Result<bool>> saveCurrentPregnancyId(int pregnancyId);

  Future<Result<List<PregnancyEntity>>> getPregnancyOfUser(String motherNik,);
  Future<Result<bool>> savePregnancy({
    required int id,
    required String motherNik,
    required DateTime hpl,
  });
}

class MotherRepoImpl with MotherRepo {
  final AccountLocalSrc _accountLocalSrc;
  final PregnancyLocalSrc _pregnancyLocalSrc;
  MotherRepoImpl({
    required AccountLocalSrc accountLocalSrc,
    required PregnancyLocalSrc pregnancyLocalSrc,
  }):
    _accountLocalSrc = accountLocalSrc,
    _pregnancyLocalSrc = pregnancyLocalSrc
  ;

  @override
  Future<Result<String>> getMotherNik() async {
    final res1 = await _accountLocalSrc.getCurrentEmail();
    if(res1 is Success<String>) {
      final email = res1.data;
      return await _accountLocalSrc.getMotherNik(email);
    } else {
      return res1 as Fail<String>;
    }
  }

  @override @mayChangeInFuture
  Future<Result<Mother>> getMotherData(String nik) async {
    final map = dummyMother.toJson;
    final res = await _accountLocalSrc.getProfileByNik(nik, type: DbConst.TYPE_MOTHER);
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

  @override @mayChangeInFuture
  Future<Result<bool>> saveMotherData(Mother data) async => Success(true);

  @override
  Future<Result<bool>> saveMotherHpl(DateTime date) => _pregnancyLocalSrc.saveMotherHpl(date);
  @override
  Future<Result<DateTime?>> getCurrentMotherHpl() => _pregnancyLocalSrc.getCurrentMotherHpl();
  @override
  Future<Result<bool>> deleteCurrentMotherHpl() => _pregnancyLocalSrc.deleteCurrentMotherHpl();

  @override
  Future<Result<bool>> saveMotherHpht(DateTime date) => _pregnancyLocalSrc.saveMotherHpht(date);
  @override
  Future<Result<DateTime?>> getCurrentMotherHpht() => _pregnancyLocalSrc.getCurrentMotherHpht();

  @override
  Future<Result<int?>> getCurrentPregnancyId() => _pregnancyLocalSrc.getCurrentPregnancyId();
  @override
  Future<Result<bool>> saveCurrentPregnancyId(int pregnancyId) => _pregnancyLocalSrc.saveCurrentPregnancyId(pregnancyId);

  @override
  Future<Result<List<PregnancyEntity>>> getPregnancyOfUser(String motherNik,) =>
      _pregnancyLocalSrc.getPregnancyOfUser(motherNik);
  @override
  Future<Result<bool>> savePregnancy({
    required int id,
    required String motherNik,
    required DateTime hpl,
  }) => _pregnancyLocalSrc.savePregnancy(id: id, motherNik: motherNik, hpl: hpl);
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
  Future<Result<DateTime?>> getCurrentMotherHpl() async => Success(dummyMotherHpl);
  @override
  Future<Result<bool>> deleteCurrentMotherHpl() async => Success(true);

  @override
  Future<Result<bool>> saveMotherHpht(DateTime date) async => Success(true);
  @override
  Future<Result<DateTime?>> getCurrentMotherHpht() async => Success(dummyMotherHpht);

  @override
  Future<Result<int?>> getCurrentPregnancyId() async => Success(1);
  @override
  Future<Result<bool>> saveCurrentPregnancyId(int pregnancyId) async => Success(true);

  @override
  Future<Result<List<PregnancyEntity>>> getPregnancyOfUser(String motherNik,) async => Success([
    PregnancyEntity(id: 1, credentialId: 1, hpl: dummyMotherHpl)
  ]);
  @override
  Future<Result<bool>> savePregnancy({
    required int id,
    required String motherNik,
    required DateTime hpl,
  }) async => Success(true);
}