
import 'package:common/arch/data/remote/model/home_dashboard_api_model.dart';
import 'package:common/arch/data/remote/model/home_tips_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/util/type_util.dart';

import 'img_data.dart';

class Tips {
  final int id;
  final String title;
  final String kind;
  final ImgData img;

  Tips({
    required this.id,
    required this.title,
    required this.kind,
    required this.img,
  });
/*
  factory Tips.fromHomeResponse(HomeDashboardDataTipsResponse response) => Tips(
    id: -1,
    title: response.desc,
    kind: "", //For now, it's the alternative, cuz serve doesn't serve it.
    img: response.img_url != null
        ? ImgData(link: response.img_url!, src: ImgSrc.network,)
        : dummyImg,
  );
 */
  factory Tips.fromTipsResponse(TipsDataResponse response) => Tips(
    id: response.id,
    title: response.desc,
    kind: response.tips_category.name,
    img: response.img_url != null
        ? ImgData(link: response.img_url!, src: ImgSrc.network,)
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

  factory TipsDetail.fromTipsResponse(TipsDataResponse response) => TipsDetail(
    tips: Tips.fromTipsResponse(response),
    desc: response.content,
    date: parseDate(response.updated_at),
  );
}