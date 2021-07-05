
import 'dart:io';
import 'dart:ui';

import 'package:core/util/_consoles.dart';
import 'package:jiffy/jiffy.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

//HPTH + 1 tahun - 3 bulan + 7 hari
DateTime getHpl([DateTime? hpht]) => Jiffy(hpht).add(years: 1, days: 7).subtract(months: 3).dateTime;

Future<String> formatTime(DateTime date, { String localeName = "id_ID" }) async {
  await initializeDateFormatting(localeName);
  return DateFormat.yMMMMd(localeName).format(date);
}

String syncFormatTime(DateTime date, { String localeName = "id_ID" }) {
  //initializeDateFormatting("id_ID");
  prind("Platform.localeName = ${Platform.localeName}");
  prind("window.locales = ${window.locales}");

  try {
    return DateFormat.yMMMMd(localeName).format(date);
  } catch(e) {
    return DateFormat.yMMMMd().format(date);
  }
}