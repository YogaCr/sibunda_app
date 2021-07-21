import 'package:common/arch/data/local/dao/account_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/value/const_values.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin AccountLocalSrc {
  //Future<Result<bool>> saveSignupData(SignUpData signup); //For now, `SignUpData` is saved as batch with other data type.
  Future<Result<bool>> saveBatchProfile({
    required int userId,
    required int userRole,
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required List<Child> children,
    required BatchProfileIds ids,
  });
  Future<Result<bool>> saveSession(SessionData data);
  Future<Result<bool>> deleteSession();
  /// Returns null if user hasn't logged in yet.
  Future<Result<SessionData?>> getSession();

  Future<Result<ProfileEntity>> getProfileByNik(String nik, { int? type });

  Future<Result<String>> getMotherNik(String email);
  Future<Result<String>> getFatherNik(String email);
  Future<Result<String>> getChildNik(String email);

  Future<Result<int>> getMotherId(String nik);
  Future<Result<int>> getFatherId(String nik);
  Future<Result<int>> getChildId(String nik);

  Future<Result<Profile>> getProfile(String email);

  Future<Result<bool>> saveCurrentEmail(String email);
  Future<Result<String>> getCurrentEmail();
  Future<Result<bool>> deleteCurrentEmail();

  Future<Result<bool>> clear();
}

class AccountLocalSrcImpl with AccountLocalSrc {
  final CredentialDao _credentialDao;
  final ProfileDao _profileDao;
  final ProfileTypeDao _profileTypeDao;
  final SharedPreferences _sharedPref;

  AccountLocalSrcImpl({
    required CredentialDao credentialDao,
    required ProfileDao profileDao,
    required ProfileTypeDao profileTypeDao,
    required SharedPreferences sharedPref,
  }):
    _credentialDao = credentialDao,
    _profileDao = profileDao,
    _profileTypeDao = profileTypeDao,
    _sharedPref = sharedPref
  ;

  @override
  Future<Result<bool>> saveBatchProfile({
    required int userId,
    required int userRole,
    required SignUpData signup,
    required Mother mother,
    required Father father,
    required List<Child> children,
    required BatchProfileIds ids,
  }) async {
    final credential = CredentialEntity(
      id: userId,
      name: signup.name,
      email: signup.email,
      role: userRole,
    );

    final motherProf = ProfileEntity(
      userId: userId,
      type: DbConst.TYPE_MOTHER,
      name: mother.name,
      nik: mother.nik,
      birthDate: DateTime.parse(mother.birthDate),
      birthPlace: mother.birthCity,
      serverId: ids.motherId,
    );
    final fatherProf = ProfileEntity(
      userId: userId,
      type: DbConst.TYPE_FATHER,
      name: father.name,
      nik: father.nik,
      birthDate: DateTime.parse(father.birthDate),
      birthPlace: father.birthCity,
      serverId: ids.fatherId,
    );
    final childProfs = List<ProfileEntity>.generate(children.length, (i) {
      final child = children[i];
      final id = ids.childrenId[i];
      return ProfileEntity(
        userId: userId,
        type: DbConst.TYPE_CHILD,
        name: child.name,
        nik: child.nik,
        birthDate: DateTime.parse(child.birthDate),
        birthPlace: child.birthCity,
        serverId: id,
      );
    });
    final profiles = [motherProf, fatherProf, ...childProfs];

    final credRowId = await _credentialDao.insert(credential);
    if(credRowId < 0) {
      return Fail(msg: "Can't insert `credential` '$credential'");
    }
    await _profileDao.insertAll(profiles);
    return Success(true);
  }

  @override
  Future<Result<bool>> saveSession(SessionData data) async {
    try {
      await _sharedPref.setString(Const.KEY_SESSION, data.toAuthString());
      return Success(true);
    } catch(e) {
      return Fail();
    }
  }

  @override
  Future<Result<bool>> deleteSession() async {
    try {
      final res = await _sharedPref.remove(Const.KEY_SESSION);
      return Success(res);
    } catch(e) {
      return Fail();
    }
  }

  /// Returns null if user hasn't logged in yet.
  @override
  Future<Result<SessionData?>> getSession() async {
    try {
      final sessionStrList = _sharedPref.getString(Const.KEY_SESSION)?.split(" ");
      if(sessionStrList == null) {
        return Success(null);
      }
      final data = SessionData(tokenType: sessionStrList[0], token: sessionStrList[1],);
      return Success(data);
    } catch(e) {
      return Fail();
    }
  }

  @override
  Future<Result<ProfileEntity>> getProfileByNik(String nik, { int? type }) async {
    final profile = await _profileDao.getByNik(nik, type: type);
    if(profile == null) {
      return Fail();
    }
    return Success(profile);
  }
  @override
  Future<Result<String>> getMotherNik(String email) async {
    final niks = await _profileDao.getNiksByEmail(email);
    final nik = niks[DbConst.TYPE_MOTHER];
    if(nik != null) {
      return Success(nik);
    } else {
      return Fail();
    }
  }
  @override
  Future<Result<String>> getFatherNik(String email) async {
    final niks = await _profileDao.getNiksByEmail(email);
    final nik = niks[DbConst.TYPE_FATHER];
    if(nik != null) {
      return Success(nik);
    } else {
      return Fail();
    }
  }
  @override
  Future<Result<String>> getChildNik(String email) async {
    try {
      prind("AccountLocalSrcImpl getChildNik() email = $email");
      final niks = await _profileDao.getNiksByEmail(email);
      prind("AccountLocalSrcImpl getChildNik() niks = $niks");
      final nik = niks[DbConst.TYPE_CHILD];
      if(nik != null) {
        return Success(nik);
      } else {
        return Fail();
      }
    } catch(e, stack) {
      prine(stack);
      return Fail(error: e);
    }
  }

  @override
  Future<Result<int>> getMotherId(String nik) async {
    final ids = await _profileDao.getServerIdByNik(nik);
    final id = ids[DbConst.TYPE_MOTHER];
    if(id != null) {
      return Success(id);
    } else {
      return Fail();
    }
  }
  @override
  Future<Result<int>> getFatherId(String nik) async {
    final ids = await _profileDao.getServerIdByNik(nik);
    final id = ids[DbConst.TYPE_FATHER];
    if(id != null) {
      return Success(id);
    } else {
      return Fail();
    }
  }
  @override
  Future<Result<int>> getChildId(String nik) async {
    final ids = await _profileDao.getServerIdByNik(nik);
    final id = ids[DbConst.TYPE_CHILD];
    if(id != null) {
      return Success(id);
    } else {
      return Fail(msg: "`getChildId()` Can't get child id with nik = $nik");
    }
  }

  @override
  Future<Result<Profile>> getProfile(String email) async {
    final ent = await _credentialDao.getByEmail(email);
    if(ent == null) {
      return Fail();
    }
    final profile = Profile(name: ent.name, email: ent.email, img: dummyImg_profile); //TODO: dummy img.
    return Success(profile);
  }

  @override
  Future<Result<bool>> saveCurrentEmail(String email) async {
    try {
      final res = await _sharedPref.setString(Const.KEY_ACTIVE_EMAIL, email);
      return Success(res);
    } catch(e) {
      return Fail();
    }
  }

  @override
  Future<Result<String>> getCurrentEmail() async {
    final email = _sharedPref.getString(Const.KEY_ACTIVE_EMAIL);
    if(email == null) {
      return Fail();
    }
    return Success(email);
  }

  @override
  Future<Result<bool>> deleteCurrentEmail() async {
    try {
      final res = await _sharedPref.remove(Const.KEY_ACTIVE_EMAIL);
      return Success(res);
    } catch(e) {
      return Fail();
    }
  }

  @override
  Future<Result<bool>> clear() async {
    try {
      final res = await _profileDao.deleteAll();
      return Success(res > 0);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error calling `AccountLocalSrcImpl.clear()`", error: e);
    }
  }
}