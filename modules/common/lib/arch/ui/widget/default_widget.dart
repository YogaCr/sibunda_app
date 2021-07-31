
import 'package:common/config/manifest.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'img_widget.dart';

Widget defaultEmptyWidget() => SizedBox.shrink();

Widget defaultImg({
  double? width = 80,
  double? height = 80,
}) => Container(
  width: width,
  height: height,
  color: Manifest.theme.colorPrimary,
);

Widget defaultLoading({
  String? text = "Loading...",
  double? width, //= 80,
  double? height, // = 8
  bool? showText = true,// 0,
}) => Container(
  padding: EdgeInsets.all(10),
  width: width,
  height: height,
  //color: Manifest.theme.colorPrimary,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(),
      ...(showText != true ? [] : [
        SizedBox(height: 10,),
        Text(
          text ?? "Error",
          textAlign: TextAlign.center,
        ),
      ]),
    ],
  ),
);

Widget defaultError({
  String? text = "Error",
  double? width = 80,
  double? height = 80,
}) => Container(
  padding: EdgeInsets.all(10),
  width: width,
  height: height,
  color: red,
  child: Text(
    text ?? "Error",
    textAlign: TextAlign.center,
  ),
);

Widget defaultNoData({
  String? text = Strings.no_data,
  double? width, // = 80,
  double? height, // = 80,
}) => Container(
  padding: EdgeInsets.all(10),
  width: width,
  height: height,
  //color: red,
  child: Text(
    text ?? Strings.no_data,
    textAlign: TextAlign.center,
    style: SibTextStyles.size_min_1_grey.copyWith(fontStyle: FontStyle.italic),
  ),
);

/*
Widget get defaultLoading => Container(
  height: 80,
  color: Manifest.theme.colorPrimary,
);
 */

Widget defaultSliverImg({
  double? width = 80,
  double? height = 80,
}) => SliverToBoxAdapter(
  child: defaultImg(
    width: width,
    height: height,
  ),
);


Widget defaultSliverError({
  String? text = "Error",
  double? width = 80,
  double? height = 80,
}) => SliverToBoxAdapter(
  child: defaultError(
    width: width,
    height: height,
    text: text,
  ),
);


Widget defaultFormItemImg(String link) => Container(
  margin: EdgeInsets.symmetric(vertical: 5),
  constraints: BoxConstraints(maxHeight: 200,),
  child: buildImgNetwork(link, ), //SibImages.get("ilstr_mother_carry_baby.png", package: "common",) //
);


Future<void> showLoadingPopup({
  required BuildContext context,
}) => showDialog(
  context: context,
  builder: (ctx) => AlertDialog(
    content: defaultLoading(),
  ),
);