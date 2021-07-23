import 'package:common/arch/domain/model/notif_data.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';
import 'package:home/core/domain/usecase/notif_and_message_use_case.dart';

class NotifAndMessageVm extends AsyncAuthVm {
  static const getNotifListKey = "getNotifList";
  static const getMessageListKey = "getMessageList";

  NotifAndMessageVm({
    BuildContext? context,
    required GetCurrentEmail getCurrentEmail,
    required GetNotifList getNotifList,
    required GetMessageList getMessageList,
  }):
    _getCurrentEmail = getCurrentEmail,
    _getMessageList = getMessageList,
    _getNotifList = getNotifList, super(context: context)
  ;
  final GetCurrentEmail _getCurrentEmail;
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
      final res1 = await _getCurrentEmail();
      if(res1 is Success<String>) {
        final email = res1.data;
        final res2 = await _getNotifList(email, DateTime.now());
        if(res2 is Success<List<HomeNotifMsg>>) {
          final data = res2.data;
          _notifList.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
  void getMessageList([bool forceLoad = false]) {
    if(!forceLoad && _msgList.value != null) return;
    startJob(getMessageListKey, (isActive) async {
      final res1 = await _getCurrentEmail();
      if(res1 is Success<String>) {
        final email = res1.data;
        final res2 = await _getMessageList(email, DateTime.now());
        if(res2 is Success<List<HomeNotifMsg>>) {
          final data = res2.data;
          _msgList.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
}