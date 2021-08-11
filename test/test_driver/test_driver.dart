import 'dart:io';

import 'package:core/util/_consoles.dart';
import 'package:flutter_driver/flutter_driver.dart';
//import 'package:flutter_driver/driver_extension.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

import '../util/test_util.dart';

//import '../widget_test/home_wigdet_test.dart' as home_widget_test;

void main() async {
  prind("test_driver main() AWAL");
  //enableFlutterDriverExtension();
///*
  final driver = TestUtil_Dev.driver = await FlutterDriver.connect();
  await integrationDriver(
    driver: driver,
    onScreenshot: (ssName, ssBytes) async {
      prind("test_driver main() onSS ssName= $ssName, ssBytes= $ssBytes");
      final file = File("$ssName.png");
      return await file.writeAsBytes(ssBytes);},
  );
// */
}