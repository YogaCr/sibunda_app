import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:flutter/material.dart';

class ItemProfilePic extends StatelessWidget {
  final ImgData img;
  final String name;
  final String desc;

  ItemProfilePic({
    required this.img,
    required this.name,
    required this.desc,
  });

  ItemProfilePic.fromData(Profile data):
    img = data.img,
    name = data.name,
    desc = data.email
  ;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final picSize = screenSize.width /3;

    final image = ClipOval(
      child: SibImages.resolve(
        img,
        width: picSize,
        height: picSize,
      ),
    );

    return Column(
      children: [
        image,
        SizedBox(height: 15,),
        Text(
          name,
          style: SibTextStyles.size_0_bold,
        ),
        SizedBox(height: 10,),
        Text(
          desc,
          style: SibTextStyles.size_min_1.copyWith(color: grey),
        ),
      ],
    );
  }
}