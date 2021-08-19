import 'package:common/config/_config.dart';
import 'package:education/config/education_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalRoutes.education,
      theme: Manifest.theme.materialData,
      home: EducationRoutes.educationHomePage.build(context),
    );
  }
}