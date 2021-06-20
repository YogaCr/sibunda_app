import 'package:common/arch/domain/model/notif_data.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';

mixin NotifRepo {
  Future<Result<List<HomeNotifMsg>>> getNotifList(String email, String time);
  Future<Result<List<HomeNotifMsg>>> getMessageList(String email, String time);
}

class NotifRepoDummy with NotifRepo {
  NotifRepoDummy._();
  static final obj = NotifRepoDummy._();
  @override
  Future<Result<List<HomeNotifMsg>>> getNotifList(String email, String time) async => Success(dummyNotifList);
  @override
  Future<Result<List<HomeNotifMsg>>> getMessageList(String email, String time) async => Success(dummyMessageList);
}