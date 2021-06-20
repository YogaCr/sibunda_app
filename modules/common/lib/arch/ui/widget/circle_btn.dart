
import 'package:common/util/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleBtn extends StatelessWidget {
  final OnClick? onClick;
  final Widget? child;
  final Color? color;

  CircleBtn({
    required this.onClick,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final btnColor = color ?? Theme.of(context).buttonColor;
    return Card(
      shape: CircleBorder(side: BorderSide(color: btnColor, width: 1.5,)),
      child: InkWell(
        child: child,
        onTap: onClick,
      ),
    );
  }
}