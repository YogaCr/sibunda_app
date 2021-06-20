import 'dart:async';

import 'package:common/util/navigations.dart' as NavExt;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class GlobalRoutes {
  GlobalRoutes._();

  static final manager = RouteManager();

  static const home = "home";
  static const kehamilanku = "kehamilanku";
  static const bayiku = "bayiku";
  static const covid19 = "covid19";
}


class SibRoute {
  final String name;
  final Type klass;
  final Widget Function(BuildContext) builder;
  const SibRoute(this.name, this.klass, this.builder);

  Future<Object?>? goToPage(BuildContext context, {Map<String, dynamic>? args, bool clearPrevs = false, bool post = true}) {
    if(post) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) =>
          NavExt.goToPage(context, builder, name: name, clearPrevs: clearPrevs, args: args));
      //return null
    } else {
      return NavExt.goToPage(context, builder, name: name, clearPrevs: clearPrevs, args: args);
    }
  }

  Widget build(BuildContext context) => builder(context);
}



abstract class ModuleRoute {
  ModuleRoute(this._manager) {
    _manager.registerModule(this);
  }

  final RouteManager _manager;

  SibRoute get entryPoint;
  String get name;
  Set<SibRoute> get routes;

  Future<Object?>? goToModule(
    BuildContext context,
    String moduleName, {
    Map<String, dynamic>? args,
    bool clearPrevs = false,
    bool post = true
  }) => _manager.getModuleEntryPoint(moduleName).goToPage(
    context, args: args,
    clearPrevs: clearPrevs, post: post,
  );
}


class RouteManager {
  final List<ModuleRoute> _routes = [];

  void registerModule(ModuleRoute module) {
    _routes.add(module);
  }
  SibRoute getModuleEntryPoint(String moduleName) {
    final module = _routes.firstWhereOrNull((it) => it.name == moduleName);
    if(module == null) {
      throw "No such module with name of '$moduleName'";
    }
    return module.entryPoint;
  }
}