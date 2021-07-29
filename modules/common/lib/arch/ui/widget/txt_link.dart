
import 'package:flutter/material.dart';
import 'package:common/res/theme/_theme.dart';

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
      style: _onTap != null
          ? SibTextStyles.regular_colorPrimary : SibTextStyles.default_,
      textAlign: TextAlign.center,
    ),
  );
}