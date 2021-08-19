import 'package:bayiku/config/baby_routes.dart';
import 'package:common/config/manifest.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:flutter/material.dart';

void main() async {
  await ConfigUtil.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: BabyRoutes.obj.name,
      theme: Manifest.theme.materialData,
      home: BabyRoutes.babyHomePage.build(context),
    );
  }
}