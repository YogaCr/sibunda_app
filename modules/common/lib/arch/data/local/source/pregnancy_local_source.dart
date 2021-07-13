import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PregnancyLocalSrc {
  Future<Result<bool>> saveMotherHpl(DateTime date);
  Future<Result<DateTime>> getCurrentMotherHpl();
  Future<Result<bool>> deleteCurrentMotherHpl();

  Future<Result<bool>> saveMotherHpht(DateTime date);
  Future<Result<DateTime>> getCurrentMotherHpht();

}

class PregnancyLocalSrcImpl with PregnancyLocalSrc {
  final SharedPreferences _sharedPref;

  PregnancyLocalSrcImpl({
    required SharedPreferences sharedPref,
  }):
    _sharedPref = sharedPref
  ;

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
  Future<Result<DateTime>> getCurrentMotherHpl() async {
    final hpl = _sharedPref.getString(Const.KEY_HPL);
    if(hpl == null) {
      return Fail();
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
  Future<Result<DateTime>> getCurrentMotherHpht() async {
    final hpl = _sharedPref.getString(Const.KEY_HPHT);
    if(hpl == null) {
      return Fail();
    }
    return Success(DateTime.parse(hpl));
  }
}

