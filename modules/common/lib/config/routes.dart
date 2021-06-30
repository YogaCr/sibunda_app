import 'dart:async';

import 'package:common/util/navigations.dart' as NavExt;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class GlobalRoutes {
  GlobalRoutes._();

  static final manager = RouteManager();

  static const app = "app";
  static const home = "home";
  static const kehamilanku = "kehamilanku";
  static const bayiku = "bayiku";
  static const covid19 = "covid19";
  static const education = "education";
}


class SibRoute {
  final String name;
  final Type klass;
  final Widget Function(BuildContext) builder;
  const SibRoute(this.name, this.klass, this.builder);


  Future<T?> goToPage<T>(BuildContext context, {Map<String, dynamic>? args, bool clearPrevs = false, bool post = true})  {
    if(post) {
      return Future(() {
        final future = Future(() => NavExt.goToPage<T>(context, builder, name: name, clearPrevs: clearPrevs, args: args));
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async => await future);
        return future;
      });
    } else {
      return NavExt.goToPage<T>(context, builder, name: name, clearPrevs: clearPrevs, args: args);
    }
  }

  Future<T?> showAsDialog<T>(BuildContext context, {Map<String, dynamic>? args, bool post = true}) {
    if(post) {
      return Future(() {
        final future = Future(() => NavExt.showPopup<T>(context, (ctx) => AlertDialog(
          content: builder(ctx),
        ),
          name: name,
          args: args,
        ));
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async => await future);
        return future;
      });
    } else {
      return NavExt.showPopup<T>(context, (ctx) => AlertDialog(
        content: builder(ctx),
      ),
        name: name,
        args: args,
      );
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