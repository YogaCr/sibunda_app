import 'package:common/arch/ui/widget/_items_home.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/config/home_key.dart';
import 'package:home/config/home_routes.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_page.dart';

import '../util/test_util.dart';

void main() {
  TestUtil_Dev.init();
  ConfigUtil.init(isTest: true, isAllOffline: true,);

  _menuBtnNavTest();
}


_menuBtnNavTest() {
  group("Menu btn nav test group", () {
    testWidgets("Given home page,"
        "When 'kehamilanku' menu button is pressed,"
        "Then `kehamilanku_home_page` is shown.",
    (tester) async {
      await tester.pumpWidget(
        defaultTestApp(
          Builder(builder: HomeRoutes.homePage.builder)
        )
      );
      await tester.pump();

      final btn = find.byKey(HomeKeys.home_btnMenu_pregnancy).first;
      await tester.tap(btn);

      await tester.pumpAndSettle();

      expect(find.byType(KehamilankuHomePage), findsOneWidget);
    });
  });
}