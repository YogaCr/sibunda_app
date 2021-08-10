
import 'package:bayiku/config/baby_keys.dart';
import 'package:bayiku/config/baby_routes.dart';
import 'package:common/arch/ui/widget/_items_kehamilanku.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/test_util.dart';

void main() {
  TestUtil_Dev.init();
  ConfigUtil.init(isTest: true, isAllOffline: true,);

  WidgetController.hitTestWarningShouldBeFatal = true;
  _babyOverlayTest();
}


Future<void> _setUpPregnancyHomePage(WidgetTester tester) async {
  await tester.pumpWidget(
    defaultTestApp(
      Builder(builder: BabyRoutes.babyHomePage.builder),
    ),
  );
  await tester.pumpAndSettle();
}

_babyOverlayTest() {
  group("Baby selection overlay test group", () {
    testWidgets("Given `bayiku_home_page`, "
        "When baby selection button is pressed, "
        "Then popup is shown.",
      (tester) async {
        await _setUpPregnancyHomePage(tester);

        final btn = find.byKey(BabyKeys.home_btnBabySelection).first;

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(BabySelectionOverlay), findsOneWidget);
    });
  });
}