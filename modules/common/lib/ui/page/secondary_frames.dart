
import 'package:common/config/_config.dart';
import 'package:common/data/model/home_data.dart';
import 'package:common/ui/widget/custom_top_nav_bar.dart';
import 'package:flutter/material.dart';

const _topBarHeight = 120.0;
const _stdTopMargin = _topBarHeight + 10;
const _stdContentAreaTopMargin = _topBarHeight - 20;

/// Safe area below TopBar with default design of this app for scroll view mode.
class BelowTopBarScrollContentArea extends StatelessWidget {
  final List<Widget> slivers;

  BelowTopBarScrollContentArea(this.slivers);

  @override
  Widget build(BuildContext context) {
    final usedSlivers = <Widget>[
      SliverToBoxAdapter(child: SizedBox(height: _stdTopMargin,),),
    ];
    usedSlivers.addAll(slivers);
    return CustomScrollView(
      slivers: usedSlivers,
    );
  }
}

class TopBarTitleAndBackFrame extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? topBarChild;
  final EdgeInsets? padding;
  final bool isScroll;

  TopBarTitleAndBackFrame({
    required this.body,
    required this.title,
    this.topBarChild,
    this.padding,
    this.isScroll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: !isScroll ? EdgeInsets.only(top: _stdTopMargin) : null,
          child: body,
        ),
        RoundedTopNavBarTitleAndBack(
          title: title,
          bottomChild: topBarChild,
        ),
      ],
    );
  }
}


class TopBarProfileFrame extends StatelessWidget {
  final Widget body;
  final String name;
  final String? desc;
  final Widget image;
  final Widget? actionBtn;
  final EdgeInsets? padding;
  final void Function(BuildContext)? onActionBtnClick;

  TopBarProfileFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.name,
    required this.image,
    required this.body,
    this.desc,
    this.actionBtn,
    this.onActionBtnClick,
    this.padding,
  });

  TopBarProfileFrame.fromData({
    required Profile data,
    required this.body,
    this.actionBtn,
    this.onActionBtnClick,
    this.padding,
  }):
    name = data.name,
    desc = "${data.age} tahun",
    image = Container(color: Manifest.theme.colorPrimary,) //TODO 13 Juni 2021: img
  ;

  @override
  Widget build(BuildContext context) {
    return Stack(
//        mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(top: _stdTopMargin),
          child: Expanded(child: body,),
        ),
        RoundedTopNavBarProfile(
          name: name,
          desc: desc,
          image: image,
          actionBtn: actionBtn,
          onActionBtnClick: onActionBtnClick,
        ),
      ],
    );
  }
}

class TopBarTabFrame extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final List<Tab> tabs;
  final List<Widget> tabViews;

  TopBarTabFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.title,
    required this.tabs,
    required this.tabViews,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Stack(
        //mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(top: _stdTopMargin,),
            child: Expanded(
              child: TabBarView(
                children: tabViews,
              ),
            ),
          ),
          RoundedTopNavBarTitleAndBack(
            title: title,
            bottomChild: TabBar(
              tabs: tabs,
            ),
          ),
          //body,
        ],
      ),
    );
  }
}