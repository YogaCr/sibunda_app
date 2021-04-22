
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future goToPage(BuildContext context, Widget Function(BuildContext) builder) => Navigator.push(
    context,
    MaterialPageRoute(builder: builder)
);

void backPage(BuildContext context) => Navigator.pop(context);