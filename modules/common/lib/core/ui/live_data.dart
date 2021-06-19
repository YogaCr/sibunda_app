
import 'expirable.dart';

class LiveData<T> {
  LiveData(this._value);
  T? _value;
  T? get value => _value;

  Map<Expirable, void Function(T?)>? _observers = {};

  bool _assertNotDisposed() {
    assert((){
      if(_observers == null) {
        throw "LiveData has been disposed but stil in use.";
      }
      return true;
    }());
    return true;
  }

  void observe(Expirable observer, void Function(T?) onChange) {
    _assertNotDisposed();
    _observers![observer] = onChange;
  }

  bool get hasActiveObserver => _observers?.length.compareTo(0) == 1;

  void dispose() {
    _assertNotDisposed();
    _observers!.clear();
    _observers = null;
  }

  void notifyListeners() {
    _assertNotDisposed();
    for(final observer in _observers!.keys) {
      if(observer.isActive) {
        _observers![observer]!(_value);
      } else {
        _observers!.remove(observer);
      }
    }
  }
}

class MutableLiveData<T> extends LiveData<T> {
  MutableLiveData([T? value]): super(value);
  set value(v) {
    _value = v;
    notifyListeners();
  }
}

