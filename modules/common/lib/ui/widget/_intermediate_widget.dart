
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/cupertino.dart';

export "items_home.dart";

/// Image with pick image icon.
class ImgPick extends StatelessWidget {
  ///For the main image
  final String imgUrl;
  final String? pickImgUrl;
  final String? package;

  ImgPick({
    required this.imgUrl,
    this.pickImgUrl,
    this.package,
  });

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      SibImages.get(
        imgUrl,
        package: package,
        width: 100,
        height: 100,
      ),
      Positioned(
        bottom: -20,
        child: SibImages.get(
          pickImgUrl ?? "ic_plus_color.png",
          package: package,
          width: 40,
          height: 40,
        ),
      ),
    ],
  );
}