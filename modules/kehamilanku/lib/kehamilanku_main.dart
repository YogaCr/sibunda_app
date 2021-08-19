import 'package:common/arch/di/config_di.dart';
import 'package:common/config/manifest.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';

void main() async {
  await ConfigUtil.init();
  prinw("kehamilanku_main() VarDi.motherNik = ${VarDi.motherNik}");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KehamilankuRoutes.obj.name,
      theme: Manifest.theme.materialData,
      home: KehamilankuRoutes.kehamilankuHomePage.build(context),
    );
  }
}