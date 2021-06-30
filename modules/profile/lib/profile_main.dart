import 'package:common/config/_config.dart';
import 'package:flutter/material.dart';
import 'package:profile/config/profile_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalRoutes.profile,
      theme: Manifest.theme.materialData,
      home: ProfileRoutes.obj.entryPoint.build(context),
    );
  }
}