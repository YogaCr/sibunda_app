int tryParseInt(source, { int radix = 10, int Function(dynamic)? onError }) {
  switch(source.runtimeType) {
    case int: return source;
    case num: return (source as num).toInt();
    case String: return int.parse(source, onError: onError);
  }
  if(onError != null) {
    return onError(source);
  }
  throw "Unknown type '${source.runtimeType}' to parse to `int`";
}