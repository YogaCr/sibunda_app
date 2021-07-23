
import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/times.dart';
import 'package:flutter/material.dart';

import '_item_template.dart';

class ItemCovidHomeOverview extends StatelessWidget {
  final ImgData img;
  final String desc;

  ItemCovidHomeOverview({
    required this.img,
    required this.desc,
  });

  factory ItemCovidHomeOverview.fromData(CovidHomeOverview data,) => ItemCovidHomeOverview(
    img: data.img,
    desc: data.title,
  );

  @override
  Widget build(BuildContext context) {
    final image = SibImages.resolve(img);
    return ItemModuleHomeOverview(
      image: image,
      upperText: Text(
        desc,
        style: SibTextStyles.size_0_bold_black,
      ),
    );
  }
}


class ItemCovidCheckHistory extends StatelessWidget {
  final ImgData img;
  final String title;
  final String date;
  final String person;
  final Color color;
  final void Function()? onClick; //in weeks

  ItemCovidCheckHistory({
    required this.img,
    required this.date,
    required this.title,
    required this.person,
    required this.color,
    this.onClick,
  });

  ItemCovidCheckHistory.fromData(CovidCheckHistory data, {
    this.onClick,
  }):
    img = data.img,
    date = syncFormatTime(data.date),
    title = data.desc, //"Terindikasi ${getCovidCategoryString(data.category)}",
    person = data.person,
    color = getCovidColor(data.isNormal)
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

    final txtList = <Widget>[
      Text(
        title,
        style: SibTextStyles.size_0_bold_colorPrimary,
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: SibTextStyles.size_min_2,
            ),
            Text(
              person,
              style: SibTextStyles.size_min_2,
            ),
          ],
        ),
      ),
    ];

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
          color: color,
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