part of 'view_model.dart';


class ViewModelObserver<Vm extends ViewModel, V> extends StatefulWidget {
  final LiveData<V> Function(Vm) liveDataGetter;
  final Widget Function(BuildContext, V?) builder;

  ViewModelObserver({
    required this.liveDataGetter,
    required this.builder,
  });

  @override
  _ViewModelObserverState<Vm, V> createState() => _ViewModelObserverState<Vm, V>(
    liveDataGetter: liveDataGetter,
    builder: builder,
  );

}

class _ViewModelObserverState<Vm extends ViewModel, V> extends State<ViewModelObserver<Vm, V>> {
  final LiveData<V> Function(Vm) liveDataGetter;
  final Widget Function(BuildContext, V?) builder;
  LiveData<V>? _liveData;

  _ViewModelObserverState({
    required this.liveDataGetter,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    if(_liveData == null) {
      final vm = ViewModelProvider.of<Vm>(context);
      _liveData = liveDataGetter(vm);
      _liveData!.observe((data) => setState((){}));
    }
    return builder(context, _liveData!.value);
  }
}