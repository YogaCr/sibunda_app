class LiveData<T> {
  T? _value;
  T? get value => _value;

  bool _isDisposed = false;
  bool get isActive => _isDisposed;

  List<Observer> _observers = List.empty(growable: true);

  void observe(Observer<T> observer) => _observers.add(observer);

  void dispose() {
    _isDisposed = true;
  }
}


abstract class Observer<T> {
  bool _isActive = true;
  bool get isActive => _isActive;

  void close() {
    _isActive = false;
  }
  void onChanged(T? value);
}