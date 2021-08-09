import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/notif_data.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/times.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _size_1 = 30.0;
final _size_2 = 50.0;
final _size_3 = 80.0;
final _size_4 = 100.0;
final _size_5 = 120.0;
final _size_6 = 140.0;
final _size_7 = 170.0;
final _size_8 = 200.0;
final _size_9 = 240.0;
final _size_10 = 280.0;
final _size_11 = 350.0;
final _size_12 = 400.0;
final _cornerRadius = 10.0;
final _paddingSmall = 10.0;

class ItemDashboardStatus extends StatelessWidget {
  final ImgData img;
  final String content;
  final Color bgColor;

  ItemDashboardStatus({
    required this.img,
    required this.content,
    this.bgColor = green_safe,
  });

  ItemDashboardStatus.fromData(HomeStatus data):
      img = data.img,
      content = data.desc,
      bgColor = data.color
  ;


  @override
  Widget build(BuildContext context) {
    final image = SibImages.resolve(img);

    final imgChild = Container(
      margin: EdgeInsets.only(right: _paddingSmall),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
        child: SizedBox(
          width: _size_3,
          height: _size_3,
          child: image,
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        width: _size_9,
        height: _size_4,
        color: bgColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              imgChild,
              Expanded(
                child: Text(
                  content,
                  style: SibTextStyles.size_min_1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ItemDashboardMenu extends StatelessWidget {
  final ImgData img;
  final String text;
  final void Function()? onClick;

  ItemDashboardMenu({
    required this.img,
    required this.text,
    this.onClick,
    Key? key,
  }): super(key: key);

  ItemDashboardMenu.fromData(HomeMenu data, {
    this.onClick,
    Key? key,
  }):
      img = data.img,
      text = data.name, super(key: key)
  ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Manifest.theme.colorOnPrimaryRipple,
      onTap: onClick,
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
              child: Container(
                color: Manifest.theme.colorPrimary,
                height: 70,
                width: 70,
                child: SibImages.resolve(img),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,),
              child: Text(
                text,
                style: SibTextStyles.size_min_1_bold_colorPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ItemNotif extends StatelessWidget {
  final ImgData img;
  final String title;
  final String timestamp;
  final String content;
  final Color bgColor;

  ItemNotif({
    required this.img,
    required this.title,
    required this.content,
    required this.timestamp,
    this.bgColor = grey_calm,
  });

  ItemNotif.fromData(HomeNotifMsg data, {this.bgColor = grey_calm}):
     title = data.title,
     content = data.desc,
     timestamp = syncFormatTime(data.time),
     img = data.img
  ;

  @override
  Widget build(BuildContext context) {
    final image = SibImages.resolve(img);
    final imgChild = Container(
      margin: EdgeInsets.only(right: _paddingSmall),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
            child: SizedBox(
              width: _size_2,
              height: _size_2,
              child: image,
            ),
          ),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 70,),
        color: bgColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Row(
                children: [
                  imgChild,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: SibTextStyles.size_0_bold,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          content,
                          style: SibTextStyles.size_min_1,
                        ),
                        SizedBox(height: 5,),
                      ],
                    ),
                  ),
                ],
              ),
/*
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        timestamp,
                        style: SibTextStyles.size_min_3_colorPrimary,
                      ),
                    ),
                  ],
                ),
              ),
 */
///*
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    timestamp,
                    style: SibTextStyles.size_min_2_colorPrimary,
                  ),
                ),
              ),
// */
            ],
          ),
        ),
      ),
    );
  }
}



class ItemMessage extends StatelessWidget {
  final ImgData img;
  final String title;
  final String content;
  final String timestamp;

  ItemMessage({
    required this.img,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  ItemMessage.fromData(HomeNotifMsg data):
      title = data.title,
      content = data.desc,
      timestamp = syncFormatTime(data.time),
      img = data.img
  ;

  @override
  Widget build(BuildContext context) {
    final image = SibImages.resolve(img);
    final imgChild = Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        width: double.infinity,
        child: image,
      )
    );

    final txtChild = Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: SibTextStyles.size_0_bold,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    content,
                    style: SibTextStyles.size_min_1,
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                timestamp,
                style: SibTextStyles.size_min_2_colorPrimary,
              ),
            ),
          ],
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        color: grey_calm,
        constraints: BoxConstraints(minHeight: 250, maxHeight: 300),
        child: Column(
          children: [
            imgChild,
            txtChild,
          ],
        ),
      ),
    );
  }
}

//TODO hapus
/*
class ItemDashboardTips extends StatelessWidget {
  final Widget image;
  final String headline;
  final String kind;

  ItemDashboardTips({
    required this.image,
    required this.headline,
    required this.kind,
  });

  ItemDashboardTips.fromData(HomeTips data):
      image = Container(color: Manifest.theme.colorPrimary,), //Todo: img
      headline = data.desc,
      kind = data.kind
  ;

  @override
  Widget build(BuildContext context) {
    final parentHeight = 100.0;

    final imgChild = Container(
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: SizedBox(
          height: parentHeight,
          width: parentHeight,
          child: image,
        ),
      ),
    );

    final txtChild = Expanded( //Agak aneh karna expanded hanya expanded ke ukuran MainAxis dari parent.
      child: Container(
        height: parentHeight,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  headline,
                  style: SibTextStyles.size_min_1.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  kind,
                  style: SibTextStyles.size_min_2_colorPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            imgChild,
            txtChild,
          ],
        ),
      ),
    );
  }
}

 */