import 'dart:async';

import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/util/navigations.dart' as NavExt;
import 'package:common/value/const_values.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class GlobalRoutes {
  GlobalRoutes._();

  static final manager = RouteManager();

  static const common = "common";
  static const app = "app";
  static const home = "home";
  static const kehamilanku = "kehamilanku";
  static const bayiku = "bayiku";
  static const covid19 = "covid19";
  static const education = "education";
  static const profile = "profile";

  static const home_LoginPage = "$home.loginPage";
  static const education_detailPage = "$education.detailPage";

  static Map<String, dynamic> makeEducationDetailPageData(Tips data) => {
    Const.KEY_DATA : data,
  };
}


class SibRoute {
  final String name;
  final Type klass;
  final Widget Function(BuildContext) builder;
  /// Called before [builder] is called.
  final void Function(BuildContext)? onPreBuild;

  const SibRoute(this.name, this.klass, this.builder, {
    this.onPreBuild,
  });


  Future<T?> goToPage<T>(BuildContext context, {
    Map<String, dynamic>? args,
    bool clearPrevs = false,
    bool replaceCurrent = false,
    bool post = true
  })  {
    if(post) {
      return Future(() {
        final future = Future(() {
          onPreBuild?.call(context);
          return NavExt.goToPage<T>(
            context, builder,
            name: name,
            clearPrevs: clearPrevs,
            replaceCurrent: replaceCurrent,
            args: args,
          );
        });
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async => await future);
        return future;
      });
    } else {
      onPreBuild?.call(context);
      return NavExt.goToPage<T>(
        context, builder,
        name: name,
        clearPrevs: clearPrevs,
        replaceCurrent: replaceCurrent,
        args: args,
      );
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

  void exportRoute(String key, SibRoute route) => _manager.exportRoute(key, route);
  void exportRouteBuilder(String key, SibRoute Function(Map<String, dynamic> args) routeBuilder) =>
    _manager.exportRouteBuilder(key, routeBuilder);

  Future<T?> goToModule<T>(
    BuildContext context,
    String moduleName, {
    Map<String, dynamic>? args,
    bool clearPrevs = false,
    bool replaceCurrent = false,
    bool post = true
  }) => _manager.getModuleEntryPoint(moduleName).goToPage(
    context, args: args,
    clearPrevs: clearPrevs,
    replaceCurrent: replaceCurrent,
    post: post,
  );

  Future<T?> goToExternalRoute<T>(
    BuildContext context,
    String key, {
    Map<String, dynamic>? args,
    bool clearPrevs = false,
    bool post = true
  }) => _manager.getExternalRoute(key).goToPage(
    context, args: args,
    clearPrevs: clearPrevs, post: post,
  );

  Future<T?> goToExternalRouteBuilder<T>(
    BuildContext context,
    String key, {
    Map<String, dynamic>? builderArgs,
    Map<String, dynamic>? args,
    bool clearPrevs = false,
    bool post = true
  }) => _manager.getExternalRouteBuilder(key)(builderArgs ?? {}).goToPage(
    context, args: args,
    clearPrevs: clearPrevs, post: post,
  );
}


class RouteManager {
  final List<ModuleRoute> _modules = [];
  final Map<String, SibRoute> _routes = {};
  final Map<String, SibRoute Function(Map<String, dynamic> args)> _routeBuilders = {};

  void registerModule(ModuleRoute module) {
    _modules.add(module);
  }
  SibRoute getModuleEntryPoint(String moduleName) {
    final module = _modules.firstWhereOrNull((it) => it.name == moduleName);
    if(module == null) {
      throw "No such module with name of '$moduleName'";
    }
    return module.entryPoint;
  }

  void exportRoute(String key, SibRoute route) {
    _routes[key] = route;
  }
  void exportRouteBuilder(String key, SibRoute Function(Map<String, dynamic> args) routeBuilder) {
    _routeBuilders[key] = routeBuilder;
  }
  SibRoute getExternalRoute(String key) {
    if(!_routes.containsKey(key)) {
      throw "No such route with key of '$key'";
    }
    return _routes[key]!;
  }
  SibRoute Function(Map<String, dynamic> args) getExternalRouteBuilder(String key) {
    if(!_routeBuilders.containsKey(key)) {
      throw "No such router with key of '$key'";
    }
    return _routeBuilders[key]!;
  }
}