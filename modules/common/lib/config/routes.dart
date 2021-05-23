import 'package:common/util/functions/nav_ext.dart' as NavExt;
import 'package:flutter/material.dart';

class SibRoute {
  final String name;
  final Type klass;
  final Widget Function(BuildContext) builder;
  const SibRoute(this.name, this.klass, this.builder);

  void goToPage(BuildContext context, {bool clearPrevs = false,}){
    NavExt.goToPage(context, builder, clearPrevs: clearPrevs);
  }
}