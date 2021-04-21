import 'package:flutter/material.dart';
import 'package:common/util/functions/colors_ext.dart';

part 'colors.dart';
part 'fonts.dart';


class Theme {
  final Color colorPrimary;
  final Color colorPrimaryVariant;
  final Color colorOnPrimary;

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

  const Theme(
      this.colorPrimary,
      this.colorPrimaryVariant,
      this.colorOnPrimary,
      this.colorSecondary,
      this.colorSecondaryVariant,
      this.colorOnSecondary,
      this.colorBackground,
      this.colorOnBackground,
      this.colorSurface,
      this.colorOnSurface,
      this.colorError,
      this.colorOnError,
      this.fontFamily,
  );

  ThemeData get materialData => ThemeData(
      primaryColor: colorPrimary,
      primaryColorLight: colorPrimary,
      primaryColorDark: colorPrimaryVariant,
      accentColor: colorPrimaryVariant,
      backgroundColor: colorBackground,
      cardColor: colorSurface,
      buttonColor: colorSecondary,
      errorColor: colorError,
      fontFamily: fontFamily,
  );
}

final lightTheme = Theme(
    pink_300, pink_500, white,
    pink_300, pink_500, white,
    white, black,
    white, black,
    red, white,
    fontFamily_nunito,
);
final darkTheme = Theme(
    pink_300, pink_500, white,
    pink_300, pink_500, white,
    white, black,
    white, black,
    red, white,
    fontFamily_nunito,
);