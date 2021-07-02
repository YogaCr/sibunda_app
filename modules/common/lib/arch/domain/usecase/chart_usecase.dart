
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:core/domain/model/result.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

mixin GetLineSeries {
  Future<Result<List<LineSeries<dynamic, num>>>> call(String ownerId);
}

mixin GetChartWarning {
  Future<Result<List<FormWarningStatus>>> call(String ownerId);
}