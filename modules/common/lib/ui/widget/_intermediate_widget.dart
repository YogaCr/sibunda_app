
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/cupertino.dart';

class ImgPick extends StatelessWidget {
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
        Images.getDir(imgUrl),
        width: 100,
        height: 100,
      ),
      Positioned(
        bottom: -20,
        child: Image.asset(
          Images.getDir(pickImgUrl ?? "ic_plus_color.png"),
          width: 40,
          height: 40,
        ),
      ),
    ],
  );
}