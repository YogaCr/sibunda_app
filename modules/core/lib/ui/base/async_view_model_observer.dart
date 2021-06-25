import 'package:flutter/material.dart';

import 'async_vm.dart';
import 'expirable.dart';
import 'live_data.dart';
import 'view_model.dart';


class AsyncVmObserver<Vm extends AsyncVm, V> extends StatefulWidget {
  final LiveData<V> Function(Vm) liveDataGetter;
  final Widget Function(BuildContext, V?) builder;
  final bool Function(V?)? predicate;
  final Widget? Function(BuildContext ctx, String key)? preAsyncBuilder;
  final bool distinctUntilChanged;
  final Vm? vm;

  AsyncVmObserver({
    required this.liveDataGetter,
    required this.builder,
    this.predicate,
    this.preAsyncBuilder,
    this.distinctUntilChanged = false,
    /// This way, this.[AsyncVmObserver] won't be busy of looking for [Vm] in parent tree.
    this.vm,
  });

  @override
  _AsyncVmObserverState<Vm, V> createState() => _AsyncVmObserverState<Vm, V>(
    vm: vm,
    liveDataGetter: liveDataGetter,
    builder: builder,
    predicate: predicate,
    preAsyncBuilder: preAsyncBuilder,
    distinctUntilChanged: distinctUntilChanged,
  );

}

class _AsyncVmObserverState<Vm extends AsyncVm, V>
    extends State<AsyncVmObserver<Vm, V>>
    implements Expirable
{
  final LiveData<V> Function(Vm) liveDataGetter;
  final Widget Function(BuildContext, V?) builder;
  final bool Function(V?)? predicate;
  final bool distinctUntilChanged;
  Vm? vm;
  LiveData<V>? _liveData;

  /// If it returns [Widget], it means the widget will be rebuilt using the returned [Widget].
  /// If it returns null, the old [Widget] will stay.
  final Widget? Function(BuildContext ctx, String key)? preAsyncBuilder;

  Widget? incomingWidget;

  _AsyncVmObserverState({
    required this.liveDataGetter,
    required this.builder,
    /// This way, this.[AsyncVmObserver] won't be busy of looking for [Vm] in parent tree.
    required this.vm,
    this.predicate,
    this.preAsyncBuilder,
    this.distinctUntilChanged = false,
  });

  bool _isActive = true;
  @override
  bool get isActive => _isActive;

  @override
  void dispose(){
    super.dispose();
    _isActive = false;
    _liveData = null;
    vm = null;
  }

  @override
  Widget build(BuildContext context) {
    if(_liveData == null) {
      final vm = this.vm ??= ViewModelProvider.of<Vm>(context);
      final vmPreAsyncTask = (preAsyncBuilder != null) ? (String key) {
        final newPreWidget = preAsyncBuilder!(this.context, key);
        print("AsyncVmObserver.build() newPreWidget= $newPreWidget");
        if(newPreWidget != null) {
          setState(() {
            incomingWidget = newPreWidget;
            print("AsyncVmObserver.build() incomingWidget SET");
          });
        }
      } : null;

      vm.addOnPreAsyncTask(this, vmPreAsyncTask);
      _liveData = liveDataGetter(vm);
      _liveData!.observe(this, (data) {
        if(predicate == null || predicate!(data)) {
          setState(() {
            incomingWidget = builder(context, _liveData!.value);
          });
        }
      },
        distinctUntilChanged: distinctUntilChanged,
      );
    }
    return incomingWidget ?? builder(context, _liveData!.value);
  }
}