import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final tipsPanelHeight = 150.0;
final tipsPanelWidth = 260.0;

class ItemTipsHeaderPanel extends StatelessWidget {
  final ImgData img;
  final String headline;
  final String kind;

  ItemTipsHeaderPanel({
    required this.img,
    required this.kind,
    required this.headline,
  });

  ItemTipsHeaderPanel.fromData(Tips data):
      img = data.img,
      headline = data.title,
      kind = data.kind
  ;

  @override
  Widget build(BuildContext context) {
    final parentHeight = tipsPanelHeight;
    final parentWidth = tipsPanelWidth;

    final image = SibImages.resolve(img, fit: BoxFit.cover);

    final stack = Container(
      height: parentHeight,
      width: parentWidth,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: image,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              constraints: BoxConstraints(maxHeight: parentHeight *70 /100),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    black_trans_more,
                    trans,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.4, 1],
                ),
              ),
              padding: EdgeInsets.all(10,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: SibTextStyles.size_min_1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,),
                    child: Text(
                      kind,
                      textAlign: TextAlign.start,
                      style: SibTextStyles.size_min_2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: stack,
    );
  }
}