
import 'package:common/config/_config.dart';
import 'package:common/data/model/home_data.dart';
import 'package:common/res/theme/_theme.dart';
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
  final Color? bgColor;

  TopBarTitleAndBackFrame({
    required this.body,
    required this.title,
    this.topBarChild,
    this.padding,
    this.isScroll = false,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Stack(
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
      ),
    );
  }
}


class TopBarProfileFrame extends StatelessWidget {
  final Widget body;
  final String name;
  final String? desc;
  final Widget image;
  final Widget? actionBtn;
  final Widget? bottomBar;
  final EdgeInsets? padding;
  final void Function(BuildContext)? onActionBtnClick;
  final bool isScroll;
  final Color? bgColor;

  TopBarProfileFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.name,
    required this.image,
    required this.body,
    this.desc,
    this.actionBtn,
    this.bottomBar,
    this.onActionBtnClick,
    this.padding,
    this.isScroll = false,
    this.bgColor,
  });

  TopBarProfileFrame.fromData({
    required Profile data,
    required this.body,
    this.actionBtn,
    this.bottomBar,
    this.onActionBtnClick,
    this.padding,
    this.isScroll = false,
    this.bgColor,
  }):
    name = data.name,
    desc = "${data.age} tahun",
    image = Container(color: Manifest.theme.colorPrimary,) //TODO 13 Juni 2021: img
  ;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Container(
        margin: !isScroll ? EdgeInsets.only(top: _stdTopMargin) : null,
        child: Expanded(child: body,),
      ),
      RoundedTopNavBarProfile(
        name: name,
        desc: desc,
        image: image,
        actionBtn: actionBtn,
        onActionBtnClick: onActionBtnClick,
      ),
    ];

    if(bottomBar != null) {
      children.add(
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomBar,
        )
      );
    }

    return Container(
      color: bgColor,
      child: Stack(
        children: children,
      ),
    );
  }
}

class TopBarTabFrame extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final Color? bgColor;
  final Color? indicatorColor;
  final bool isScroll;

  TopBarTabFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.title,
    required this.tabs,
    required this.tabViews,
    this.padding,
    this.bgColor,
    this.indicatorColor,
    this.isScroll = false,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Container(
        color: bgColor,
        child: Stack(
          //mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: !isScroll ? EdgeInsets.only(top: _stdTopMargin) : null,
              child: Expanded(
                child: TabBarView(
                  children: tabViews,
                ),
              ),
            ),
            RoundedTopNavBarTitleAndBack(
              title: title,
              bottomChild: TabBar(
                indicatorColor: indicatorColor,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: grey_trans,
                tabs: tabs,
              ),
            ),
            //body,
          ],
        ),
      ),
    );
  }
}