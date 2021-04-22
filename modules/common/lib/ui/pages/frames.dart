
import 'package:common/util/functions/ext_functions.dart';
import 'package:common/util/functions/nav_ext.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainFrame extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;

  MainFrame({
    required this.body,
    this.appBar,
    this.padding
  });

  @override
  Widget build(BuildContext context) => Frame(
    appBar: appBar,
    body: body,
    padding: padding,
  );
}

class NoAppBarFrame extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;

  NoAppBarFrame({
    required this.body,
    this.padding
  });

  @override
  Widget build(BuildContext context) => Frame(
    body: body,
    padding: padding,
  );
}

class PlainBackFrame extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  PlainBackFrame({
    required this.body,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => Frame(
    padding: padding,
    body: Stack(
      children: [
        body,
        Transform.scale(
          scale: 1.5,
          child: InkWell(
            onTap: onTap ?? () => backPage(context),
            customBorder: CircleBorder(),
            child: Icon(
              Icons.arrow_back_rounded,
            ).withPadding(EdgeInsets.all(5)),
          ),
        ),
      ],
    ),
  );
}

class Frame extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;

  Frame({
    required this.body,
    this.appBar,
    this.padding,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: appBar,
    body: SafeArea(
      child: Container(
        padding: padding,
        child: body,
      ),
    ),
  );
}

extension FramedWidgetExt on Widget {
  Widget framed({
    PreferredSizeWidget? appBar,
    EdgeInsetsGeometry? padding,
  }) => appBar != null
      ? MainFrame(body: this, appBar: appBar, padding: padding,)
      : NoAppBarFrame(body: this, padding: padding,);

  Widget framedWithPlainBack({
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap,
  }) => PlainBackFrame(
    body: this,
    padding: padding,
    onTap: onTap,
  );
}