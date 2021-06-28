import 'package:common/config/_config.dart';
import 'package:covid19/config/covid_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalRoutes.covid19,
      theme: Manifest.theme.materialData,
      home: CovidRoutes.covidHomePage.build(context),
    );
  }
}
