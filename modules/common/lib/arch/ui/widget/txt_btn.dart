
import 'package:flutter/material.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';

class TxtBtn extends StatelessWidget {
  final String txt;
  final EdgeInsetsGeometry padding;
  final BorderRadius cornerRadius;
  final GestureTapCallback? _onTap;
  final TextStyle? textStyle;
  final bool isHollow;
  final Color? color;
  final double minWidth;
  final double minHeight;

  TxtBtn(
      this.txt,
      {
        GestureTapCallback? onTap,
        this.padding = const EdgeInsets.all(btnPadding),
        this.cornerRadius = const BorderRadius.all(Radius.circular(btnCornerRadius)),
        this.textStyle,
        this.isHollow = false,
        this.color,
        this.minHeight = 0,
        this.minWidth = 0,
        Key? key,
      }
      ): _onTap = onTap, super(key: key,);

  @override
  Widget build(BuildContext context) {
    final primaryColor = color ?? Theme.of(context).buttonColor;
    return Card(
        color: !isHollow ? primaryColor : Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: cornerRadius,
            side: !isHollow ? BorderSide.none : BorderSide(color: primaryColor, width: 1.5),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: minHeight,
            minWidth: minWidth,
          ),
          child: InkWell(
            splashColor: Manifest.theme.colorOnPrimaryRipple,
            onTap: _onTap,
            child: Padding(
              padding: padding,
              child: Text(
                txt,
                style: textStyle ?? SibTextStyles.default_.copyWith(
                    color: !isHollow ? Manifest.theme.colorOnPrimary : primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
    );
  }
}