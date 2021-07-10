import 'package:common/arch/domain/model/notif_data.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:core/domain/model/result.dart';

mixin GetNotifList {
  Future<Result<List<HomeNotifMsg>>> call(String email, DateTime time);
}

mixin GetMessageList {
  Future<Result<List<HomeNotifMsg>>> call(String email, DateTime time);
}


class GetNotifListImpl with GetNotifList {
  GetNotifListImpl(this._repo);
  final NotifRepo _repo;
  @override
  Future<Result<List<HomeNotifMsg>>> call(String email, DateTime time) => _repo.getNotifList(email, time);
}

class GetMessageListImpl with GetMessageList {
  GetMessageListImpl(this._repo);
  final NotifRepo _repo;
  @override
  Future<Result<List<HomeNotifMsg>>> call(String email, DateTime time) => _repo.getMessageList(email, time);
}

