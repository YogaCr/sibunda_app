import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:core/domain/model/result.dart';

mixin CheckUpLocalSrc {
  Future<Result<bool>> saveCheckUpId({
    required int id,
    required int period,
    required String nik,
  });
  Future<Result<int>> getCheckUpId({
    required int period,
    required String nik,
  });
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
    required String nik,
  }) async {
    try {
      final entity = CheckUpIdEntity(id: id, period: period, nik: nik);
      final rowId = await _checkUpIdDao.insert(entity);
      if(rowId < 0) {
        return Fail();
      }
      return Success(true);
    } catch(e) {
      return Fail(error: e);
    }
  }
  @override
  Future<Result<int>> getCheckUpId({
    required int period,
    required String nik,
  }) async {
    try {
      final e = await _checkUpIdDao.getByNikAndPeriod(nik: nik, period: period);
      if(e == null) {
        return Fail();
      }
      return Success(e.id);
    } catch(e) {
      return Fail(error: e);
    }
  }
}