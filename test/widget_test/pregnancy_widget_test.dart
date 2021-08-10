
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/widget/_items_kehamilanku.dart';
import 'package:common/arch/ui/widget/custom_top_nav_bar.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/config/keys.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kehamilanku/config/kehamilanku_keys.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';
import 'package:kehamilanku/ui/chart/mother_chart_page.dart';
import 'package:kehamilanku/ui/chart/mother_preg_eval_chart_menu_page.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_page.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_page.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_vm.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_page.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_vm.dart';

import '../util/test_util.dart';

void main() {
  TestUtil_Dev.init();
  ConfigUtil.init(isTest: true, isAllOffline: true,);

  WidgetController.hitTestWarningShouldBeFatal = true;
  _babyOverlayTest();
  _trimesterTest();
  _immunizationTest();
  _chartNavTest();
}


Future<void> _setUpPregnancyHomePage(WidgetTester tester) async {
  await tester.pumpWidget(
    defaultTestApp(
      Builder(builder: KehamilankuRoutes.kehamilankuHomePage.builder),
    ),
  );
  await tester.pumpAndSettle();
}

_babyOverlayTest() {
  group("Baby selection overlay test group", () {
    testWidgets("Given `kehamilanku_home_page`, "
        "When baby selection button is pressed, "
        "Then popup is shown.",
      (tester) async {
        await _setUpPregnancyHomePage(tester);

        final btn = find.byKey(KehamilankuKeys.home_btnBabySelection).first;

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(BabySelectionOverlay), findsOneWidget);
    });
  });
}

_trimesterTest() {
  group("Trimester test group", () {
    /*
    setUp(() {
      ConfigUtil.initFlutterErrorHandling(isTest: true);
      FlutterError.onError = (detail) {
        print("FlutterError.onError detail= $detail");
      };
    });
     */

    testWidgets("Given `kehamilanku_home_page`, "
        "When trimester menu button is pressed, "
        "Then enter `trimester_page`.",
      (tester) async {
        await _setUpPregnancyHomePage(tester);

        final btn = find.byKey(KehamilankuKeys.home_btnTrimester(0)).first;

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(KehamilankuTrimesterFormPage), findsOneWidget);
    });
    testWidgets("Given form submission is success, "
        "When form submission button is pressed, "
        "Then success popup appears.",
      (tester) async {
        //await _setUpPregnancyHomePage(tester);
        ConfigUtil.initFlutterErrorHandling(isTest: true);

        final firstTrimester = dummyTrimesterList[0];
        final week = firstTrimester.startWeek;

        await pumpWidgetWithSibRoute(
          tester: tester,
          pumper: (ctx) => KehamilankuRoutes.pregnancyCheckPage.go(
            context: ctx,
            data: firstTrimester,
            pregnancyCred: dummyProfileCred,
            isLastTrimester: false,
          ),
        );

        final vmProviderFinder = find.byType(ViewModelProvider);
        expect(vmProviderFinder, findsOneWidget);

        final vmProviderState = tester.state(vmProviderFinder) as ViewModelProviderState;

        final vm = vmProviderState.getCachedViewModel<KehamilankuCheckFormVm>();
        expect(vm, isNotNull);

        final pregnancyCheck = dummyPregnancyCheck(week);
        vm!.patchResponse([pregnancyCheck.toJson()]);

        await tester.pumpAndSettle();

        final btn = find.byKey(
          KehamilankuKeys.home_btnTrimesterSubmission(week),
        ).first;

        expect(btn, findsOneWidget);

        await tester.ensureVisible(btn);
        await tester.pumpAndSettle();

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(PopupSuccess), findsOneWidget);
    });
  });
}

_immunizationTest() {
  group("Immunization test group", () {
    testWidgets("Given `kehamilanku_home_page`, "
        "When immunization button is pressed, "
        "Then enter `immunization_page`.",
      (tester) async {
        await _setUpPregnancyHomePage(tester);

        final btn = find.byKey(KehamilankuKeys.home_btnImmunization).first;
        //final btnRect = tester.getRect(btn);
        /*
        final dragGesture = await tester.startGesture(Offset(200, 400));
        await dragGesture.moveBy(Offset(0, -300)); //135.0, 648.0, 478.0, 691.0
        await dragGesture.up();
        // */

        //final from = tester.getCenter(btn);
        await tester.dragFrom(Offset(200, 400), Offset(0, -300));

        //tester.ensureVisible(btn);
        await tester.pumpAndSettle();

        //final btnRect2 = tester.getRect(btn);

        //print("btnRect= $btnRect btnRect2= $btnRect2");

        //final topBar = find.byType(RoundedTopNavBarBg).first;
        //final bottomBar = find.byType(BottomNavigationBar).first;

        //final menuBtn = find.byKey(HomeKeys.home_btnMenu_pregnancy).first;

        //final menuBtnRect = tester.getRect(menuBtn);
        //final topBarRect = tester.getRect(topBar);
        //final bottomBarRect = tester.getRect(bottomBar);
        //print("topBarRect= $topBarRect bottomBarRect= $bottomBarRect menuBtnRect= $menuBtnRect");
        //print("topBarRect= $topBarRect btnRect= $btnRect");

        //await tester.ensureVisible(btn);

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(PregnancyImmunizationPage), findsOneWidget);
    });
    testWidgets("Given `immunization_page` and immunization popup form is completed, "
        "When submission button is pressed, "
        "Then success popup appears.",
      (tester) async {
        //await _setUpPregnancyHomePage(tester);
        //final firstTrimester = dummyTrimesterList[0];
        //final week = firstTrimester.startWeek;
        ConfigUtil.initFlutterErrorHandling(isTest: true);

        final immunizationData = motherImmunizationList.firstWhere((e) => e.date == null);

        await tester.pumpWidget(
          defaultTestAppSibRoute((ctx) => KehamilankuRoutes.immunizationPage.build(
            context: ctx,
            pregnancyCred: dummyProfileCred,
          ),),
        );
        await tester.pumpAndSettle();

        final immunizationBtnFinder = find.byKey(
          CommonKeys.getBtnImmunizationItem(immunizationData.occurrenceId),
        );
        expect(immunizationBtnFinder, findsOneWidget);

        await tester.tap(immunizationBtnFinder);
        await tester.pumpAndSettle();
        
        final popupFinder = find.byType(PregnancyImmunizationPopupPage);
        expect(popupFinder, findsOneWidget);

        final vmStoreFinder = find.byType(ViewModelStore);
        expect(vmStoreFinder, findsWidgets);

        PregnancyImmunizationPopupVm? vm;
        for(final storeElement in vmStoreFinder.evaluate()) {
          if((vm = (storeElement.widget as ViewModelStore).getCachedViewModel<PregnancyImmunizationPopupVm>())
            != null) {
            break;
          }
        }
        expect(vm, isNotNull);

        final immunizationFill = dummyMotherImmunizationFill;
        vm!.patchResponse([immunizationFill.toJson()]);

        await tester.pumpAndSettle();

        final btn = find.byKey(
          KehamilankuKeys.home_btnImmunizationSubmission,
        ).first;

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(PopupSuccess), findsOneWidget);
    });
  });
}

_chartNavTest() {
  group("Chart nav test group", () {
    testWidgets("Given `kehamilanku_home_page`, "
        "When pregnancy evaluation button is pressed, "
        "Then enter `pregnancy_eval_chart_menu_page`.",
      (tester) async {
        await _setUpPregnancyHomePage(tester);

        final btn = find.byKey(KehamilankuKeys.home_btnChartPregnancyEval).first;

        await tester.dragFrom(Offset(200, 400), Offset(0, -300));
        await tester.pumpAndSettle();

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(MotherPregEvalChartMenuPage), findsOneWidget);
    });
    testWidgets("Given `immunization_page` and immunization popup form is completed, "
        "When weight button is pressed, "
        "Then enter `weight_chart_page`.",
      (tester) async {
        await _setUpPregnancyHomePage(tester);

        final btn = find.byKey(KehamilankuKeys.home_btnChartWeight).first;

        await tester.dragFrom(Offset(200, 400), Offset(0, -300));
        await tester.pumpAndSettle();

        await tester.tap(btn);

        await tester.pumpAndSettle();

        expect(find.byType(MotherChartPage), findsOneWidget);
    });
  });
}