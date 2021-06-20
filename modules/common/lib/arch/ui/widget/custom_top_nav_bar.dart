import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedTopNavBarBg extends StatelessWidget {
  final List<Widget> children;

  RoundedTopNavBarBg({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Manifest.theme.colorPrimary;
    final borderRadius = Radius.circular(30);

    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: borderRadius, bottomRight: borderRadius,),
      child: Container(
        height: 120,
        color: primaryColor,
        child: Stack(
          children: children,
        ),
      ),
    );
  }
}


class RoundedTopNavBarTitleAndBack extends StatelessWidget {
  final String title;
  final Widget bottomChild;

  RoundedTopNavBarTitleAndBack({
    required this.title,
    Widget? bottomChild,
  }): this.bottomChild = bottomChild ?? Container();

  @override
  Widget build(BuildContext context) {
    //final primaryColor = Manifest.theme.colorPrimary;
    final onPrimaryColor = Manifest.theme.colorOnPrimary;
    //final borderRadius = Radius.circular(30);

    return RoundedTopNavBarBg(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 50,
            height: 50,
            child: InkWell(
              child: Icon(
                Icons.arrow_back_rounded,
                color: onPrimaryColor,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ), //Back
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 20,),
            child: Text(
              title,
              style: SibTextStyles.size_plus_2_colorOnPrimary,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 40,),
              child: bottomChild,
            ),
          ),
        ),
      ],
    );
  }
}


class RoundedTopNavBarProfile extends StatelessWidget {
  final Widget image;
  final String name;
  final String? desc;
  final Widget? actionBtn;
  final void Function(BuildContext)? onActionBtnClick;

  RoundedTopNavBarProfile({
    required this.image,
    required this.name,
    this.desc,
    this.actionBtn,
    this.onActionBtnClick,
  });

  @override
  Widget build(BuildContext context) {

    final txtChildren = List<Widget>.generate(1, (index) => Text(name, style: SibTextStyles.size_plus_2_colorOnPrimary,));
    if(desc != null){
      txtChildren.add(
        Container(
          margin: EdgeInsets.only(top: 10,),
          child: Text(
            desc!,
            style: SibTextStyles.size_min_1.copyWith(color: yellow),
          ),
        ),
      );
    }

    final actionBtnChild = (actionBtn != null)
      ? Expanded(
          child: InkWell(
            child: actionBtn,
            onTap: () => onActionBtnClick?.call(context),
      )) : null;

    return RoundedTopNavBarBg(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 30,),
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15,),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: image,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: txtChildren,
                  ),
                ],
              ),
            ),
          ),
        ), //Back
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(top: 15, right: 15),
            child: SizedBox(
              width: 50,
              height: 50,
              child: actionBtnChild,
            ),
          ),
        ),
      ],
    );
  }
}