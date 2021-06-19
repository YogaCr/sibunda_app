
class LiveData<T> {
  LiveData(this._value);
  T? _value;
  T? get value => _value;

  List<void Function(T?)>? _observers = [];

  bool _assertNotDisposed() {
    assert((){
      if(_observers == null) {
        throw "LiveData has been disposed but stil in use.";
      }
      return true;
    }());
    return true;
  }

  void observe(void Function(T?) onChange) {
    _assertNotDisposed();
    _observers!.add(onChange);
  }

  void dispose() {
    _assertNotDisposed();
    _observers = null;
  }

  void notifyListeners() {
    _assertNotDisposed();
    for(final observer in _observers!) {
      observer(_value);
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

