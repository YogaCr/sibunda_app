import 'package:common/res/string/_string.dart';

extension StringExt on String {
  bool get isBlank => isEmpty || trim() == "";
  bool get isNumeric => double.tryParse(this) != null;
}

extension StringNullExt on String? {
  bool get isNullOrBlank => this == null || this!.isEmpty || this!.trim() == "";
}

String toPeriodString(int i) {
  switch(i) {
    case 1: return "Pertama";
    case 2: return "Kedua";
    case 3: return "Ketiga";
    case 4: return "Keempat";
    case 5: return "Kelima";
    case 6: return "Keenam";
    case 7: return "Ketujuh";
  }
  throw "`i` '$i' doesn't has a case in switch";
}

String formatAgeString({
  int year = 0,
  int month = 0,
  int day = 0,
}) {
  String res = "";
  if(year > 0) {
    res = "$year ${Strings.year}";
  }
  if(month > 0) {
    res = res.isNotEmpty
        ? "$res lebih $month ${Strings.month}"
        : "$month ${Strings.month}";
  }
  if(day > 0) {
    res = res.isNotEmpty
        ? "$res lebih $day ${Strings.day}"
        : "$day ${Strings.day}";
  }
  return res;
}

String capitalizeFirst(String str) => "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
String capitalizeEach(String str) {
  final list = str.split(" ");
  final buffer = StringBuffer();
  for(int i = 0; i < list.length; i++) {
    buffer.write("${capitalizeFirst(list[i])} ");
  }
  buffer.write("${capitalizeFirst(list.last)}");
  return buffer.toString();
}

String toIntDuoStr(int i) {
  var res = i.toString();
  return res.length < 2 ? "0$res" : res;
}