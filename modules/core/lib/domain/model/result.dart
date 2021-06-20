
abstract class Result<T> {
  final int code;
  Result([this.code = 0]);
}

class Success<T> extends Result<T> {
  @override
  final int code;
  final T data;

  Success({
    required this.data,
    this.code = 0,
  }) : super(code);
}

class Fail<T> extends Result<T> {
  @override
  final int code;
  final String? msg;
  final dynamic? error;

  Fail({
    this.code = 1,
    this.msg,
    this.error,
  }) : super(code);
}

/*
class Loading<T> extends Result<T> {
  Loading([int code = 0]): super(code);
}
 */
