
import 'package:flutter/cupertino.dart';
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
    assert((){
      if(!isActive) {
        throw "LiveData '$this' has been disposed but still in use.";
      }
      return true;
    }());
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

  @mustCallSuper
  void dispose() {
    //_assertNotDisposed();
    _observers!.clear();
    _observers = null;
  }

  void notifyObservers({T? oldValue, T? newValue}) {
    _assertNotDisposed();
    //print("notifyObservers() oldValue= $oldValue newValue= $newValue _observers= $_observers");
    for(final key in _observers!.keys) {
      //print("notifyObservers() FOR AWAL key= $key");
      final observer = key.item1;
      //print("notifyObservers() FOR AWAL observer= $observer");
      if(observer.isActive) {
        final pair = _observers![key]!;
        //print("notifyObservers() FOR IF AWAL pair= $pair");
        if(!pair.item2 || oldValue != newValue) {
          pair.item1(_value);
        }
      } else {
        _observers!.remove(observer);
      }
    }
  }

  @override
  String toString() => "LiveData<$T>(value=$value)";
}

class MutableLiveData<T> extends LiveData<T> {
  MutableLiveData([T? value]): super(value);
  set value(v) {
    final old = _value;
    _value = v;
    notifyObservers(oldValue: old, newValue: v);
  }
}



/// Extended version of [LiveData] that can map [ChangeNotifier] change into
/// [LiveData.notifyObservers].
class ChangeNotifLiveData<T> extends LiveData<T> {
  ChangeNotifLiveData(
    this._notifier,
    this.onChange, {
    this.isNotifierOwner = false,
  }): super(onChange(_notifier)) {
    notifierCallback = () {
      if(isActive) {
        final oldValue = _value;
        _value = onChange(_notifier);
        notifyObservers(oldValue: oldValue, newValue: _value);
      } else {
        _notifier.removeListener(notifierCallback);
      }
    };
    _notifier.addListener(notifierCallback);
  }

  final bool isNotifierOwner;
  ChangeNotifier _notifier;
  T? Function(ChangeNotifier) onChange;
  late final void Function() notifierCallback;

  void dispose() {
    super.dispose();
    _notifier.removeListener(notifierCallback);
    if(isNotifierOwner) {
      _notifier.dispose();
    }
  }
}


class MutableChangeNotifLiveData<T>
    extends ChangeNotifLiveData<T>
    implements MutableLiveData<T>
{
  MutableChangeNotifLiveData(
    ChangeNotifier notifier, {
    required T? Function(ChangeNotifier p1) getNotif,
    required this.setNotif,
    bool isNotifierOwner = false,
  }): super(notifier, getNotif, isNotifierOwner: isNotifierOwner,) {
    observe(this, (data) {
      setNotif(_notifier, data);
    }, tag: "MutableChangeNotifLiveData<$T>");
  }

  @override
  set value(T? v) {
    final old = _value;
    _value = v;
    notifyObservers(oldValue: old, newValue: v);
  }

  final void Function(ChangeNotifier p1, T? value) setNotif;

  @override
  String toString() => "MutableLiveData<$T>(value=$value)";
}