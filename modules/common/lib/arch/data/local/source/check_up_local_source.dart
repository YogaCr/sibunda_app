import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin CheckUpLocalSrc {
  Future<Result<bool>> saveCheckUpId({
    required int id,
    required int period,
    required int refId,
    required int type,
  });
  Future<Result<int>> getCheckUpId({
    required int period,
    required int refId,
    int? type,
  });
  Future<Result<bool>> clear();
}


class CheckUpLocalSrcImpl with CheckUpLocalSrc {
  final CheckUpIdDao _checkUpIdDao;
  CheckUpLocalSrcImpl({
    required CheckUpIdDao checkUpIdDao,
  }):
    _checkUpIdDao = checkUpIdDao
  ;

  @override
  Future<Result<bool>> saveCheckUpId({
    required int id,
    required int period,
    required int refId,
    required int type,
  }) async {
    try {
      final entity = CheckUpIdEntity(id: id, period: period, refId: refId, type: type);
      final rowId = await _checkUpIdDao.insert(entity);
      prind("CheckUpLocalSrc.saveCheckUpId() rowId= $rowId");
      if(rowId < 0) {
        return Fail(msg: "Can't insert `CheckUpIdEntity` to DB");
      }
      return Success(true);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Can't insert `CheckUpIdEntity` to DB", error: e);
    }
  }
  @override
  Future<Result<int>> getCheckUpId({
    required int period,
    required int refId,
    int? type,
  }) async {
    try {
      prind("getCheckUpId() period = $period refId = $refId");
      final all = await _checkUpIdDao.getAll();
      prind("getCheckUpId() all = $all");
      final e = await _checkUpIdDao.getByRefIdAndPeriod(refId: refId, period: period, type: type);
      prind("getCheckUpId() e = $e");
      if(e == null) {
        return Fail(msg: "Can't get `CheckUpIdEntity` from DB with `period` '$period' and `refId` '$refId'",);
      }
      return Success(e.id);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Can't get `CheckUpIdEntity` from DB with `period` '$period' and `refId` '$refId'", error: e);
    }
  }
  @override
  Future<Result<bool>> clear() async {
    try {
      final res = await _checkUpIdDao.deleteAll();
      return Success(res > 0);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error calling `clear()`", error: e);
    }
  }
}