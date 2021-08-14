
import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/pregnancy_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:common/arch/data/remote/model/baby_add_api_model.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

import '../dummy_data.dart';


mixin ChildRepo {
  Future<Result<Child>> getChildData(ProfileCredential credential);
  Future<Result<bool>> saveChildrenData({
    required List<Child> data,
    required String email,
    int? pregnancyId,
  });
  Future<Result<bool>> saveFetusesData({
    required List<DateTime> hpls,
    required String email,
  });
  //Future<Result<bool>> saveLastChildBirthDate(DateTime date);
  Future<Result<bool>> saveChildrenCount(int count);
  Future<Result<Profile>> getProfileByPregnancyId(int pregnancyId);
}

class ChildRepoImpl with ChildRepo {
  final AccountLocalSrc _accountLocalSrc;
  final ProfileDao _profileDao;
  final PregnancyDao _pregnancyDao;
  final DataApi _dataApi;

  ChildRepoImpl({
    required ProfileDao profileDao,
    required AccountLocalSrc accountLocalSrc,
    required PregnancyDao pregnancyDao,
    required DataApi dataApi,
  }):
    _profileDao = profileDao,
    _accountLocalSrc = accountLocalSrc,
    _pregnancyDao = pregnancyDao,
    _dataApi = dataApi
  ;

  @override
  Future<Result<Child>> getChildData(ProfileCredential credential) async {
    try {
      final res = await _dataApi.getBio();
      if(res.code != 200) {
        return Fail(msg: "Can't get child data from server with `credential` of '$credential'", code: res.code);
      }
      final map = res.data.first.kia_anak.firstWhere((e) => e.id == credential.id).toJson();
      prind("child map= $map");
      final data = Child.fromJson(map);
      return Success(data);
    } catch(e, stack) {
      final msg = "Error calling `getChildData`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e, stack: stack);
    }
  }
  @override
  Future<Result<bool>> saveChildrenData({
    required List<Child> data,
    required String email,
    int? pregnancyId,
  }) async {
    try {
      final profiles = await _profileDao.getProfilesByEmail(email);
      final userId = profiles.values.firstWhere((e) => e.isNotEmpty).first.userId;
      final motherId = profiles.values.firstWhere((e1) =>
        e1.length == 1 && e1.any((e2) =>
          e2.type == DbConst.TYPE_MOTHER
        )).first.serverId;
      final childProfiles = <ProfileEntity>[];
      var i = 0;
      for(final child in data) {
        final body = BabyAddBody(ibu_id: motherId, child: child);
        final res = await _dataApi.createChild(body);
        if(res.code != 200) {
          final msg = "Can't upload baby data in index $i with data of ${child.toJson} \n res= $res";
          prine(msg);
          return Fail(msg: msg);
        }
        final serverId = res.anak_id!;
        final childProfile = ProfileEntity(
          userId: userId,
          type: DbConst.TYPE_CHILD,
          serverId: serverId,
          name: child.name,
          nik: child.nik,
          birthDate: parseDate(child.birthDate),
          birthPlace: child.birthCity,
          pregnancyId: pregnancyId,
        );
        childProfiles.add(childProfile);
        i++;
      }
      final locRes = await _profileDao.insertAll(childProfiles);
      return Success(true);
    } catch(e, stack) {
      final msg = "Error calling `saveChildrenData()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }

  @override
  Future<Result<bool>> saveFetusesData({
    required List<DateTime> hpls,
    required String email,
  }) async {
    try {
      final profiles = await _profileDao.getProfilesByEmail(email);
      final userId = profiles.values.firstWhere((e) => e.isNotEmpty).first.userId;
      final motherId = profiles.values.firstWhere((e1) =>
      e1.length == 1 && e1.any((e2) =>
      e2.type == DbConst.TYPE_MOTHER
      )).first.serverId;
      final pregnancies = <PregnancyEntity>[];
      var i = 0;
      for(final hpl in hpls) {
        final body = FetusAddBody(ibu_id: motherId, janin_hpl: hpl.toString());
        final res = await _dataApi.createFetus(body);
        if(res.code != 200) {
          final msg = "Can't upload fetus data in index $i with hpl of $hpl \n res= $res";
          return Fail(msg: msg);
        }
        final serverId = res.anak_id!;
        final pregnancy = PregnancyEntity(
          id: serverId,
          credentialId: userId,
          hpl: hpl,
        );
        pregnancies.add(pregnancy);
        i++;
      }
      final locRes = await _pregnancyDao.insertAll(pregnancies);
      return Success(true);
    } catch(e, stack) {
      final msg = "Error calling `saveChildrenData()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  /*
  @override
  Future<Result<bool>> saveLastChildBirthDate(DateTime date);
   */
  @override Future<Result<bool>> saveChildrenCount(int count) async => Success(true);

  @override
  Future<Result<Profile>> getProfileByPregnancyId(int pregnancyId) async {
    try {
      final res = await _accountLocalSrc.getProfileByPregnancyId(pregnancyId);
      if(res is! Success<ProfileEntity>) {
        if(res.code == 1) {
          final msg = "Can't get baby profile with `pregnancyId` of '$pregnancyId'. It means the baby is not born yet";
          prinw(msg);
          return Fail(msg: msg);
        } else {
          return res as Fail<Profile>;
        }
      }
      return await _accountLocalSrc.getProfileByServerId(res.data.serverId);
    } catch(e, stack) {
      final msg = "Error calling `getProfileByPregnancyId()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
}


class ChildRepoDummy with ChildRepo {
  ChildRepoDummy._();
  static final obj = ChildRepoDummy._();

  @override
  Future<Result<Child>> getChildData(ProfileCredential credential) async => Success(dummyChild);
  @override
  Future<Result<bool>> saveChildrenData({
    required List<Child> data,
    required String email,
    int? pregnancyId,
  }) async => Success(true);

  @override
  Future<Result<bool>> saveFetusesData({required List<DateTime> hpls, required String email}) async => Success(true);

  @override Future<Result<bool>> saveChildrenCount(int count) async => Success(true);
  @override
  Future<Result<Profile>> getProfileByPregnancyId(int pregnancyId) async => Success(dummyProfile);
}