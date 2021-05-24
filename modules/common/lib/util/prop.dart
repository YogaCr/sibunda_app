class LiveProp<T> {
  void Function(T)? _onChanged;
  set onChanged(void Function(T) v) => _onChanged = v;

  T _value;
  T get value => _value;
  set value(T v) {
    _value = v;
    _onChanged?.call(v);
  }

  LiveProp(T initVal, [void Function(T)? onChanged]): _onChanged = onChanged, _value = initVal;
}

class NullableLiveProp<T> extends LiveProp<T?> {
  NullableLiveProp(void Function(T?) onChanged) : super(null, onChanged);
}

/*
class Prop<T> {
  final
  T _value;
}
 */