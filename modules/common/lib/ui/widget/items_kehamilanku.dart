import 'package:common/config/manifest.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  @override
  Widget build(BuildContext context) {
    final parentHeight = 120.0;

    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        height: parentHeight,
        margin: EdgeInsets.only(right: 10),
        width: 80,
        child: image,
      ),
    );

    final txtChild = Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(
          height: parentHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  style: SibTextStyles.size_0_bold_black,
                  children: [
                    TextSpan(text: "Bunda sekarang sudah masuk ke usia "),
                    TextSpan(text: "$pregnancyAge Minggu ", style: SibTextStyles.size_0_bold_colorPrimary),
                    TextSpan(text: "kehamilan ya"),
                  ],
                ),
              ),
              Container(height: 20,),
              RichText(
                text: TextSpan(
                  style: SibTextStyles.size_0_bold_black,
                  children: [
                    TextSpan(text: "$pregnancyAgeRem hari ", style: SibTextStyles.size_0_bold_colorPrimary),
                    TextSpan(text: "lagi menuju kelahiran ya Bun"),
                  ],
                ),
              ),
            ],
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


class ItemMotherTrimester extends StatelessWidget {
  final Widget image;
  final int trimester;
  final int pregnancyAgeStart; //in weeks
  final int pregnancyAgeEnd; //in weeks

  ItemMotherTrimester({
    required this.image,
    required this.trimester,
    required this.pregnancyAgeStart,
    required this.pregnancyAgeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final parentHeight = 80.0;

    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        margin: EdgeInsets.only(right: 15),
        width: 90,
        child: image,
      ),
    );

    final txtChild = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Trimester $trimester",
            style: SibTextStyles.size_0_bold_colorPrimary,
          ),
          Text(
            "Usia kehamilan $pregnancyAgeStart hingga $pregnancyAgeEnd Minggu",
            style: SibTextStyles.size_min_2,
          ),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: grey_calm,
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


class ItemMotherImunization extends StatelessWidget {
  final Widget image;
  final String title;
  final String action;

  ItemMotherImunization({
    required this.image,
    this.title = "Jangan lupa ikut imunisasi ya Bunda",
    this.action = "Lihat imunisasi Bunda",
  });

  @override
  Widget build(BuildContext context) {
    final parentHeight = 120.0;

    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: parentHeight,
        margin: EdgeInsets.only(right: 10),
        width: 70,
        child: image,
      ),
    );

    final txtChild = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: SibTextStyles.size_0_bold,
          ),
          TxtBtn(action),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: Colors.white,
        height: parentHeight,
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


class ItemMotherGraphMenu extends StatelessWidget {
  final Widget image;
  final String text;

  ItemMotherGraphMenu({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final imgChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(right: 10),
        color: Manifest.theme.colorPrimary,
        child: image,
      ),
    );

    final txtChild = Expanded(
      child: Text(
        text,
        style: SibTextStyles.size_min_2_bold_colorPrimary,
        textAlign: TextAlign.start,
      ),
    );


    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: grey_calm,
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

    final imgChild = SizedBox(
      height: 180,
      width: 50,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(bottom: 10),
              child: image,
            ),
          ),
          Text(
            foodName,
            style: SibTextStyles.size_min_1,
          ),
        ],
      ),
    );

    final txtChild = Expanded(
      child: Text(
        desc,
        style: SibTextStyles.size_min_1_bold,
        textAlign: TextAlign.center,
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
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: parentMinHeight,
                  width: 2,
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
class ItemMotherReport extends StatelessWidget {
  final Widget image;
  final String sizeString;
  final double babyLen;
  final double babyWeight;

  ItemMotherReport({
    required this.image,
    required this.sizeString,
    required this.babyLen,
    required this.babyWeight,
  });

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
        style: SibTextStyles.size_min_2,
        children: [
          TextSpan(text: "Panjang Bayi : "),
          TextSpan(text: "$babyLen inch", style: SibTextStyles.size_min_2_bold_colorPrimary),
        ],
      ),
    );

    final babyWeightChild = RichText(
      text: TextSpan(
        style: SibTextStyles.size_min_2,
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