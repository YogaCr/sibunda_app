import 'package:common/util/type_util.dart';

Map<String, T> addPrefixToMapKeys<T>(Map<String, T> map, String prefix) {
  final res = <String, T>{};
  for(final entry in map.entries) {
    res["$prefix${entry.key}"] = entry.value;
  }
  return res;
}

Map<String, num> parseAllValuesToNum(Map<String, dynamic> map, {
  num defaultUnparsableNum = -1,
}) => map.map((key, value) {
  if(value is num) {
    return MapEntry(key, value);
  }
  value = tryParseNum(value) ?? defaultUnparsableNum;
  return MapEntry(key, value);
});

Map<String, dynamic> parseAllParsableValuesToNum(Map<String, dynamic> map,) => map.map((key, value) {
  if(value is num) {
    return MapEntry(key, value);
  }
  value = tryParseNum(value) ?? value;
  return MapEntry(key, value);
});

Map<String, dynamic> parseAllBoolToNum(Map<String, dynamic> map,) => map.map((key, value) {
  if(value is bool) {
    return MapEntry(key, value ? 1 : 0);
  }
  return MapEntry(key, value);
});