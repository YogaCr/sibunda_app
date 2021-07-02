import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data.dart';
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
    return ItemModuleHomeOverview(
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
    return ItemHomeFormMenu(
      image: image,
      title: "Tahun ${toPeriodString(year)}",
      desc: "Usia bayi $ageStart hingga $ageEnd bulan",
      onClick: onClick,
    );
  }
}