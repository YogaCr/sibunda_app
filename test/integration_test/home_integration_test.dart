import 'dart:io';

import 'package:common/test/__common_test_const.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

import '../util/test_util.dart';
import '../widget_test/home_wigdet_test.dart' as widget_test;

void main() async {
  print("home_integration_test.dart main() AWAL");

  ConfigUtil.initSystemNav();

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
  //final driver = await FlutterDriver.connect();

/*
  await integrationDriver(
      onScreenshot: (ssName, ssBytes) async {
        final file = File("$ssName.png");
        return await file.writeAsBytes(ssBytes);
      }
  );
 */

  TestUtil_Dev.postTest = (success, testName) async {
    //binding.convertFlutterSurfaceToImage();
    final bytes = await TestUtil_Dev.driver?.screenshot();
    prind("postTest() success= $success, testName= $testName bytes= $bytes");
    await binding.takeScreenshot("${testName}_$success.png");
  };
  //binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  //await FlutterDriver.connect();
  //await integrationDriver();

  print("home_integration_test.dart main()");

  widget_test.main();
}