
import 'package:tuple/tuple.dart';

import 'expirable.dart';

class LiveData<T> implements Expirable {
  LiveData(this._value);
  T? _value;
  T? get value => _value;

  Map<Tuple2<Expirable, String>, Tuple2<void Function(T?), bool>>? _observers = {};

  @override
  bool get isActive => _observers != null;

  bool _assertNotDisposed() {
    print("_assertNotDisposed()");
    assert((){
      if(!isActive) {
        throw "LiveData has been disposed but stil in use.";
      }
      return true;
    }());
    print("_assertNotDisposed() AKHIR");
    return true;
  }

  /// [distinctUntilChanged] `true` when [observer] is only notified when [_value]
  /// is different internally from the previous value. This means when setter of [value]
  /// in [MutableLiveData] invoked but with the same internal representation of [_value],
  /// [observer] won't be notified.
  void observe(
    Expirable observer,
    void Function(T?) onChange,
  {
    bool distinctUntilChanged = false,
    String tag = "",
  }) {
    _assertNotDisposed();
    final key = Tuple2(observer, tag);
    _observers![key] = Tuple2(onChange, distinctUntilChanged);
  }

  bool get hasActiveObserver => _observers?.length.compareTo(0) == 1;

  void dispose() {
    _assertNotDisposed();
    _observers!.clear();
    _observers = null;
  }

  void notifyObservers({T? oldValue, T? newValue}) {
    _assertNotDisposed();
    print("notifyObservers() oldValue= $oldValue newValue= $newValue _observers= $_observers");
    for(final key in _observers!.keys) {
      print("notifyObservers() FOR AWAL key= $key");
      final observer = key.item1;
      print("notifyObservers() FOR AWAL observer= $observer");
      if(observer.isActive) {
        final pair = _observers![key]!;
        print("notifyObservers() FOR IF AWAL pair= $pair");
        if(!pair.item2 || oldValue != newValue) {
          pair.item1(_value);
        }
      } else {
        _observers!.remove(observer);
      }
    }
  }
}

class MutableLiveData<T> extends LiveData<T> {
  MutableLiveData([T? value]): super(value);
  set value(v) {
    final old = _value;
    _value = v;
    notifyObservers(oldValue: old, newValue: v);
  }
}

