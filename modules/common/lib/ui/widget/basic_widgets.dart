
import 'package:common/configs/configs.dart';
import 'package:common/configs/manifest.dart';
import 'package:common/res/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class TxtLink extends StatelessWidget {
  final String txt;
  final GestureTapCallback? _onTap;

  TxtLink(
    this.txt, {
    GestureTapCallback? onTap
  }): _onTap = onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: _onTap,
    child: Text(
      txt,
      style: _onTap != null ? SibTextStyles.regular_colorPrimary : SibTextStyles.default_,
      textAlign: TextAlign.center,
    ),
  );
}