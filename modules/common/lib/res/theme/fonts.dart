part of '_theme.dart';


const fontFamily_nunito = "Nunito";
const fontFamily_nunito_common = "packages/${GlobalRoutes.common}/Nunito";

const fontFamily_firaCode = "FiraCode";
const fontFamily_firaCode_common = "packages/${GlobalRoutes.common}/FiraCode";

const textStyle_default = TextStyle(
  fontFamily:  fontFamily_nunito,
);
const textTheme_default = Typography;

class SibTextStyles {
  SibTextStyles._();
  static const default_ = TextStyle(
    fontFamily: fontFamily_nunito_common,
    fontSize: 15,
    //package: GlobalRoutes.common,
  );

  static final size_plus_7 = default_.copyWith(fontSize: 34);
  static final size_plus_6 = default_.copyWith(fontSize: 32);
  static final size_plus_5 = default_.copyWith(fontSize: 30);
  static final size_plus_4 = default_.copyWith(fontSize: 26);
  static final size_plus_3 = default_.copyWith(fontSize: 23);
  static final size_plus_2 = default_.copyWith(fontSize: 20);
  static final size_plus_1 = default_.copyWith(fontSize: 18);
  static final size_0 = default_;
  static final size_min_1 = default_.copyWith(fontSize: 13);
  static final size_min_2 = default_.copyWith(fontSize: 10);
  static final size_min_3 = default_.copyWith(fontSize: 8);
  static final size_min_4 = default_.copyWith(fontSize: 6);


  static final size_min_2_black = size_min_2.copyWith(color: Colors.black);

  static final size_min_1_grey = size_min_1.copyWith(color: Colors.grey);

  static final size_0_colorPrimary = default_.copyWith(color: Manifest.theme.colorPrimary);
  static final size_0_bold = size_0.copyWith(fontWeight: FontWeight.bold);
  static final size_0_bold_black = size_0_bold.copyWith(color: Colors.black);
  static final size_0_bold_colorPrimary = size_0_bold.copyWith(color: Manifest.theme.colorPrimary);

  static final size_plus_1_bold = size_plus_1.copyWith(fontWeight: FontWeight.bold,);
  static final size_plus_1_bold_colorPrimary = size_plus_1_bold.copyWith(color: Manifest.theme.colorPrimary);

  static final size_plus_2_colorOnPrimary = size_plus_2.copyWith(color: Manifest.theme.colorOnPrimary);

  static final size_min_1_colorOnPrimary = size_min_1.copyWith(color: Manifest.theme.colorOnPrimary);
  static final size_min_1_colorPrimary = size_min_1.copyWith(color: Manifest.theme.colorPrimary);
  static final size_min_1_bold = size_min_1.copyWith(fontWeight: FontWeight.bold);
  static final size_min_1_bold_colorPrimary = size_min_1_bold.copyWith(color: Manifest.theme.colorPrimary);

  static final size_min_3_colorPrimary = size_min_3.copyWith(color: Manifest.theme.colorPrimary);
  static final size_min_2_colorPrimary = size_min_2.copyWith(color: Manifest.theme.colorPrimary);
  static final size_min_2_colorOnPrimary = size_min_2.copyWith(color: Manifest.theme.colorOnPrimary);
  static final size_min_2_bold_colorPrimary = size_min_2_colorPrimary.copyWith(fontWeight: FontWeight.bold);
  static final size_min_2_bold = size_min_2.copyWith(fontWeight: FontWeight.bold);

  static final bold = default_.copyWith(fontWeight: FontWeight.bold);
  static final regular_grey = default_.copyWith(color: grey);
  static final regular_colorPrimary = size_0_colorPrimary;

  static final header1 = default_.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 25
  );
  static final header2 = default_.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 40
  );

  static final overText = size_min_1.copyWith(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
}
