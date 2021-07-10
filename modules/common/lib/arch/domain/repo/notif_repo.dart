import 'package:common/arch/data/remote/api/home_api.dart';
import 'package:common/arch/domain/model/notif_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

import '../dummy_data.dart';

mixin NotifRepo {
  Future<Result<List<HomeNotifMsg>>> getNotifList(String email, DateTime time);
  Future<Result<List<HomeNotifMsg>>> getMessageList(String email, DateTime time);
}

class NotifRepoImpl with NotifRepo {
  final HomeApi _api;

  NotifRepoImpl({
    required HomeApi api,
  }):
    _api = api
  ;

  @override
  Future<Result<List<HomeNotifMsg>>> getNotifList(String email, DateTime time) async {
    try {
      final res = await _api.getNotifs();
      if(res.code != 200) {
        return Fail(msg: "msg= ${res.message}; status= ${res.status}", code: res.code);
      }
      final list = res.data.map((e) => HomeNotifMsg.fromResponse(e)).toList(growable: false);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getNotifList()`", error: e);
    }
  }

  @override
  Future<Result<List<HomeNotifMsg>>> getMessageList(String email, DateTime time) async {
    try {
      final res = await _api.getMessages();
      if(res.code != 200) {
        return Fail(msg: "msg= ${res.message}; status= ${res.status}", code: res.code);
      }
      final list = res.data.map((e) => HomeNotifMsg.fromResponse(e)).toList(growable: false);
      return Success(list);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Error calling `getNotifList()`", error: e);
    }
  }
}

class NotifRepoDummy with NotifRepo {
  NotifRepoDummy._();
  static final obj = NotifRepoDummy._();
  @override
  Future<Result<List<HomeNotifMsg>>> getNotifList(String email, DateTime time) async => Success(dummyNotifList);
  @override
  Future<Result<List<HomeNotifMsg>>> getMessageList(String email, DateTime time) async => Success(dummyMessageList);
}