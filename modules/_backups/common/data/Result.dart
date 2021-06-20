abstract class Result<T> {
  final int code;
  Result([this.code = 0]);
}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data, [int code = 0]) : super(code);
}

class Fail<T> extends Result<T> {
  final String? message;
  final Object? error;
  final dynamic data;
  Fail({this.message, this.error, this.data, int? code = -1}) : super(code ?? -1);
}

class Loading<T> extends Result<T> {
  Loading([int? code = 0]) : super(code ?? 0);
}