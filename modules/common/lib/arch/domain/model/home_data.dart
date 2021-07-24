import 'package:common/arch/data/remote/model/home_dashboard_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/domain/model/range.dart';
import 'package:flutter/material.dart';

import 'img_data.dart';

class HomeStatus {
  final String desc;
  final ImgData img;
  final Color color;

  HomeStatus({
    required this.desc,
    required this.img,
    required this.color,
  });

  factory HomeStatus.fromResponse(HomeDashboardDataWarningResponse response) => HomeStatus(
    desc: response.desc,
    img: response.img_url != null
        ? ImgData(link: response.img_url!, src: ImgSrc.network,)
        : dummyImg,
    color: response.is_normal ? green_safe : red_warning,
  );
}

class HomeMenu {
  final String name;
  final String moduleName;
  final ImgData img;

  HomeMenu({
    required this.name,
    required this.moduleName,
    required this.img,
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