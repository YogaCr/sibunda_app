
import 'package:common/res/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainFrame extends StatelessWidget {
  final String title;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;

  MainFrame({
    this.title = Strings.app_name,
    required this.body,
    this.appBar,
    this.padding
  });

  @override
  Widget build(BuildContext context) => _Frame(
    appBar: appBar,
    body: body,
    padding: padding,
  );
}

class SplashFrame extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;

  SplashFrame({
    required this.body,
    this.padding
  });

  @override
  Widget build(BuildContext context) => _Frame(
    body: body,
    padding: padding,
  );

}

class _Frame extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;

  _Frame({
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