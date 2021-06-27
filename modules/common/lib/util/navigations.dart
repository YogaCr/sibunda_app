
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<Object?> goToPage(
  BuildContext context,
  Widget Function(BuildContext) builder, {
  String? name,
  Map<String, dynamic>? args,
  bool clearPrevs = false,
}) {
  RouteSettings settings = RouteSettings(name: name, arguments: args);
  return !clearPrevs
      ? Navigator.push(
      context,
      MaterialPageRoute(builder: builder, settings: settings)
  ) : Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: builder, settings: settings),
      ModalRoute.withName("/Home")
  );
}

void backPage(BuildContext context, { int backStep = 1, }) {
  if(backStep <= 1) {
    Navigator.pop(context);
  } else {
    for(int i = 0; i < backStep; i++) {
      Navigator.pop(context);
    }
  }
}

bool isInitialPage(BuildContext context) => !Navigator.canPop(context);

T? getRawArgs<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T?;
T? getArgs<T>(BuildContext context, String key) => (ModalRoute.of(context)?.settings.arguments as Map?)?[key] as T?;