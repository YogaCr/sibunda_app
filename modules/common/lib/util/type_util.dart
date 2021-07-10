import 'package:flutter/material.dart';

int parseInt(source, { int radix = 10, int Function(dynamic)? onError }) {
  final res = tryParseInt(source, radix: radix, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `int`";
}
int? tryParseInt(source, {
  int radix = 10,
  int Function(dynamic)? onError,
  bool inclusiveAllNum = true,
}) {
  if(source is int) return source;
  if(inclusiveAllNum && source is num) return source.toInt();
  if(source is String) return onError == null ? int.tryParse(source) : int.parse(source, onError: onError);

  if(onError != null) {
    return onError(source);
  }
}

num parseNum(source, { num Function(dynamic)? onError }) {
  final res = tryParseNum(source, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `num`";
}
num? tryParseNum(source, { num Function(dynamic)? onError }) {
  if(source is num) return source;
  if(source is String) return onError == null ? num.tryParse(source) : num.parse(source, onError);

  if(onError != null) {
    return onError(source);
  }
}


double parseDouble(source, { double Function(dynamic)? onError }) {
  final res = tryParseDouble(source, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `double`";
}
double? tryParseDouble(source, { double Function(dynamic)? onError }) {
  if(source is double) return source;
  if(source is num) return source.toDouble();
  if(source is String) return onError == null ? double.tryParse(source) : double.parse(source, onError);

  if(onError != null) {
    return onError(source);
  }
}

DateTime parseDate(source, { DateTime Function(dynamic)? onError }) {
  final res = tryParseDate(source, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `DateTime`";
}
DateTime? tryParseDate(source, { DateTime Function(dynamic)? onError }) {
  if(source is DateTime) return source;
  if(source is String) {
    final res = DateTime.tryParse(source);
    if(res != null) {
      return res;
    }
  }

  if(onError != null) {
    return onError(source);
  }
}

TimeOfDay parseTimeOfDay(source, { TimeOfDay Function(dynamic)? onError }) {
  final res = tryParseTimeOfDay(source, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `TimeOfDay`";
}
TimeOfDay? tryParseTimeOfDay(source, { TimeOfDay Function(dynamic)? onError }) {
  if(source is TimeOfDay) return source;
  if(source is DateTime) return TimeOfDay.fromDateTime(source);
  if(source is String) {
    var res = DateTime.tryParse(source);
    if (res != null) {
      return tryParseTimeOfDay(res); //recursive;
    }
    final match = RegExp("[0-9]{2}:[0-9]{2}").stringMatch(source);
    if (match != null) {
      final intList = match.split(":").map((e) => int.parse(e)).toList(growable: false);
      return TimeOfDay(hour: intList[0], minute: intList[1]);
    }
  }

  if(onError != null) {
    return onError(source);
  }
}

timeOfDayToString(TimeOfDay time) => "${time.hour}:${time.minute}";


bool boolAll(Iterable<bool?> bools) {
  for(final b in bools) {
    if(b != true) return false;
  }
  return true;
}
bool boolAny(Iterable<bool?> bools) {
  for(final b in bools) {
    if(b == true) return true;
  }
  return false;
}