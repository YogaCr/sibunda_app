/// Based on Google Material color system
/// https://material.io/design/color/the-color-system.html#color-theme-creation

part of '_theme.dart';

const pink_highlight = Color(0xFFFA1992);
const pink_100 = Color(0xFFFF1493);
const pink_200 = Color(0xFFE51284);
const pink_300 = Color(0xFFCC1075); //parseColor3("CC1075")
const pink_300_ripple = Color(0x55CC1075);
const pink_400 = Color(0xFFB20E66);
const pink_500 = Color(0xFF990C58);
const pink_swatch = MaterialColor(
  0xFFCC1075,
  {
    100: pink_100,
    200: pink_200,
    300: pink_300,
    400: pink_400,
    500: pink_500,

    50: Color(0xFFFCE4EC),
    600: Color(0xFFD81B60),
    700: Color(0xFFC2185B),
    800: Color(0xFFAD1457),
    900: Color(0xFF880E4F),
  },
);
const white = Color(0xFFFFFFFF);
const white_ripple = Color(0x55FFFFFF);
const grey = Color(0xFFADADAD);
const grey_trans = Color(0xB7979797);
const black = Color(0xFF000000);
const black_trans = Color(0xCD000000);
const black_trans_more = Color(0x97000000);
const black_trans_most = Color(0x48000000);
const black_trans_most2 = Color(0x19000000);
const black_trans_most3 = Color(0xF000000);
const trans = Color(0x00000000);
const red = Color(0xFFB00020);
const red_warning = Color(0xFFF6EBEB);
const green_calm = Color(0xFF3E9D9D);
const green_safe = Color(0xFFD0F1BB);
const yellow = Color(0xFFFBD460);
const grey_calm = Color(0xFFEBEFF6);
const grey_calmer = Color(0xFFF6F7F9);

final colorPrimary = pink_300;
final colorPrimaryVariant = pink_500;
final colorOnPrimary = white;
/*
final colorSecondary = pink_300;
final colorSecondaryVariant = pink_500;
final colorOnSecondary = white;
 */
final colorBackground = white;
final colorOnBackground = black;

final colorSurface = white;
final colorOnSurface = black;

final colorError = red;
final colorOnError = white;