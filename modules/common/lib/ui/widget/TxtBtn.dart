
import 'package:flutter/material.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';

class TxtBtn extends StatelessWidget {
  final String txt;
  final EdgeInsetsGeometry padding;
  final BorderRadius cornerRadius;
  final GestureTapCallback? _onTap;
  final TextStyle? textStyle;

  TxtBtn(
      this.txt,
      {
        GestureTapCallback? onTap,
        this.padding = const EdgeInsets.all(btnPadding),
        this.cornerRadius = const BorderRadius.all(Radius.circular(btnCornerRadius)),
        this.textStyle,
      }
      ): _onTap = onTap;

  @override
  Widget build(BuildContext context) => Card(
      color: Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: cornerRadius,
      ),
      child: InkWell(
        splashColor: Manifest.theme.colorOnPrimaryRipple,
        onTap: _onTap,
        child: Padding(
          padding: padding,
          child: Text(
            txt,
            style: textStyle ?? SibTextStyles.default_.copyWith(color: Manifest.theme.colorOnPrimary),
            textAlign: TextAlign.center,
          ),
        ),
      )
  );
}