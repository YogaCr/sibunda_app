class Val<T> {
  final T value;
  Val(this.value);
}

class Var<T> extends Val<T> {
  @override
  T value;
  Var(this.value) : super(value);
}