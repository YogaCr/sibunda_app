import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sibunda_app/config/app_routes.dart';

import '../di/repo_di_test.dart';
import '../di/usecase_di_test.dart';

class TestUtil_Dev {
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
}

Widget defaultTestApp(
  Widget child, {
  bool withScaffold = false,
}) => MaterialApp(
  home: withScaffold ? Scaffold(
    body: child,
  ) : child,
);

Widget defaultTestAppSibRoute(
  Widget Function(BuildContext) builder, {
  bool withScaffold = false,
}) {
  final child = Builder(builder: builder,);
  return MaterialApp(
    home: withScaffold ? Scaffold(
      body: child,
    ) : child,
  );
}

Future<void> pumpWidgetWithArg({
  required WidgetTester tester,
  required Widget Function(BuildContext) builder,
  Map<String, dynamic>? args,
}) async {
  final key = Key("_test_btn_");
  await tester.pumpWidget(
    MaterialApp(
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
}) async {
  final key = Key("_test_btn_");
  await tester.pumpWidget(
    MaterialApp(
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