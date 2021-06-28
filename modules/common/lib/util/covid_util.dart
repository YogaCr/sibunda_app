import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/text.dart';
import 'package:flutter/material.dart';

String getCovidCategoryString(CovidCategory category) {
  final str = category.toString().split(".").last;
  switch(category) {
    case CovidCategory.normal: return capitalizeFirst(str);
    case CovidCategory.pdp: return str.toUpperCase();
  }
}

Color getCovidCategoryColor(CovidCategory category) {
  switch(category) {
    case CovidCategory.normal: return green_safe;
    default: return red_warning;
  }
}