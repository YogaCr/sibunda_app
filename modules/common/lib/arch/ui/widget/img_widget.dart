import 'package:flutter/material.dart';

import 'default_widget.dart';

Widget buildImgNetwork(
  String src, {
      Widget Function(BuildContext context,Widget child, ImageChunkEvent? loadingProgress,)? loadingBuilder,
      Widget Function(BuildContext context, Object error, StackTrace? stackTrace,)? errorBuilder,
      BoxFit? fit,
}) => Image.network(
  src,
  loadingBuilder: loadingBuilder ?? defImgLoadingBuilder(),
  errorBuilder: errorBuilder ?? defImgErrorBuilder(),
  fit: fit,
);


Widget Function(BuildContext context,Widget child, ImageChunkEvent? loadingProgress,) defImgLoadingBuilder() =>
        (context, child, loadingProgress) => defaultLoading();

Widget Function(BuildContext context, Object error, StackTrace? stackTrace,) defImgBuilder() =>
        (context, child, loadingProgress) => defaultImg();

Widget Function(BuildContext context, Object error, StackTrace? stackTrace,) defImgErrorBuilder() =>
        (context, error, stackTrace,) => defaultError(text: "Img Load Error");

