
import 'package:common/arch/domain/model/notif_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_items_home.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/ui/home/notif_and_message_vm.dart';

class HomeNotifAndMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ViewModelProvider.of<NotifAndMessageVm>(context)
      ..getNotifList()
      ..getMessageList();

    return TopBarTabFrame(
      withTopOffset: true,
      title: "Notifikasi",
      indicatorColor: yellow,
      tabs: [
        Tab(text: "Notifikasi",),
        Tab(text: "Pesan",),
      ],
      tabViews: [
        HomeNotifPage(),
        HomeMessagePage(),
      ],
    );
  }
}

class HomeNotifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsyncVmObserver<NotifAndMessageVm, List<HomeNotifMsg>>(
      liveDataGetter: (vm2) => vm2.notifList,
      builder: (ctx, data) => BelowTopBarScrollContentArea(slivers: [
        _notifMsgList(data, (data) => ItemNotif.fromData(data)),
      ]),
    );
  }
}

class HomeMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsyncVmObserver<NotifAndMessageVm, List<HomeNotifMsg>>(
      liveDataGetter: (vm2) => vm2.msgList,
      builder: (ctx, data) => BelowTopBarScrollContentArea(
        slivers: [
          _notifMsgList(data, (data) => ItemMessage.fromData(data)),
        ],
      ),
    );
  }
}


Widget _notifMsgList(
    List<HomeNotifMsg>? dataList,
    Widget Function(HomeNotifMsg) builder,
) {
  return SliverList(
    delegate: dataList?.isNotEmpty == true ? SliverChildBuilderDelegate(
        (ctx, i) => Container(
          margin: EdgeInsets.all(10),
          child: builder(dataList![i]),
        ),
      childCount: dataList!.length,
    ) : SliverChildListDelegate.fixed([
      dataList == null
          ? defaultLoading()
          : defaultNoData(),
    ]),
  );
}