import 'package:jiffy/jiffy.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

//HPTH + 1 tahun - 3 bulan + 7 hari
DateTime getHpl([DateTime? hpht]) => Jiffy(hpht).add(years: 1, days: 7).subtract(months: 3).dateTime;

Future<String> formatTime(DateTime date) async {
  await initializeDateFormatting("id_ID");
  return DateFormat.yMMMMd("id_ID").format(date);
}