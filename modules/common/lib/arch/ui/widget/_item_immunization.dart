
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/times.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemHomeImmunization extends StatelessWidget {
  final ImgData img;
  final String title;
  final String action;
  final void Function()? onBtnClick;
  final Key? btnKey;
/*
  ItemHomeImmunization({
    required this.img,
    required this.title, // = "Jangan lupa ikut imunisasi ya Bunda",
    required this.action, // = "Lihat imunisasi Bunda",
    this.onBtnClick,
  });
 */

  ItemHomeImmunization.fromData(HomeImmunizationData data, {
    this.onBtnClick,
    this.btnKey,
  }):
        title = data.title,
        action = data.action,
        img = data.img, super()
  ;

  @override
  Widget build(BuildContext context) {
    return ItemPanelWithButton(
      img: img,
      title: title,
      action: action,
      onBtnClick: onBtnClick,
      btnKey: btnKey,
    );
  }
}

class ItemImmunizationFill extends StatelessWidget {
  final String immunizationName;
  final String? date; //null if a person hasn't taken immunization.
  final String? descLeft;
  final String? descRight;
  final void Function()? onBtnClick;
  final Key? btnKey;

  ItemImmunizationFill({
    required this.immunizationName,
    this.date,
    this.descLeft,
    this.descRight,
    this.onBtnClick,
    this.btnKey,
  });

  factory ItemImmunizationFill.fromData(
      UiImmunizationListItem data, {
      void Function()? onBtnClick,
      Key? btnKey,
  }) {
    final detail = data.detail;
    String? descRight;
    String? descLeft;

    if(detail != null) {
      descLeft = "Bulan ke ";
      if(detail.monthExact != null) {
        descLeft += detail.monthExact.toString() +".";
      } else if(detail.monthRange != null) {
        final start = detail.monthRange!.start;
        final end = detail.monthRange!.end;
        descLeft += "$start-$end.";
      }
      descRight = "No. Batch: ${detail.batchNo ?? "-"}";
    }

    return ItemImmunizationFill(
      immunizationName: data.core.name,
      date: data.core.date != null
          ? trySyncFormatTimeFromStr(data.core.date!) ?? data.core.date!
          : null,
      descLeft: descLeft,
      descRight: descRight,
      onBtnClick: onBtnClick,
      btnKey: btnKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color txtColor;
    Color txtCardColor;
    Color cardColor;
    Color bgColor;

    if(date == null) {
      txtColor = Manifest.theme.textBodyColor;
      txtCardColor = Manifest.theme.colorOnPrimary;
      cardColor = Manifest.theme.colorPrimary;
      bgColor = grey_calm;
    } else {
      txtColor = Manifest.theme.colorOnPrimary;
      txtCardColor = Manifest.theme.colorPrimary;
      cardColor = Manifest.theme.colorOnPrimary;
      bgColor = Manifest.theme.colorPrimary;
    }

    final upperWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          immunizationName,
          style: SibTextStyles.size_min_1.copyWith(color: txtColor),
        ),
        InkWell(
          key: btnKey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          onTap: onBtnClick,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: cardColor,
              boxShadow: [BoxShadow(),],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                date ?? "Konfirmasi",
                style: SibTextStyles.size_min_1.copyWith(color: txtCardColor),
              ),
            ),
          ),
        ),
      ],
    );

    final columnChildren = <Widget>[upperWidget];

    //Widget? belowWidget;
    if(descLeft != null || descRight != null) {
      final belowChildren = <Widget>[];
      if(descLeft != null) {
        belowChildren.add(
          Text(
            descLeft!,
            style: SibTextStyles.size_min_2.copyWith(color: txtColor),
          ),
        );
      }
      if(descRight != null) {
        belowChildren.add(
          Text(
            descRight!,
            style: SibTextStyles.size_min_2.copyWith(color: txtColor),
          ),
        );
      }
      final belowWidget = Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: belowChildren,
        ),
      );
      columnChildren.add(belowWidget);
    }

    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: columnChildren,
        ),
      ),
    );
  }
}


class ImmunizationOverviewView extends StatelessWidget {
  final ImgData img;
  final String text;

  ImmunizationOverviewView({
    required this.img,
    required this.text,
  });

  ImmunizationOverviewView.fromData(ImmunizationOverview data):
     text = data.text,
     img = data.img
  ;

  @override
  Widget build(BuildContext context) {
    final parentHeight = 120.0;
    return Container(
      height: parentHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              width: 80,
              child: SibImages.resolve(img),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Text(
              text,
              style: SibTextStyles.size_min_1_bold,
            ),
          ),

        ],
      ),
    );
  }
}