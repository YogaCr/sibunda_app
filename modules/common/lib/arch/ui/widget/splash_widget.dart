import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Duration transitionDuration;

  /// Duration of this [SplashScreen] stay until begin the transition
  /// to other page.
  ///
  /// If [computation] is not null, then this [stayDuration]
  /// will become the least duration to begin the page transition.
  /// Here the 2 condition that may come:
  /// - If [computation] takes longer than [stayDuration], then the duration of
  ///   this [SplashScreen] will stay is as long as that [computation] duration.
  /// - If [computation] takes shorter than [stayDuration], then the duration of
  ///   this [SplashScreen] will stay is [stayDuration].
  final Duration stayDuration;
  final Widget Function(BuildContext context) pageBuilder;
  final Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? transitionBuilder;
  final Widget child;

  /// This block will be executed immediately after the [_SplashScreenState.initState]
  /// is executed.
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
        Navigator.pushReplacement(context, _createRoute());
      });
    } else {
      final sw = Stopwatch()..start();
      computation!().then((_) {
        final durr = sw.elapsed;
        sw.stop();
        //prind("SplashScreen computation durr= $durr stayDuration= $stayDuration durr >= stayDuration => ${durr >= stayDuration} stayDuration - durr= ${stayDuration - durr}");
        if(durr >= stayDuration) {
          Navigator.pushReplacement(context, _createRoute());
        } else {
          Future.delayed(stayDuration - durr, () {
            Navigator.pushReplacement(context, _createRoute());
          });
        }
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