
import 'package:common/arch/data/remote/model/home_dashboard_api_model.dart';
import 'package:common/arch/data/remote/model/home_tips_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';

import 'img_data.dart';

class Tips {
  final String title;
  final String kind;
  final ImgData img;

  Tips({
    required this.title,
    required this.kind,
    required this.img,
  });

  factory Tips.fromHomeResponse(HomeDashboardDataTipsResponse response) => Tips(
    title: response.desc,
    kind: "", //For now, it's the alternative, cuz serve doesn't serve it.
    img: response.img_url != null
        ? ImgData(link: response.img_url!, isLocal: false)
        : dummyImg,
  );

  factory Tips.fromTipsResponse(TipsDataResponse response) => Tips(
    title: response.desc,
    kind: "", //For now, it's the alternative, cuz serve doesn't serve it.
    img: response.img_url != null
        ? ImgData(link: response.img_url!, isLocal: false)
        : dummyImg,
  );
}


class TipsDetail {
  final Tips tips;
  final String desc;
  final DateTime date;

  TipsDetail({
    required this.tips,
    required this.desc,
    required this.date,
  });
}