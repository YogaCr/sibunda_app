import 'package:common/res/theme/_theme.dart';
import 'package:flutter/material.dart';

class TxtSuffixIcon extends StatelessWidget {
  final Color color;
  final String txt;
  final Widget suffix;
  final BorderRadius borderRadius;
  final void Function()? onClick;

  TxtSuffixIcon({
    required this.color,
    required this.txt,
    required this.suffix,
    this.onClick,
    BorderRadius? borderRadius,
  }):
    this.borderRadius = borderRadius ?? BorderRadius.circular(10,)
  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: trans,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onClick,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  txt,
                  style: SibTextStyles.size_0_bold.copyWith(color: white,),
                ),
                SizedBox(width: 5,),
                suffix,
              ],
            ),
          ),
        ),
      ),
    );
  }
}