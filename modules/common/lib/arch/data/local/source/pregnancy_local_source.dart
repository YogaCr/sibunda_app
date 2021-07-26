import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/dao/pregnancy_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/value/const_values.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PregnancyLocalSrc {
  /*
  Future<Result<bool>> saveMotherHpl(DateTime date);
  Future<Result<DateTime?>> getCurrentMotherHpl();
  Future<Result<bool>> deleteCurrentMotherHpl();

  Future<Result<bool>> saveMotherHpht(DateTime date);
  Future<Result<DateTime?>> getCurrentMotherHpht();
  Future<Result<bool>> deleteCurrentMotherHpht();

  Future<Result<int?>> getCurrentPregnancyId();
  Future<Result<bool>> saveCurrentPregnancyId(int pregnancyId);
   */

  Future<Result<DateTime>> getMotherHpl(int pregnancyId);

  Future<Result<List<PregnancyEntity>>> getPregnancyOfUser(String motherNik,);
  Future<Result<bool>> savePregnancy({
    required int id,
    required String motherNik,
    required DateTime hpl,
  });

  Future<Result<bool>> clear();
}

class PregnancyLocalSrcImpl with PregnancyLocalSrc {
  final SharedPreferences _sharedPref;
  final ProfileDao _profileDao;
  final PregnancyDao _pregnancyDao;

  PregnancyLocalSrcImpl({
    required SharedPreferences sharedPref,
    required ProfileDao profileDao,
    required PregnancyDao pregnancyDao,
  }):
    _sharedPref = sharedPref,
    _profileDao = profileDao,
    _pregnancyDao = pregnancyDao
  ;
  /*
  @override
  Future<Result<bool>> saveMotherHpl(DateTime date) async {
    try {
      final res = await _sharedPref.setString(Const.KEY_HPL, date.toString());
      return Success(res);
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<DateTime?>> getCurrentMotherHpl() async {
    final hpl = _sharedPref.getString(Const.KEY_HPL);
    if(hpl == null) {
      return Success(null);
    }
    return Success(DateTime.parse(hpl));
  }
  @override
  Future<Result<bool>> deleteCurrentMotherHpl() async {
    try {
      final success = await _sharedPref.remove(Const.KEY_HPL);
      return Success(success);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error calling `deleteCurrentMotherHpl()`", error: e);
    }
  }

  @override
  Future<Result<bool>> saveMotherHpht(DateTime date) async {
    try {
      final res = await _sharedPref.setString(Const.KEY_HPHT, date.toString());
      return Success(res);
    } catch(e) {
      return Fail();
    }
  }
  @override
  Future<Result<DateTime?>> getCurrentMotherHpht() async {
    final hpl = _sharedPref.getString(Const.KEY_HPHT);
    if(hpl == null) {
      return Success(null);
    }
    return Success(DateTime.parse(hpl));
  }
  @override
  Future<Result<bool>> deleteCurrentMotherHpht() async {
    try {
      final success = await _sharedPref.remove(Const.KEY_HPHT);
      return Success(success);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error calling `deleteCurrentMotherHpht()`", error: e);
    }
  }

  @override
  Future<Result<int?>> getCurrentPregnancyId() async {
    final pregnancyId = _sharedPref.getInt(Const.KEY_CURRENT_PREGNANCY_ID);
    return Success(pregnancyId);
  }

  @override
  Future<Result<bool>> saveCurrentPregnancyId(int pregnancyId) async {
    try {
      final res = await _sharedPref.setInt(Const.KEY_CURRENT_PREGNANCY_ID, pregnancyId);
      return Success(res);
    } catch(e) {
      return Fail();
    }
  }
  */

  @override
  Future<Result<DateTime>> getMotherHpl(int pregnancyId) async {
    try {
      final res = await _pregnancyDao.getById(pregnancyId);
      if(res != null) {
        return Success(res.hpl);
      }
      return Fail(msg: "Can't get HPL date with `pregnancyId` of '$pregnancyId'");
    } catch(e, stack) {
      final msg = "Error calling `getMotherHpl()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
  @override
  Future<Result<List<PregnancyEntity>>> getPregnancyOfUser(String motherNik,) async {
    final credId = await _profileDao.getCredentialIdByNik(motherNik, type: DbConst.TYPE_MOTHER);
    if(credId == null) {
      return Fail(msg: "Can't get credential id of mother with `motherNik` = '$motherNik', in `getPregnancyOfUser()`");
    }
    final list = await _pregnancyDao.getPregnancyOfUser(credId);
    return Success(list);
  }
  @override
  Future<Result<bool>> savePregnancy({
    required int id,
    required String motherNik,
    required DateTime hpl,
  }) async {
    final credId = await _profileDao.getCredentialIdByNik(motherNik, type: DbConst.TYPE_MOTHER);
    if(credId == null) {
      return Fail(msg: "Can't get credential id of mother with `motherNik` = '$motherNik', in `savePregnancy()`");
    }
    final pregnancy = PregnancyEntity(id: id, credentialId: credId, hpl: hpl);
    final res = await _pregnancyDao.insert(pregnancy);
    return Success(res >= 0);
  }

  @override
  Future<Result<bool>> clear() async {
    try {
      /*
      final res1 = await deleteCurrentMotherHpl();
      if(res1 is Fail<bool>) {
        return res1;
      }
      final res2 = await deleteCurrentMotherHpht();
      if(res2 is Fail<bool>) {
        return res2;
      }
      return Success(
          (res1 as Success<bool>).data
              && (res2 as Success<bool>).data
      );
       */
      final deleted = await _pregnancyDao.deleteAll();
      return Success(true);
    } catch(e, stack) {
      final msg = "Error calling `clear()`";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e);
    }
  }
}

