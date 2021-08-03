import 'package:core/domain/model/range.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

T getOrDefault<T>(T? any, {
  T Function()? orElse,
}) {
  final res = tryGetOrDefault(any, orElse: orElse);
  if(res is T) return res;
  final msg = "Can't get default value of `$T` with current `any` value of '$any'";
  prine(msg);
  throw msg;
}
T? tryGetOrDefault<T>(T? any, {
  T Function()? orElse,
}) {
  if(any is T) return any;
  if(T is int || T is num) return 0 as T;
  if(T is double) return 0.0 as T;
  if(T is String) return "<null>" as T;
  return orElse?.call();
}

int parseInt(source, { int radix = 10, int Function(dynamic)? onError }) {
  final res = tryParseInt(source, radix: radix, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `int`, current source value = '$source'";
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
  throw "Unknown type '${source.runtimeType}' to parse to `num`, current source value = '$source'";
}
num? tryParseNum(source, { num Function(dynamic)? onError }) {
  if(source is num) return source;
  //if(source is String) return onError == null ? num.tryParse(source) : num.parse(source, onError);
  if(source is String) {
    final res = onError == null ? num.tryParse(source) : num.parse(source, onError);
    if(res != null) return res;
    if(source.contains(",")) {
      source = source.replaceAll(",", ".");
      return onError == null ? num.tryParse(source) : num.parse(source, onError);
    }
  }

  if(onError != null) {
    return onError(source);
  }
}


double parseDouble(source, { double Function(dynamic)? onError }) {
  final res = tryParseDouble(source, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `double`, current source value = '$source'";
}
double? tryParseDouble(source, { double Function(dynamic)? onError }) {
  if(source is double) return source;
  if(source is num) return source.toDouble();
  if(source is String) {
    final res = onError == null ? double.tryParse(source) : double.parse(source, onError);
    if(res != null) return res;
    if(source.contains(",")) {
      source = source.replaceAll(",", ".");
      return onError == null ? double.tryParse(source) : double.parse(source, onError);
    }
  }

  if(onError != null) {
    return onError(source);
  }
}

DateTime parseDate(source, { DateTime Function(dynamic)? onError }) {
  final res = tryParseDate(source, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `DateTime`, current source value = '$source'";
}
DateTime? tryParseDate(source, { DateTime Function(dynamic)? onError }) {
  if(source == null) return null;
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
  throw "Unknown type '${source.runtimeType}' to parse to `TimeOfDay`, current source value = '$source'";
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

timeOfDayToString(TimeOfDay time) => "${numStr(time.hour)}:${numStr(time.minute)}";
String numStr(num n, { int len = 2 }) {
  var str = n.toString();
  if(str.length < len) {
    final diff = len - str.length;
    for(final i in range(diff)) {
      str = "0$str";
    }
  }
  return str;
}


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