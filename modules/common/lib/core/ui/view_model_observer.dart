part of 'view_model.dart';


class ViewModelObserver<Vm extends ViewModel, V> extends StatefulWidget {
  final LiveData<V> Function(Vm) liveDataGetter;
  final Widget Function(BuildContext, V?) builder;
  final bool Function(V?)? predicate;

  ViewModelObserver({
    required this.liveDataGetter,
    required this.builder,
    this.predicate,
  });

  @override
  _ViewModelObserverState<Vm, V> createState() => _ViewModelObserverState<Vm, V>(
    liveDataGetter: liveDataGetter,
    builder: builder,
    predicate: predicate,
  );

}

class _ViewModelObserverState<Vm extends ViewModel, V>
    extends State<ViewModelObserver<Vm, V>>
    implements Expirable
{
  final LiveData<V> Function(Vm) liveDataGetter;
  final Widget Function(BuildContext, V?) builder;
  final bool Function(V?)? predicate;
  LiveData<V>? _liveData;

  _ViewModelObserverState({
    required this.liveDataGetter,
    required this.builder,
    this.predicate,
  });

  bool _isActive = true;
  @override
  bool get isActive => _isActive;

  @override
  void dispose(){
    super.dispose();
    _isActive = false;
    _liveData = null;
  }

  @override
  Widget build(BuildContext context) {
    if(_liveData == null) {
      final vm = ViewModelProvider.of<Vm>(context);
      _liveData = liveDataGetter(vm);
      _liveData!.observe(this, (data) {
        if(predicate == null || predicate!(data)) {
          setState(() {});
        }
      });
    }
    return builder(context, _liveData!.value);
  }
}