
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future goToPage(
  BuildContext context,
  Widget Function(BuildContext) builder, {
  bool clearPrevs = false,
}) => !clearPrevs
    ? Navigator.push(
        context,
        MaterialPageRoute(builder: builder)
    )
    : Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: builder),
        ModalRoute.withName("/Home")
    );

void backPage(BuildContext context) => Navigator.pop(context);