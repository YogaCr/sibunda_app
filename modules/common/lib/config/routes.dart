import 'dart:async';

import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/util/navigations.dart' as NavExt;
import 'package:common/value/const_values.dart';
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

  static const education_detailPage = "education.detailPage";

  static Map<String, dynamic> makeEducationDetailPageData(Tips data) => {
    Const.KEY_DATA : data,
  };
}


class SibRoute {
  final String name;
  final Type klass;
  final Widget Function(BuildContext) builder;
  const SibRoute(this.name, this.klass, this.builder);


  Future<T?> goToPage<T>(BuildContext context, {
    Map<String, dynamic>? args,
    bool clearPrevs = false,
    bool replaceCurrent = false,
    bool post = true
  })  {
    if(post) {
      return Future(() {
        final future = Future(() => NavExt.goToPage<T>(
          context, builder,
          name: name,
          clearPrevs: clearPrevs,
          replaceCurrent: replaceCurrent,
          args: args,
        ));
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async => await future);
        return future;
      });
    } else {
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
}


class RouteManager {
  final List<ModuleRoute> _modules = [];
  final Map<String, SibRoute> _routes = {};

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
  SibRoute getExternalRoute(String key) {
    if(!_routes.containsKey(key)) {
      throw "No such route with key of '$key'";
    }
    return _routes[key]!;
  }
}