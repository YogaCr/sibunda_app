int parseInt(source, { int radix = 10, int Function(dynamic)? onError }) {
  final res = tryParseInt(source, radix: radix, onError: onError);
  if(res != null) {
    return res;
  }
  throw "Unknown type '${source.runtimeType}' to parse to `int`";
}
int? tryParseInt(source, { int radix = 10, int Function(dynamic)? onError }) {
  if(source is int) return source;
  if(source is num) return source.toInt();
  if(source is String) return int.parse(source, onError: onError);

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
  if(source is String) return num.parse(source, onError);

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
  if(source is String) return double.parse(source, onError);

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