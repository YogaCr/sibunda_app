import 'package:common/arch/domain/model/img_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'form_warning_status.dart';

class ChartData {
  final String title;
  final List<LineSeries<dynamic, num>> seriesList;
  final List<FormWarningStatus> warningList;

  ChartData({
    required this.title,
    required this.seriesList,
    required this.warningList,
  });
}

class ChartMenuData {
  final String title;
  final ImgData img;

  ChartMenuData({
    required this.title,
    required this.img,
  });
}