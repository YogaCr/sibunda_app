import 'dart:async';

import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/util/navigations.dart' as NavExt;
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data.dart';
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

  static const home_loginPage = "$home.loginPage";
  static const home_motherFormPage = "$home.motherFormPage";
  static const home_fatherFormPage = "$home.fatherFormPage";
  static const home_childFormPage = "$home.childFormPage";
  static const home_motherHplPage = "$home.motherHplPage";
  static const education_detailPage = "$education.detailPage";

  static Map<String, dynamic> makeEducationDetailPageData(Tips data) => {
    Const.KEY_DATA : data,
  };
  static Map<String, dynamic> makeHomeMotherFatherFormPageData({
    bool? canSkip,
    bool? isEdit,
    ProfileCredential? credential,
  }) => {
    Const.KEY_IS_EDIT: isEdit,
    Const.KEY_CAN_SKIP: canSkip,
    Const.KEY_CREDENTIAL : credential,
  };
  static Map<String, dynamic> makeHomeChildFormPageData({
    bool? isEdit,
    ProfileCredential? credential,
  }) {
    return {
      Const.KEY_IS_EDIT: isEdit,
      Const.KEY_CREDENTIAL : credential,
    };
  }
  static Map<String, dynamic> makeHomeChildFormPageBuilderData({
    LiveData<int>? childCountLiveData,
    int? childCount,
    bool? isEdit,
    ProfileCredential? pregnancyId,
  }) {
    final liveData = childCountLiveData ?? MutableLiveData(childCount ?? 1);
    return {
      Const.KEY_IS_EDIT: isEdit,
      Const.KEY_DATA : liveData,
      Const.KEY_PREGNANCY_ID : pregnancyId,
    };
  }
  static Map<String, dynamic> makeBabyHomePageData({
    ProfileCredential? babyCredential,
  }) => { Const.KEY_DATA : babyCredential, };

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
      throw "No such route builder with key of '$key'";
    }
    return _routeBuilders[key]!;
  }
}