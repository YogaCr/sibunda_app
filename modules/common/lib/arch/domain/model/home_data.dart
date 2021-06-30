import 'package:core/domain/model/range.dart';
import 'package:flutter/material.dart';

import 'img_data.dart';

class HomeStatus {
  final String desc;
  final String imgLink;
  final Color color;

  HomeStatus({
    required this.desc,
    required this.imgLink,
    required this.color,
  });
}

class HomeMenu {
  final String name;
  final String moduleName;
  final String imgLink;

  HomeMenu({
    required this.name,
    required this.moduleName,
    required this.imgLink,
  });
}
/*
class HomeTips {
  final String desc;
  final String kind;
  final ImgData img;

  HomeTips({
    required this.desc,
    required this.kind,
    required this.img,
  });
}
 */

class HomeFormMenu {
  final String title;
  final IntRange range;
  final String imgLink;

  HomeFormMenu({
    required this.title,
    required this.range,
    required this.imgLink,
  });
}