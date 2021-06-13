
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/ui/page/secondary_frames.dart';

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
    return BelowTopBarScrollContentArea([
      SliverList(
        delegate: SliverChildBuilderDelegate(
            (ctx, i) => Container(
              margin: EdgeInsets.all(10),
              child: ItemNotif(
                title: "Notif $i",
                content: "Ini isi dari notif ke $i",
                image: Container(color: Colors.blue,),
                timestamp: "2021-06-05 $i",
              ),
            ),
          childCount: 10
        ),
      ),
    ]);
  }
}

class HomeMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BelowTopBarScrollContentArea([
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (ctx, i) => Container(
            margin: EdgeInsets.all(10),
            child: ItemMessage(
              title: "Ini Judul dari Pesan ke $i",
              content: "Ini isi dari pesan ke $i",
              image: Container(color: Colors.blue,),
              timestamp: "2021-06-05 $i",
            ),
          ),
          childCount: 10,
        ),
      ),
    ]);
  }
}