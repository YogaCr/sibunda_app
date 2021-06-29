import 'package:common/util/times.dart';
import 'package:intl/date_symbol_data_local.dart';

main() async {
  await initializeDateFormatting("id_ID");
  final date = DateTime(2020);
  final str = formatTime(date);
  print("str= $str");
}