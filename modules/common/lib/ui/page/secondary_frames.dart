
import 'package:common/config/_config.dart';
import 'package:common/data/model/home_data.dart';
import 'package:common/ui/widget/custom_top_nav_bar.dart';
import 'package:flutter/material.dart';

const _topBarHeight = 120.0;
const _stdTopMargin = _topBarHeight + 10;

class TopBarTitleAndBackFrame extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? topBarChild;
  final EdgeInsets? padding;

  TopBarTitleAndBackFrame({
    required this.body,
    required this.title,
    this.topBarChild,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundedTopNavBarTitleAndBack(
          title: title,
          bottomChild: topBarChild,
        ),
        Container(
          margin: EdgeInsets.only(top: _stdTopMargin),
          child: body,
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
        RoundedTopNavBarProfile(
          name: name,
          desc: desc,
          image: image,
          actionBtn: actionBtn,
          onActionBtnClick: onActionBtnClick,
        ),
        Container(
          margin: EdgeInsets.only(top: _stdTopMargin),
          child: Expanded(child: body,),
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
          RoundedTopNavBarTitleAndBack(
            title: title,
            bottomChild: TabBar(
              tabs: tabs,
            ),
          ),
          //body,
          Container(
            margin: EdgeInsets.only(top: _stdTopMargin,),
            child: Expanded(
              child: TabBarView(
                children: tabViews,
              ),
            ),
          ),
        ],
      ),
    );
  }
}