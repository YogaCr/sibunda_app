
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