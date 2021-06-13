
import 'package:common/data/model/notif_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:common/ui/widget/bloc/result_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/ui/page/secondary_frames.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/notif_event.dart';
import 'package:sibunda_app/bloc/notif_bloc.dart';
import 'package:sibunda_app/bloc/state/notif_state.dart';

class HomeNotifAndMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TopBarTabFrame(
      isScroll: true,
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
    final bloc = BlocProvider.of<NotifBloc>(context);
    bloc.add(GetNotifData(email: "email", time: "time")); //TODO: email and time.

    return buildReactiveBlocBuilder<
        NotifBloc, NotifState, OnNotifDataChanged, List<HomeNotifMsg>
    >(
      stateDataGetter: (state) => state.data,
      blocDataGetter: (bloc) => bloc.notifList,
      builder: (data) => BelowTopBarScrollContentArea([
        _notifMsgList(data, (data) => ItemNotif.fromData(data)),
      ]),
    );
  }
}

class HomeMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NotifBloc>(context);
    bloc.add(GetMessageData(email: "email", time: "time")); //TODO: email and time.

    return buildReactiveBlocBuilder<
        NotifBloc, NotifState, OnMessageDataChanged, List<HomeNotifMsg>
    >(
      stateDataGetter: (state) => state.data,
      blocDataGetter: (bloc) => bloc.messageList,
      builder: (data) => BelowTopBarScrollContentArea([
        _notifMsgList(data, (data) => ItemMessage.fromData(data)),
      ]),
    );
  }
}


Widget _notifMsgList(
    List<HomeNotifMsg> dataList,
    Widget Function(HomeNotifMsg) builder,
) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
        (ctx, i) => Container(
          margin: EdgeInsets.all(10),
          child: builder(dataList[i]),
        ),
      childCount: dataList.length,
    ),
  );
}