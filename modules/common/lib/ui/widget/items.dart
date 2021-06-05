import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _imgSizeSmall = 30.0;
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
          width: _imgSizeSmall,
          height: _imgSizeSmall,
          child: image,
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        width: 100,
        height: 40,
        color: bgColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              imgChild,
              Text(
                content,
                style: SibTextStyles.size_min_2,
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
    this.bgColor = green_safe,
  });


  @override
  Widget build(BuildContext context) {

    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        margin: EdgeInsets.only(right: _paddingSmall),
        child: SizedBox(
          width: _imgSizeSmall,
          height: _imgSizeSmall,
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

