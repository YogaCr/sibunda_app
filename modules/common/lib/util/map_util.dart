Map<String, T> addPrefixToMapKeys<T>(Map<String, T> map, String prefix) {
  final res = <String, T>{};
  for(final entry in map.entries) {
    res["$prefix${entry.key}"] = entry.value;
  }
  return res;
}