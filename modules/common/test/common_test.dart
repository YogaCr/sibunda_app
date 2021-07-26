import 'package:common/util/times.dart';
import 'package:core/util/_consoles.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiffy/jiffy.dart';

main() async {
  await initializeDateFormatting("id_ID");
  final date = DateTime(2020);
  final str = formatTime(date);
  print("str= $str");


  final dateNew = Jiffy().subtract(years: 1, months: 14).dateTime;
  final yearAge = calculateYearAge(dateNew);
  prin("yearAge= $yearAge");
}