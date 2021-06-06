import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
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
  final Widget image;
  final String content;
  final Color bgColor;

  ItemDashboardStatus({
    required this.image,
    required this.content,
    this.bgColor = green_safe,
  });


  @override
  Widget build(BuildContext context) {

    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        margin: EdgeInsets.only(right: _paddingSmall),
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
        width: _size_8,
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
                  style: SibTextStyles.size_min_2,
                  overflow: TextOverflow.clip,
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
  final Widget image;
  final String text;

  ItemDashboardMenu({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
            child: Container(
              height: _size_2,
              width: _size_2,
              color: Manifest.theme.colorPrimary,
              child: image,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,),
            child: Text(
              text,
              style: SibTextStyles.size_min_2_colorPrimary,
            ),
          ),
        ],
      ),
    );
  }
}


class ItemNotif extends StatelessWidget {
  final Widget image;
  final String title;
  final String timestamp;
  final String content;
  final Color bgColor;

  ItemNotif({
    required this.image,
    required this.title,
    required this.content,
    required this.timestamp,
    this.bgColor = grey_calm,
  });


  @override
  Widget build(BuildContext context) {

    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        margin: EdgeInsets.only(right: _paddingSmall),
        child: SizedBox(
          width: _size_1,
          height: _size_1,
          child: image,
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        width: double.infinity,
        height: 70,
        color: bgColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Row(
                children: [
                  imgChild,
                  Column(
                    children: [
                      Text(
                        title,
                        style: SibTextStyles.size_min_1,
                      ),
                      Text(
                        content,
                        style: SibTextStyles.size_min_2,
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    timestamp,
                    style: SibTextStyles.size_min_3_colorPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ItemMessage extends StatelessWidget {
  final Widget image;
  final String title;
  final String content;
  final String timestamp;

  ItemMessage({
    required this.image,
    required this.title,
    required this.content,
    required this.timestamp,
  });


  @override
  Widget build(BuildContext context) {
    final imgChild = Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: image,
      ),
    );

    final txtChild = Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Column(
        children: [
          Text(
            title,
            style: SibTextStyles.size_min_1,
          ),
          Text(
            content,
            style: SibTextStyles.size_min_2,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              content,
              style: SibTextStyles.size_min_2_colorPrimary,
            ),
          ),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        color: grey_calm,
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              imgChild,
              txtChild,
            ],
          ),
        ),
      ),
    );
  }
}


class ItemDashboardTips extends StatelessWidget {
  final Widget image;
  final String headline;
  final String kind;

  ItemDashboardTips({
    required this.image,
    required this.headline,
    required this.kind,
  });

  @override
  Widget build(BuildContext context) {
    final parentHeight = 100.0;

    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: SizedBox(
          height: parentHeight,
          width: parentHeight,
          child: image,
        ),
      ),
    );

    final txtChild = Padding(
      padding: EdgeInsets.all(5),
      child: Expanded(
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