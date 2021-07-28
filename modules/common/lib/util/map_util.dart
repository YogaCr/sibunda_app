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