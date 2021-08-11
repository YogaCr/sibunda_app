import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/navigations.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart' as driver_api;
import 'package:flutter_test/flutter_test.dart';
import 'package:sibunda_app/config/app_routes.dart';

import 'package:test_api/src/backend/invoker.dart';
import 'package:test_api/src/backend/state.dart' as test_api;

import '../di/repo_di_test.dart';
import '../di/usecase_di_test.dart';

class TestUtil_Dev {
  TestUtil_Dev._();

  static driver_api.FlutterDriver? driver;

  static init() {
    setRepoDiDummy();
    setUseCaseDiDummy();
    AppRoutes.obj;
  }
  static setRepoDiDummy() {
    RepoDi.obj = RepoDiObjDummy();
  }
  static setUseCaseDiDummy() {
    UseCaseDi.obj = UseCaseDiObjDummy();
  }
  static resetDi() {
    ConfigUtil.resetRepoDi();
    ConfigUtil.resetUseCaseDi();
  }

  static void Function(bool success, String testName) postTest = (success, testName) {
    if(success) {
      prinr("Test '$testName' succeeded");
    } else {
      prine("Test '$testName' failed");
    }
  };

  static postTestResult() {
    final currentTest = Invoker.current?.liveTest;
    if(currentTest != null) {
      final isError = currentTest.state.result == test_api.Result.error;
      postTest(!isError, currentTest.test.name);
    }
  }
}

Widget defaultTestApp(
  Widget child, {
  bool withScaffold = false,
  bool showDebugBanner = false,
}) => MaterialApp(
  debugShowCheckedModeBanner: showDebugBanner,
  home: withScaffold ? Scaffold(
    body: child,
  ) : child,
);

Widget defaultTestAppSibRoute(
  Widget Function(BuildContext) builder, {
  bool withScaffold = false,
  bool showDebugBanner = false,
}) {
  final child = Builder(builder: builder,);
  return MaterialApp(
    debugShowCheckedModeBanner: showDebugBanner,
    home: withScaffold ? Scaffold(
      body: child,
    ) : child,
  );
}

Future<void> pumpWidgetWithArg({
  required WidgetTester tester,
  required Widget Function(BuildContext) builder,
  Map<String, dynamic>? args,
  bool showDebugBanner = false,
}) async {
  final key = Key("_test_btn_");
  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: showDebugBanner,
      home: Scaffold(
        body: Builder(
          builder: (ctx) => GestureDetector(
            key: key,
            onTap: () => goToPage(
              ctx, builder,
              args: args,
              clearPrevs: true,
            ),
          ),
        ),
      ),
    )
  );
  final btn = find.byKey(key);
  expect(btn, findsOneWidget);

  await tester.tap(btn);
  await tester.pumpAndSettle();
}

Future<void> pumpWidgetWithSibRoute({
  required WidgetTester tester,
  required void Function(BuildContext) pumper,
  bool showDebugBanner = false,
}) async {
  final key = Key("_test_btn_");
  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: showDebugBanner,
      home: Scaffold(
        body: Builder(
          builder: (ctx) => GestureDetector(
            key: key,
            onTap: () {
              pumper(ctx);
            },
          ),
        ),
      ),
    )
  );
  final btn = find.byKey(key);
  expect(btn, findsOneWidget);

  await tester.tap(btn);
  await tester.pumpAndSettle();
}