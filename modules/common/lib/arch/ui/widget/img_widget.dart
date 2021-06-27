import 'package:flutter/material.dart';

import 'default_widget.dart';

Widget buildImgNetwork(
  String src, {
      Widget Function(BuildContext context,Widget child, ImageChunkEvent? loadingProgress,)? loadingBuilder,
      Widget Function(BuildContext context, Object error, StackTrace? stackTrace,)? errorBuilder,
      BoxFit? fit,
}) => Image.network(
  src,
  loadingBuilder: loadingBuilder ?? buildDefaultImgNetworkLoading(),
  errorBuilder: errorBuilder ?? buildDefaultImgNetworkError(),
  fit: fit,
);

Widget Function(BuildContext context,Widget child, ImageChunkEvent? loadingProgress,) buildDefaultImgNetworkLoading() =>
        (context, child, loadingProgress) => defaultLoading();

Widget Function(BuildContext context, Object error, StackTrace? stackTrace,) buildDefaultImgNetworkError() =>
        (context, error, stackTrace,) => defaultError(text: "Img Load Error");

