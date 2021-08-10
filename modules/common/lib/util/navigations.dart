
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<T?> goToPage<T>(
  BuildContext context,
  Widget Function(BuildContext) builder, {
  String? name,
  Map<String, dynamic>? args,
  bool clearPrevs = false,
  bool replaceCurrent = false,
}) {
  RouteSettings settings = RouteSettings(name: name, arguments: args);
  return !clearPrevs
      ? !replaceCurrent
        ? Navigator.push<T>(
          context,
          MaterialPageRoute(builder: builder, settings: settings)
        ) : Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: builder, settings: settings)
        )
      : Navigator.pushAndRemoveUntil<T>(
        context,
        MaterialPageRoute(builder: builder, settings: settings),
        ModalRoute.withName("/Home"),
      );
}

Future<T?> showPopup<T>(
  BuildContext context,
  Widget Function(BuildContext) builder, {
  String? name,
  Map<String, dynamic>? args,
  //bool clearPrevs = false,
}) {
  RouteSettings settings = RouteSettings(name: name, arguments: args);
  return showDialog<T>(context: context, builder: builder, routeSettings: settings);
}

void backPage<T>(BuildContext context, {
  T? result,
  int backStep = 1,
  bool dontPopInitialPage = true,
}) {
  if(backStep <= 1) {
    if(!dontPopInitialPage || !isInitialPage(context)) {
      Navigator.pop<T>(context, result);
    }
  } else {
    if(result != null) {
      prine("backPage() with `result` != null and `backStep` > 1. `result` will only be received by the last destination page in stack.");
    }
    final lastPop = backStep -1;
    if(dontPopInitialPage) {
      for(int i = 0; i < lastPop; i++) {
        if(isInitialPage(context)) {
          prine("backPage() has reached initial page at back step '$i' (max = $backStep), thus stop the pop");
          break;
        }
        Navigator.pop<T>(context);
      }
    } else {
      for(int i = 0; i < lastPop; i++) {
        Navigator.pop<T>(context);
      }
    }
    if(!dontPopInitialPage || !isInitialPage(context)) {
      Navigator.pop<T>(context, result);
    }
  }
}

bool isInitialPage(BuildContext context) => !Navigator.canPop(context);

T? getRawArgs<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T?;
T? getArgs<T>(BuildContext context, String key) => (ModalRoute.of(context)?.settings.arguments as Map?)?[key] as T?;
//aa(){ModalRoute.of(context)?.settings = ;}