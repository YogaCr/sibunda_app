import 'dart:ui';

import 'package:common/config/_config.dart';
import 'package:common/config/manifest.dart';
import 'package:flutter/material.dart';

//export 'dimens.dart';

part 'colors.dart';
part 'fonts.dart';
part 'dimens.dart';


class MaterialTheme {
  final Brightness brightness;

  final MaterialColor primarySwatch;

  final Color splashColor;
  final Color hoverColor;
  final Color primaryHighlightColor;

  final Color textBodyColor;
  final Color textDisplayColor;

  final Color colorPrimary;
  final Color colorPrimaryVariant;
  final Color colorOnPrimary;
  final Color colorPrimaryRipple;
  final Color colorOnPrimaryRipple;

  final Color colorSecondary;
  final Color colorSecondaryVariant;
  final Color colorOnSecondary;

  final Color colorBackground;
  final Color colorOnBackground;

  final Color colorSurface;
  final Color colorOnSurface;

  final Color colorError;
  final Color colorOnError;

  final String fontFamily;

  const MaterialTheme({
    this.primarySwatch = pink_swatch,
    this.colorPrimary = pink_300,
    this.colorPrimaryVariant = pink_400,
    this.colorOnPrimary = white,
    this.colorPrimaryRipple = pink_300_ripple,
    this.colorOnPrimaryRipple = white_ripple,
    this.primaryHighlightColor = pink_highlight,
    this.splashColor = pink_300_ripple,
    this.hoverColor = black_trans_most2,
    this.colorSecondary = pink_300,
    this.colorSecondaryVariant = pink_400,
    this.colorOnSecondary = white,
    this.colorBackground = white,
    this.colorOnBackground = black,
    this.colorSurface = white,
    this.colorOnSurface = black,
    this.colorError = red,
    this.colorOnError = white,
    this.fontFamily = fontFamily_nunito_common,
    this.brightness = Brightness.light,
    this.textBodyColor = Colors.black,
    this.textDisplayColor = Colors.black,
  });

  ThemeData get materialData => ThemeData(
    textTheme: TextTheme().apply(
      bodyColor: textBodyColor,
      displayColor: textDisplayColor,
      fontFamily: fontFamily,
    ),
    //appBarTheme: AppBarTheme(),
    brightness: brightness,
    primaryColor: colorPrimary,
    primaryColorLight: colorPrimary,
    primaryColorDark: colorPrimaryVariant,
    accentColor: colorPrimaryVariant,
    backgroundColor: colorBackground,
    cardColor: colorSurface,
    buttonColor: colorSecondary,
    errorColor: colorError,
    fontFamily: fontFamily,
    primarySwatch: primarySwatch,
    splashColor: splashColor,
    hoverColor: hoverColor,
  );
}

class SibThemes {
  static final lightTheme = MaterialTheme();
  static final darkTheme = MaterialTheme(
    colorBackground: black,
    colorOnBackground: white,
    brightness: Brightness.dark,
    textBodyColor: white,
    textDisplayColor: white,
  );
}