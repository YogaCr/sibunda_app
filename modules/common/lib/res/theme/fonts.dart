part of '_theme.dart';


const fontFamily_nunito = "Nunito";

const textStyle_default = TextStyle(
  fontFamily:  fontFamily_nunito,
);
const textTheme_default = Typography;

class SibTextStyles {
  SibTextStyles._();
  static const default_ = TextStyle(
      fontFamily: fontFamily_nunito,
      fontSize: 15,
  );
  static final bold = default_.copyWith(fontWeight: FontWeight.bold);
  static final regular_grey = default_.copyWith(color: grey);
  static final regular_colorPrimary = default_.copyWith(color: Manifest.theme.colorPrimary);

  static final header1 = default_.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 25
  );
  static final header2 = default_.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 40
  );
}
