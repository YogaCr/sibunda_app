import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/config/manifest.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:flutter/material.dart';

import 'txt_btn.dart';

final _cornerRadius = 10.0;


/// Home overview for each module.
class ItemMenuHomeOverview extends StatelessWidget {
  final Widget image;
  final Widget upperText;
  final Widget? lowerText;

  ItemMenuHomeOverview({
    required this.image,
    required this.upperText,
    this.lowerText,
  });

  @override
  Widget build(BuildContext context) {
    final parentHeight = 120.0;

    final imgChild = Container(
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
        child: Container(
          height: parentHeight,
          width: 80,
          child: image,
        ),
      ),
    );

    final txtChildrenList = <Widget>[upperText,];
    if(lowerText != null) {
      txtChildrenList.add(Container(height: 20,));
      txtChildrenList.add(lowerText!);
    }

    final txtChild = Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(
          height: parentHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: txtChildrenList,
          ),
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
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

class ItemHomeBigTitle extends StatelessWidget {
  final Widget image;
  final String title;
  final String desc;
  final String? category;
  final void Function()? onClick; //in weeks

  ItemHomeBigTitle({
    required this.image,
    required this.title,
    required this.desc,
    this.category,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final parentHeight = 80.0;

    final imgChild = Container(
        margin: EdgeInsets.only(right: 15),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 90,
              child: image,
            ),
          ),
        )
    );

    Widget descTxt = Text(
      desc,
      style: SibTextStyles.size_min_2,
    );

    if(category != null && category!.isNotEmpty) {
      descTxt = Row(
        children: [
          descTxt,
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              category!,
              style: SibTextStyles.size_min_2_colorPrimary,
            ),
          ),
        ],
      );
    }

    final txtChild = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: SibTextStyles.size_0_bold_colorPrimary,
          ),
          descTxt,
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: onClick,
        splashColor: Colors.grey,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: grey_calm,
          ),
          height: parentHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                imgChild,
                txtChild,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemPanelWithButton extends StatelessWidget {
  final ImgData img;
  final String title;
  final String action;
  final void Function()? onBtnClick;

  ItemPanelWithButton({
    required this.img,
    required this.title, // = "Jangan lupa ikut imunisasi ya Bunda",
    required this.action, // = "Lihat imunisasi Bunda",
    this.onBtnClick,
  });

  @override
  Widget build(BuildContext context) {
    final parentHeight = 120.0;

    final image = SibImages.resolve(img);

    final imgChild = Container(
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: parentHeight,
          width: 100,
          child: image,
        ),
      ),
    );

    final txtChild = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: SibTextStyles.size_0_bold,
          ),
          TxtBtn(
            action,
            onTap: onBtnClick,
          ),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: Colors.white,
        height: parentHeight,
        child: Padding(
          padding: EdgeInsets.all(10).copyWith(right: 20),
          child: Row(
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


class ItemHomeGraphMenu extends StatelessWidget {
  final Widget image;
  final String text;
  final void Function()? onClick;

  ItemHomeGraphMenu({
    required this.image,
    required this.text,
    this.onClick,
  });

  ItemHomeGraphMenu.fromData(
      HomeGraphMenu data,{
      this.onClick,
  }):
    text = data.name,
    image = Container(color: Manifest.theme.colorPrimary,) //TODO: img
  ;

  @override
  Widget build(BuildContext context) {
    final imgChild = Container(
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
        child: Container(
          height: 50,
          width: 50,
          color: Manifest.theme.colorPrimary,
          child: image,
        ),
      ),
    );

    final txtChild = Expanded(
      child: Text(
        text,
        style: SibTextStyles.size_min_2_bold_colorPrimary,
        textAlign: TextAlign.start,
      ),
    );

    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      onTap: onClick,
      child: Ink(
        decoration: BoxDecoration(
          color: grey_calm,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
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


class ItemFormWarningStatus extends StatelessWidget {
  final Widget image;
  final String desc;
  final String? warningTxt; // if null, then it is safe.
  final void Function()? onClick; //in weeks

  ItemFormWarningStatus({
    required this.desc,
    required this.image,
    this.onClick,
    this.warningTxt,
  });
  ItemFormWarningStatus.fromData(
      FormWarningStatus data, {
      this.onClick,
  }):
    desc = data.desc,
    warningTxt = data.isSafe ? null : data.action,
    image = Container(color: Manifest.theme.colorPrimary,) //TODO: img
  ;

  @override
  Widget build(BuildContext context) {
    final parentHeight = 80.0;

    final imgChild = Container(
        margin: EdgeInsets.only(right: 15),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 90,
              child: image,
            ),
          ),
        )
    );

    final txtList = <Widget>[
      Text(
        desc,
        style: SibTextStyles.size_min_2,
      ),
    ];
    if(warningTxt != null) {
      txtList.add(
        Text(
          warningTxt!,
          style: SibTextStyles.size_min_2_colorPrimary,
        ),
      );
    }

    final txtChild = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: txtList,
      ),
    );

    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      onTap: onClick,
      splashColor: Colors.grey,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: warningTxt == null ? green_safe : red_warning,
        ),
        height: parentHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
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
