import 'package:common/arch/data/remote/model/covid_check_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';

enum CovidCategory {
  normal,
  pdp,
  odp,
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
  final DateTime date;
  final String person; // mother or baby
  final ImgData img;
  //final CovidCategory category;
  final String desc;
  final String longDesc;
  final bool isNormal;

  CovidCheckHistory({
    required this.date,
    required this.person,
    required this.img,
    required this.desc,
    required this.longDesc,
    required this.isNormal,
  });

  factory CovidCheckHistory.fromResponse(CovidCheckFormDataResponse response) => CovidCheckHistory(
    date: parseDate(response.date),
    person: getCovidPersonStr(response.is_ibu),
    img: ImgData(
      link: response.img_url,
      src: ImgSrc.network,
    ),
    desc: response.result_desc,
    longDesc: response.result_long_desc,
    isNormal: response.result_is_normal,
  );
}

class CovidFormOverview {
  final String desc;
  final ImgData img; // mother or baby

  CovidFormOverview({
    required this.desc,
    required this.img,
  });
}


class CovidMotherCheckForm {
  //TODO: kelas kosong,
}