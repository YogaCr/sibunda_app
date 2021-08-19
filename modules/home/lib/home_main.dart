import 'package:common/config/_config.dart';
import 'package:common/config/manifest.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';

void main() async {
  await ConfigUtil.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalRoutes.home,
      theme: Manifest.theme.materialData,
      home: HomeRoutes.obj.entryPoint.build(context), //HomeRoutes.homePage.build(context), //
    );
  }
}