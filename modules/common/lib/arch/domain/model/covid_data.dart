import 'package:common/arch/domain/model/img_data.dart';

enum CovidCategory {
  normal,
  pdp,
}

class CovidHomeOverview {
  final String title;
  final ImgData img;

  CovidHomeOverview({
    required this.title,
    required this.img,
  });
}

class CovidCheckHistory {
  final String date;
  final String person; // mother or baby
  final ImgData img;
  final CovidCategory category;

  CovidCheckHistory({
    required this.date,
    required this.person,
    required this.img,
    required this.category,
  });
}

class CovidFormOverview {
  final String desc;
  final ImgData img; // mother or baby

  CovidFormOverview({
    required this.desc,
    required this.img,
  });
}