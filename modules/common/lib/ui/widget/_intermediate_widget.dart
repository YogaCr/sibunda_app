
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/cupertino.dart';

export "items_home.dart";

/// Image with pick image icon.
class ImgPick extends StatelessWidget {
  ///For the main image
  final String imgUrl;
  final String? pickImgUrl;

  ImgPick({
    required this.imgUrl,
    this.pickImgUrl,
  });

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Image.asset(
        SibImages.getDir(imgUrl),
        width: 100,
        height: 100,
      ),
      Positioned(
        bottom: -20,
        child: Image.asset(
          SibImages.getDir(pickImgUrl ?? "ic_plus_color.png"),
          width: 40,
          height: 40,
        ),
      ),
    ],
  );
}