class LiveProp<T> {
  final void Function(T?) _onChanged;

  T? _value;
  T? get value => _value;
  set value(v) => _value = v;

  LiveProp(void Function(T?) onChanged,): _onChanged = onChanged;
}