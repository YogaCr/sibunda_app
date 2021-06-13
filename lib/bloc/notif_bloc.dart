import 'package:common/data/model/notif_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/notif_event.dart';
import 'package:sibunda_app/bloc/state/notif_state.dart';
import 'package:common/data/repo/notif_repo.dart';

class NotifBloc extends Bloc<NotifEvent, NotifState> {
  final NotifRepo repo;
  NotifBloc(this.repo) : super(OnNotifInit());

  List<HomeNotifMsg>? _notifList;
  List<HomeNotifMsg>? _messageList;

  List<HomeNotifMsg>? get notifList => _notifList;
  List<HomeNotifMsg>? get messageList => _messageList;

  @override
  Stream<NotifState> mapEventToState(NotifEvent event) async* {
    if(event is GetNotifData) {
      final res = await repo.getNotifList(event.email, event.time);
      yield OnNotifDataChanged(res);
    } else if(event is GetMessageData) {
      final res = await repo.getMessageList(event.email, event.time);
      yield OnMessageDataChanged(res);
    }
  }

}