
import 'dart:io';
import 'dart:ui';

import 'package:common/util/type_util.dart';
import 'package:core/util/_consoles.dart';
import 'package:jiffy/jiffy.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

//HPTH + 1 tahun - 3 bulan + 7 hari
DateTime getHpl([DateTime? hpht]) => Jiffy(hpht).add(years: 1, days: 7).subtract(months: 3).dateTime;
DateTime getHpht([DateTime? hpl]) => Jiffy(hpl).subtract(years: 1, days: 7).add(months: 3).dateTime;

int getPregnancyWeek(DateTime hpht) => calculateDayAge(hpht) ~/ 7;

Future<String> formatTime(DateTime date, { String localeName = "id_ID" }) async {
  await initializeDateFormatting(localeName);
  return DateFormat.yMMMMd(localeName).format(date);
}

int calculateDayAge(DateTime birthDate) => DateTime.now().difference(birthDate).inDays;
int calculateYearAge(DateTime birthDate) => parseInt(Jiffy().diff(birthDate, Units.YEAR));

String syncFormatTimeFromStr(String datestr, { String localeName = "id_ID" }) =>
  syncFormatTime(parseDate(datestr), localeName: localeName);
String syncFormatTime(DateTime date, { String localeName = "id_ID" }) {
  //initializeDateFormatting("id_ID");
  try {
    prind("Platform.localeName = ${Platform.localeName}");
    prind("window.locales = ${window.locales}");
    return DateFormat.yMMMMd(localeName).format(date);
  } catch(e) {
    return DateFormat.yMMMMd().format(date);
  }
}


String? trySyncFormatTimeFromStr(String datestr, { String localeName = "id_ID" }) {
  try {
    return syncFormatTime(parseDate(datestr), localeName: localeName);
  } catch(e, stack) {
    prine("Can't convert `dateStr` of '$datestr' to DateTime; e= $e");
    prine(stack);
  }
}