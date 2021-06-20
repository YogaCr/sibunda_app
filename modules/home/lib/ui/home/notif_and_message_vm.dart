import 'package:common/arch/domain/model/notif_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:home/core/domain/usecase/notif_and_message_use_case.dart';

class NotifAndMessageVm extends AsyncVm {
  static const getNotifListKey = "getNotifList";
  static const getMessageListKey = "getMessageList";

  NotifAndMessageVm({
    required GetNotifList getNotifList,
    required GetMessageList getMessageList,
  }):
    _getMessageList = getMessageList,
    _getNotifList = getNotifList
  ;
  final GetNotifList _getNotifList;
  final GetMessageList _getMessageList;

  final MutableLiveData<List<HomeNotifMsg>> _notifList = MutableLiveData();
  final MutableLiveData<List<HomeNotifMsg>> _msgList = MutableLiveData();

  LiveData<List<HomeNotifMsg>> get notifList => _notifList;
  LiveData<List<HomeNotifMsg>> get msgList => _msgList;

  @override
  List<LiveData> get liveDatas => [notifList, msgList];

  void getNotifList([bool forceLoad = false]) {
    if(!forceLoad && _notifList.value != null) return;
    startJob(getNotifListKey, (isActive) async {
      _getNotifList("", "").then((value) { //TODO: email dan tgl
        if(value is Success<List<HomeNotifMsg>>) {
          final data = value.data;
          _notifList.value = data;
        }
      });
    });
  }
  void getMessageList([bool forceLoad = false]) {
    if(!forceLoad && _msgList.value != null) return;
    startJob(getMessageListKey, (isActive) async {
      _getMessageList("", "").then((value) { //TODO: email dan tgl
        if(value is Success<List<HomeNotifMsg>>) {
          final data = value.data;
          _msgList.value = data;
        }
      });
    });
  }
}