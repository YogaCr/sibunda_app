import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/config/manifest.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '_item_immunization.dart';

final _cornerRadius = 10.0;
final _paddingSmall = 10.0;


class ItemMotherOverview extends StatelessWidget {
  final Widget image;
  final int pregnancyAge; // in weeks
  final int pregnancyAgeRem; // in days

  ItemMotherOverview({
    required this.image,
    required this.pregnancyAge,
    required this.pregnancyAgeRem,
  });

  ItemMotherOverview.fromData(
    MotherPregnancyAgeOverview? data,
  ): image = Container(color: Manifest.theme.colorPrimary,), //TODO 12 Juni 2021: img
    pregnancyAge = data?.weekAge ?? -1,
    pregnancyAgeRem = data?.daysRemaining ?? -1
  ;

  ItemMotherOverview.def():
    image = Container(color: Manifest.theme.colorPrimary,),
    pregnancyAge = -1,
    pregnancyAgeRem = -1
  ;

  @override
  Widget build(BuildContext context) {
    return ItemModuleHomeOverview(
      image: image,
      upperText: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: SibTextStyles.size_0_bold_black,
          children: [
            TextSpan(text: "Bunda sekarang sudah masuk ke usia "),
            TextSpan(text: "$pregnancyAge Minggu ", style: SibTextStyles.size_0_bold_colorPrimary),
            TextSpan(text: "kehamilan ya"),
          ],
        ),
      ),
      lowerText: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: SibTextStyles.size_0_bold_black,
          children: [
            TextSpan(text: "$pregnancyAgeRem hari ", style: SibTextStyles.size_0_bold_colorPrimary),
            TextSpan(text: "lagi menuju kelahiran ya Bun"),
          ],
        ),
      ),
    );
  }
}

/*
class ItemMotherTrimester extends StatelessWidget {
  final Widget image;
  final int trimester;
  final int pregnancyAgeStart; //in weeks
  final int pregnancyAgeEnd; //in weeks
  final void Function()? onClick; //in weeks

  ItemMotherTrimester({
    required this.image,
    required this.trimester,
    required this.pregnancyAgeStart,
    required this.pregnancyAgeEnd,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {

  }
}
 */

///*
class ItemMotherTrimester extends StatelessWidget {
  final Widget image;
  final int trimester;
  final int pregnancyAgeStart; //in weeks
  final int pregnancyAgeEnd; //in weeks
  final void Function()? onClick; //in weeks

  ItemMotherTrimester({
    required this.image,
    required this.trimester,
    required this.pregnancyAgeStart,
    required this.pregnancyAgeEnd,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ItemHomeFormMenu(
      image: image,
      title: "Trimester $trimester",
      desc: "Usia kehamilan $pregnancyAgeStart hingga $pregnancyAgeEnd Minggu",
      onClick: onClick,
    );
  }
}

// */

/*
class ItemMotherImmunizationHome extends StatelessWidget {
  final Widget image;
  final String title;
  final String action;
  final void Function()? onBtnClick;

  ItemMotherImmunizationHome({
    required this.image,
    this.title = "Jangan lupa ikut imunisasi ya Bunda",
    this.action = "Lihat imunisasi Bunda",
    this.onBtnClick,
  });

  @override
  Widget build(BuildContext context) {
    return ItemHomeImmunization(
      image: image,
      title: title,
      action: action,
      onBtnClick: onBtnClick,
    );
  }
}
 */

/*
class ItemMotherGraphMenu extends StatelessWidget {
  final Widget image;
  final String text;

  ItemMotherGraphMenu({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ItemHomeGraphMenu(
      image: image,
      text: text,
    );
  }
}
 */


class ItemMotherRecomFood extends StatelessWidget {
  final Widget image;
  final String foodName;
  final String desc;

  ItemMotherRecomFood({
    required this.image,
    required this.foodName,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    //final parentHeight = 10.0;
    final parentMinHeight = 80.0;

    final imgChild = ConstrainedBox(
      constraints: BoxConstraints(minHeight: parentMinHeight, maxWidth: 70,),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 60,
                width: 60,
                child: image,
              ),
            ),
          ),
          Text(
            foodName,
            style: SibTextStyles.size_min_1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    final txtChild = Expanded(
      child: Text(
        desc,
        style: SibTextStyles.size_min_1_bold,
        textAlign: TextAlign.start,
      ),
    );


    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: parentMinHeight,),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                imgChild,
                Container(
                  constraints: BoxConstraints(minHeight: parentMinHeight, maxWidth: 2, minWidth: 2,),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Manifest.theme.colorPrimary,
                ),
                txtChild
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///*
/// Used in mother pregnancy check form.
class ItemMotherBabySizeOverview extends StatelessWidget {
  final Widget image;
  final String sizeString;
  final double babyLen;
  final double babyWeight;

  ItemMotherBabySizeOverview({
    required this.image,
    required this.sizeString,
    required this.babyLen,
    required this.babyWeight,
  });

  ItemMotherBabySizeOverview.fromData(PregnancyBabySize? data):
    image = Container(color: Manifest.theme.colorPrimary,),
    sizeString = data?.sizeString ?? "<null>",
    babyLen = data?.babyLen ?? -1,
    babyWeight = data?.babyWeight ?? -1
  ;

  @override
  Widget build(BuildContext context) {
    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 70,
        width: 60,
        child: image,
      ),
    );

    final descChild = Expanded(
      child: RichText(
        text: TextSpan(
          style: SibTextStyles.size_0_bold_black,
          children: [
            TextSpan(text: "Selamat Bunda!\nSekarang si Kecil sudah sebesar "),
            TextSpan(text: "$sizeString ", style: SibTextStyles.size_0_bold_colorPrimary),
            TextSpan(text: "ya Bun"),
          ],
        ),
      ),
    );

    final babyLenChild = RichText(
      text: TextSpan(
        style: SibTextStyles.size_min_2_black,
        children: [
          TextSpan(text: "Panjang Bayi : "),
          TextSpan(text: "$babyLen inch", style: SibTextStyles.size_min_2_bold_colorPrimary),
        ],
      ),
    );

    final babyWeightChild = RichText(
      text: TextSpan(
        style: SibTextStyles.size_min_2_black,
        children: [
          TextSpan(text: "Berat Bayi : "),
          TextSpan(text: "$babyWeight pounds", style: SibTextStyles.size_min_2_bold_colorPrimary),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: grey_calm,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  imgChild,
                  Container(width: 10,),
                  descChild,
                ],
              ),
              Container(height: 10,),
              Row(
                children: [
                  babyLenChild,
                  SizedBox(width: 15,),
                  babyWeightChild,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// */
/*
class ItemMotherImmunizationFill extends StatelessWidget {
  final String immunizationName;
  final String? date;

  ItemMotherImmunizationFill({
    required this.immunizationName,
    this.date,
  });

  ItemMotherImmunizationFill.fromData(ImmunizationListItem data):
    immunizationName = data.core.name,
    date = data.core.date
  ;

  @override
  Widget build(BuildContext context) {
    return ItemImmunizationFill(
      immunizationName: immunizationName,
      date: date,
    );
  }
}
 */