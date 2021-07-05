import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Duration transitionDuration;
  final Duration stayDuration;
  final Widget Function(BuildContext context) pageBuilder;
  final Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? transitionBuilder;
  final Widget child;
  final Future<void> Function()? computation;

  SplashScreen({
    required this.child,
    required this.pageBuilder,
    this.transitionBuilder,
    Duration? transitionDuration,
    Duration? stayDuration,
    this.computation,
  }):
    this.stayDuration = stayDuration ?? Duration(seconds: 2),
    this.transitionDuration = transitionDuration ?? Duration(milliseconds: 300)
  ;

  @override
  State createState() => _SplashScreenState(
    child: child,
    pageBuilder: pageBuilder,
    transitionBuilder: transitionBuilder,
    transitionDuration: transitionDuration,
    stayDuration: stayDuration,
    computation: computation,
  );
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration transitionDuration;
  final Duration stayDuration;
  final Widget Function(BuildContext context) pageBuilder;
  final Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? transitionBuilder;
  final Widget child;
  final Future<void> Function()? computation;

  _SplashScreenState({
    required this.child,
    required this.pageBuilder,
    required this.transitionBuilder,
    required this.transitionDuration,
    required this.stayDuration,
    required this.computation,
  });

  @override
  void initState() {
    super.initState();
    if(computation == null) {
      Future.delayed(stayDuration, () {
        Navigator.push(context, _createRoute());
      });
    } else {
      computation!().then((_) {
        Navigator.push(context, _createRoute());
      });
    }
  }

  @override
  Widget build(BuildContext context) => child;

  Route _createRoute() => PageRouteBuilder(
    transitionDuration: transitionDuration,
    pageBuilder: (ctx, anim, secAnim) => pageBuilder(ctx),
    transitionsBuilder: transitionBuilder ?? (ctx, anim, secAnim, child) => child,
  );
}