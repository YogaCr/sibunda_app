
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/util/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Image with pick image icon.
class ImgPick extends StatelessWidget {
  /// For the main image placeholder.
  final ImgData placeholderImg;

  /// For the 'pick' indicator image.
  final ImgData pickImg;

  final ImgData? pic;
  final void Function(XFile?)? onImgPick;
  //final String? package;

  ImgPick({
    ImgData? placeholderImg,
    ImgData? pickImg,
    this.pic,
    this.onImgPick,
    //this.package,
  }):
     this.pickImg = pickImg ?? dummyImg_pick,
     this.placeholderImg = placeholderImg ?? dummyImg_profile
  ;

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      ClipOval(
        child: SibImages.resolve(
          pic ?? placeholderImg,
          width: 100,
          height: 100,
        ),
      ),
      Positioned(
        bottom: -20,
        child: InkWell(
          onTap: onImgPick != null ? () async {
            final file = await showPickImgPopup(context: context);
            onImgPick!(file);
          } : null,
          child: Container(
            margin: EdgeInsets.all(10),
            child: SibImages.resolve(
              pickImg,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    ],
  );
}