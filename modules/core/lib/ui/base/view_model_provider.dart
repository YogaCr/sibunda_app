part of 'view_model.dart';


class ViewModelStore extends InheritedWidget {
  ViewModelStore({
    required List<ViewModel> viewModels,
    required List<ViewModel Function(BuildContext)> viewModelCreators,
    required Widget child,
    Key? key,
  }) :
        _viewModels = viewModels,
        _viewModelCreators = viewModelCreators,
        super(key: key, child: child);

  final List<ViewModel> _viewModels;
  final List<ViewModel Function(BuildContext)> _viewModelCreators;

  T? getCachedViewModel<T extends ViewModel>() {
    prind("ViewModelStore.getCachedViewModel() T= '$T' _viewModels= $_viewModels");
    return _viewModels.firstWhereOrNull((it) => it.runtimeType == T) as T?;
  }

  T getViewModel<T extends ViewModel>(BuildContext context) {
    T? vm = _viewModels.firstWhereOrNull((it) => it.runtimeType == T) as T?;
    //print("vm = $vm");
    if(vm == null) {
      //final creators = _viewModelCreators;
      //print("creators = $creators");
      int i = _viewModels.length -1;
      int creatorsLen = _viewModelCreators.length;
      while(++i < creatorsLen) {
        //print("while creatorsLen = $creatorsLen i = $i");
        final newVm = _viewModelCreators[i](context);
        _viewModels.add(newVm);
        prind("ViewModelStore newVm= '$newVm' is stored");
        if(newVm.runtimeType == T) {
          vm = newVm as T;
          break;
        }
      }
      //print("vm AKHIR = $vm");
      if(vm == null) {
        throw "No ViewModel type '$T' in BuildContext $context";
      }
    }
    return vm;
  }

  @override
  bool updateShouldNotify(ViewModelStore oldWidget) => _viewModels != oldWidget._viewModels;
}

class ViewModelProvider extends StatefulWidget {
  final List<ViewModel Function(BuildContext)> creators;
  final Widget child;
  @override
  final Key? key;

  ViewModelProvider({
    required List<ViewModel Function(BuildContext)> creators,
    required this.child,
    this.key,
  }): this.creators = List.of(creators);

  @override
  ViewModelProviderState createState() => ViewModelProviderState(
    creators: creators,
    child: child,
    key: key,
  );

  static V of<V extends ViewModel>(BuildContext context) {
    final store = context.dependOnInheritedWidgetOfExactType<ViewModelStore>();
    //print("store = $store");
    if(store == null) {
      throw "No _ViewModelStore in BuildContext $context";
    }
    return store.getViewModel(context);
    /*
    final vms = store._viewModels;
    //print("vms = $vms");
    V? vm = vms.firstWhereOrNull((it) => it.runtimeType == V) as V?;
    //print("vm = $vm");
    if(vm == null) {
      final creators = store._viewModelCreators;
      //print("creators = $creators");
      int i = vms.length -1;
      int creatorsLen = creators.length;
      while(++i < creatorsLen) {
        //print("while creatorsLen = $creatorsLen i = $i");
        final newVm = creators[i](context);
        vms.add(newVm);
        if(newVm.runtimeType == V) {
          vm = newVm as V;
          break;
        }
      }
      //print("vm AKHIR = $vm");
      if(vm == null) {
        throw "No ViewModel type '$V' in BuildContext $context";
      }
    }
    return vm;
     */
  }
}

class ViewModelProviderState extends State<ViewModelProvider> {
  final List<ViewModel Function(BuildContext)> creators;
  final Widget child;
  final Key? key;
  List<ViewModel> _viewModels = [];

  ViewModelProviderState({
    required this.creators,
    required this.child,
    this.key,
  });

  T? getCachedViewModel<T extends ViewModel>() {
    prind("_ViewModelProviderState.getCachedViewModel() T= '$T' _viewModels= $_viewModels");
    return _viewModels.firstWhereOrNull((it) => it.runtimeType == T) as T?;
  }


  @override
  void dispose() {
    prind("_ViewModelProviderState.dispose _viewModels= $_viewModels");
    for(final vm in _viewModels) {
      vm._dispose();
    }
    _viewModels.clear();
    creators.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelStore(
      viewModelCreators: creators,
      viewModels: _viewModels,
      child: child,
      key: key,
    );
  }
}