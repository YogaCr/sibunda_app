import 'package:common/arch/di/repo_di.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:flutter/material.dart';

import '../di/repo_di_test.dart';

class TestUtil_Dev {
  static setRepoDiDummy() {
    RepoDi.obj = RepoDiObjDummy();
  }
  static resetRepoDi() => ConfigUtil.resetRepoDi();
}

Widget defaultTestApp(
  Widget child, {
  bool withScaffold = false,
}) => MaterialApp(
  home: withScaffold ? Scaffold(
    body: child,
  ) : child,
);