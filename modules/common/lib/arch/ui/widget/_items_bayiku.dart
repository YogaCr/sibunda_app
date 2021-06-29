import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/config/manifest.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/text.dart';
import 'package:flutter/material.dart';



class ItemBabyOverview extends StatelessWidget {
  final Widget image;
  final String ageString;

  ItemBabyOverview({
    required this.image,
    required this.ageString,
  });

  factory ItemBabyOverview.fromData(
    BabyAgeOverview? data,
  ) {
    final image = Container(color: Manifest.theme.colorPrimary,); //TODO 12 Juni 2021: img
    final ageString = formatAgeString(
      year: data?.year ?? -1,
      month: data?.month ?? -1,
      day: data?.day ?? -1,
    );
    return ItemBabyOverview(
      image: image,
      ageString: ageString,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ItemMenuHomeOverview(
      image: image,
      upperText: RichText(
        text: TextSpan(
          style: SibTextStyles.size_0_bold_black,
          children: [
            TextSpan(text: "Bayi Bunda sekarang sudah berusia "),
            TextSpan(text: ageString, style: SibTextStyles.size_0_bold_colorPrimary),
            TextSpan(text: " ya Bun"),
          ],
        ),
      ),
    );
  }
}


class ItemBabyFormMenu extends StatelessWidget {
  final int year;
  final int ageStart; //In month
  final int ageEnd; //In month
  final Widget image; //In month
  final void Function()? onClick;
  
  ItemBabyFormMenu({
    required this.year,
    required this.ageStart,
    required this.ageEnd,
    required this.image,
    this.onClick,
  });

  ItemBabyFormMenu.fromData(BabyFormMenuData data,{
    this.onClick,
  }): image = Container(color: Manifest.theme.colorPrimary,),
    year = data.year,
    ageStart = data.monthStart,
    ageEnd = data.monthEnd
  ;

  @override
  Widget build(BuildContext context) {
    return ItemHomeBigTitle(
      image: image,
      title: "Tahun ${toPeriodString(year)}",
      desc: "Usia bayi $ageStart hingga $ageEnd bulan",
      onClick: onClick,
    );
  }
}


/// This is for baby growth graph menu.
class ItemBabyGraphMenu extends StatelessWidget {
  final ImgData img;
  final String title;
  final void Function()? onClick;

  ItemBabyGraphMenu({
    required this.img,
    required this.title,
    this.onClick,
  });

  ItemBabyGraphMenu.fromData(BabyGraphMenuData data, {this.onClick}):
    title = data.title,
    img = data.img
  ;

  @override
  Widget build(BuildContext context) {
    final parentHeight = 80.0;

    final image = SibImages.resolve(img);

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

    final txtChild = Text(
      title,
      style: SibTextStyles.size_0_colorPrimary,
    );

    return InkWell(
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
    );
  }
}