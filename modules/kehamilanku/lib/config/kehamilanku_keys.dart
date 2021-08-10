import 'package:flutter/material.dart';

class KehamilankuKeys {
  KehamilankuKeys._();

  static const home_btnBabySelection = Key("btn_baby_selection");
  static const home_btnImmunization = Key("btn_immunization");
  static const home_btnImmunizationSubmission = Key("btn_immunization_submission");
  static const home_btnChartPregnancyEval = Key("btn_chart_pregnancy_eval");
  static const home_btnChartWeight = Key("btn_chart_weight");

  static Key home_btnTrimester(int i) => Key("btn_trimester_$i");
  static Key home_btnTrimesterSubmission(int week) => Key("btn_trimester_submission_$week");
}