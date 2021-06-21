import 'package:core/ui/base/expirable.dart';
import 'package:flutter/cupertino.dart';

import 'live_data.dart';

class LiveDataObserver<T> extends StatefulWidget {
  final LiveData<T> liveData;
  final bool distinctUtilChanged;
  final Widget? Function(BuildContext, T?) builder;
  final Widget Function(BuildContext)? initBuilder;
  final bool Function(T?)? predicate;

  LiveDataObserver({
    this.initBuilder,
    required this.builder,
    required this.liveData,
    this.predicate,
    this.distinctUtilChanged = false,
  });

  @override
  _LiveDataObserverState<T> createState() => _LiveDataObserverState(
    initBuilder: initBuilder,
    builder: builder,
    liveData: liveData,
    predicate: predicate,
    distinctUtilChanged: distinctUtilChanged,
  );
}

class _LiveDataObserverState<T>
    extends State<LiveDataObserver<T>>
    implements Expirable
{
  final LiveData<T> liveData;
  final bool distinctUtilChanged;
  final Widget? Function(BuildContext, T?) builder;
  final Widget Function(BuildContext)? initBuilder;
  final bool Function(T?)? predicate;
  bool isInit = true;

  _LiveDataObserverState({
    this.initBuilder,
    required this.builder,
    required this.liveData,
    this.predicate,
    this.distinctUtilChanged = false,
  }) {
    liveData.observe(this, (data) {
      if(predicate == null || predicate!(data)) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _isActive = true;
    if(isInit) {
      final initWidget = initBuilder != null
          ? initBuilder!(context)
          : builder(context, liveData.value);
      if(initWidget == null) {
        throw "Initial widget can't be null. This can happen when programmer doesn't provide `initBuilder` and `builder` returns null when `liveData.value` is null";
      }
      isInit = false;
      return initWidget;
    }
    final widget = builder(context, liveData.value);
    if(widget == null) {
      throw "`builder` can return null widget.";
    }
    return widget;
  }

  bool _isActive = false;
  @override
  bool get isActive => _isActive;

  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }
}