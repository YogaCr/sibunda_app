
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future goToPage(BuildContext ctx, Widget Function(BuildContext) builder) => Navigator.push(
    ctx,
    MaterialPageRoute(builder: builder)
);