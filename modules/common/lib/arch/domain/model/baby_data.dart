class BabyAgeOverview {
  final int year; //If 0, it won't be displayed on screen. This applies to other fields.
  final int month;
  final int day;

  BabyAgeOverview({
    required this.year,
    required this.month,
    required this.day,
  });
}

class BabyFormMenuData {
  final int year;
  final int monthStart;
  final int monthEnd;

  BabyFormMenuData({
    required this.year,
    required this.monthStart,
    required this.monthEnd,
  });
}