
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/arch/ui/widget/custom_top_nav_bar.dart';
import 'package:flutter/material.dart';

const topBarHeight = 120.0;
const stdTopMargin = topBarHeight + 10;
const stdContentAreaTopMargin = topBarHeight - 20;

/// Safe area below TopBar with default design of this app for scroll view mode.
class BelowTopBarScrollContentArea extends StatelessWidget {
  final List<Widget> slivers;
  final ScrollController? controller;

  BelowTopBarScrollContentArea({
    required this.slivers,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final usedSlivers = <Widget>[
      SliverToBoxAdapter(child: SizedBox(height: stdTopMargin,),),
      ...slivers,
    ];
    return CustomScrollView(
      slivers: usedSlivers,
      controller: controller,
    );
  }
}

/// Safe area below TopBar with default design of this app for view mode.
class BelowTopBarContentArea extends StatelessWidget {
  final Widget child;

  BelowTopBarContentArea({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: stdTopMargin),
      child: child,
    );
  }
}

class TopBarPlainFrame extends StatelessWidget {
  final Widget body;
  final EdgeInsets? padding;
  final bool withTopOffset;
  final Color? bgColor;
  /// These are in [Stack] widget.
  final List<Widget> topBarChildren;
  final Widget? bottomBar;
  final Widget? contentOverlay;

  TopBarPlainFrame({
    required this.body,
    this.topBarChildren = const [],
    this.padding,
    this.withTopOffset = false,
    this.bgColor,
    this.bottomBar,
    this.contentOverlay,
  });

  @override
  Widget build(BuildContext context) {

    final children = <Widget>[
      Container(
        margin: !withTopOffset ? EdgeInsets.only(top: stdTopMargin) : null,
        child: body,
      ),
      RoundedTopNavBarBg(
        children: topBarChildren,
      ),
    ];

    if(bottomBar != null) {
      children.add(
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomBar,
        ),
      );
    }

    if(contentOverlay != null) {
      children.insert(1, contentOverlay!);
    }

    return Container(
      color: bgColor,
      child: Stack(
        children: children,
      ),
    );
  }
}

class TopBarTitleAndBackFrame extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? topBarChild;
  final Widget? contentOverlay;
  final EdgeInsets? padding;
  final bool withTopOffset;
  final Color? bgColor;

  TopBarTitleAndBackFrame({
    required this.body,
    required this.title,
    this.topBarChild,
    this.contentOverlay,
    this.padding,
    this.withTopOffset = false,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Container(
        margin: !withTopOffset ? EdgeInsets.only(top: stdTopMargin) : null,
        child: body,
      ),
      RoundedTopNavBarTitleAndBack(
        title: title,
        bottomChild: topBarChild,
      ),
    ];
    if(contentOverlay != null) {
      children.insert(1, contentOverlay!);
    }
    return Container(
      color: bgColor,
      child: Stack(
        children: children,
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
  final Widget? contentOverlay;
  final EdgeInsets? padding;
  final void Function(BuildContext)? onActionBtnClick;
  final bool withTopOffset;
  final Color? bgColor;

  TopBarProfileFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.name,
    required this.image,
    required this.body,
    this.desc,
    this.actionBtn,
    this.bottomBar,
    this.contentOverlay,
    this.onActionBtnClick,
    this.padding,
    this.withTopOffset = false,
    this.bgColor,
  });

  TopBarProfileFrame.fromData({
    required Profile data,
    required this.body,
    this.actionBtn,
    this.bottomBar,
    this.contentOverlay,
    this.onActionBtnClick,
    this.padding,
    this.withTopOffset = false,
    this.bgColor,
  }):
    name = data.name,
    desc = data.email,
    image = Container(color: Manifest.theme.colorPrimary,) //TODO 13 Juni 2021: img
  ;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Container(
        margin: !withTopOffset ? EdgeInsets.only(top: stdTopMargin) : null,
        child: body,
      ),
      RoundedTopNavBarProfile(
        name: name,
        desc: desc,
        image: image,
        actionBtn: actionBtn,
        onActionBtnClick: onActionBtnClick,
      ),
    ];

    if(contentOverlay != null) {
      children.insert(1, contentOverlay!);
    }

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
  final Widget? contentOverlay;
  final Color? bgColor;
  final Color? indicatorColor;
  final bool withTopOffset;

  TopBarTabFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.title,
    required this.tabs,
    required this.tabViews,
    this.contentOverlay,
    this.padding,
    this.bgColor,
    this.indicatorColor,
    this.withTopOffset = false,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Container(
        margin: !withTopOffset ? EdgeInsets.only(top: stdTopMargin) : null,
        child: TabBarView(
          children: tabViews,
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
    ];

    if(contentOverlay != null) {
      children.insert(1, contentOverlay!);
    }

    return DefaultTabController(
      length: tabs.length,
      child: Container(
        color: bgColor,
        child: Stack(
          //mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }
}