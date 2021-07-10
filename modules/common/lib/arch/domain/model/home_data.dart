import 'package:common/arch/data/remote/model/home_dashboard_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
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
        ? ImgData(link: response.img_url!, isLocal: false)
        : dummyImg,
    color: Colors.white, //For now, it's white, cuz the server doesn't serve it.
  );
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