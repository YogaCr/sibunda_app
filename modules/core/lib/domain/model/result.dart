
abstract class Result<T> {
  final int code;
  Result([this.code = 0]);
}

class Success<T> extends Result<T> {
  @override
  final int code;
  final T data;

  Success(
    this.data,
  [
    this.code = 0,
  ]) : super(code);
}

class Fail<T> extends Result<T> {
  final String? msg;
  final dynamic? error;
  final dynamic? data;

  Fail({
    int? code,
    this.msg,
    this.error,
    this.data,
  }) : super(code ?? 1);
}

/*
class Loading<T> extends Result<T> {
  Loading([int code = 0]): super(code);
}
 */
