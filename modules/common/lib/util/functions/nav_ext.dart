
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

void backPage(BuildContext context) => Navigator.pop(context);

bool isInitialPage(BuildContext context) => !Navigator.canPop(context);

T? getArgs<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T?;