int tryParseInt(source, { int radix = 10, int Function(dynamic)? onError }) {
  if(source is int) return source;
  if(source is num) return source.toInt();
  if(source is String) return int.parse(source, onError: onError);

  if(onError != null) {
    return onError(source);
  }
  throw "Unknown type '${source.runtimeType}' to parse to `int`";
}

num tryParseNum(source, { int radix = 10, num Function(dynamic)? onError }) {
  if(source is num) return source;
  if(source is String) return num.parse(source, onError);

  if(onError != null) {
    return onError(source);
  }
  throw "Unknown type '${source.runtimeType}' to parse to `num`";
}

double tryParseDouble(source, { int radix = 10, double Function(dynamic)? onError }) {
  if(source is double) return source;
  if(source is num) return source.toDouble();
  if(source is String) return double.parse(source, onError);

  if(onError != null) {
    return onError(source);
  }
  throw "Unknown type '${source.runtimeType}' to parse to `double`";
}