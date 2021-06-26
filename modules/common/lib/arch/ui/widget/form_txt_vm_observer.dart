
part of 'form_vm_observer.dart';

class FormTxtVmObserver<B extends FormTxtVmMixin>
    extends StatefulWidget
{
/*
  final bool? Function(int, String)? txtValidator;

  /// Its keys are key to [FormTxtVm.txtKeyLabelList], not the label.
  final Map<String, String>? errorTxtMap;
 */

  /// The [bool] in its parameter is for representation of [FormTxtVm.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormTxtVm.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  /// This will be called after [Vm.submit] method is called.
  /// This callback parameter `true` if the [Vm.submit] is success.
  final void Function(bool isSuccess)? onSubmit;
  /// This will be called right before [Vm.submit] method is called.
  /// For this callback parameter:
  ///   `true` means [Vm] can proceed to submit the form.
  ///   `false` means there still some invalid form fields.
  ///   `null` means the form is still in initial state.
  final void Function(bool? canProceed)? onPreSubmit;
  final B? vm;

  FormTxtVmObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.onSubmit,
    this.onPreSubmit,
    this.vm,
  });

  @override
  _FormTxtVmObserverState<B> createState() => _FormTxtVmObserverState(
    vm: vm,
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
  );
}
class _FormTxtVmObserverState<B extends FormTxtVmMixin>
    extends State<FormTxtVmObserver<B>>
    implements Expirable
{
/*
  final bool? Function(int, String)? txtValidator;

  /// Its keys are key to [FormTxtVm.txtKeyLabelList], not the label.
  final Map<String, String>? errorTxtMap;
 */

  /// The [bool] in its parameter is for representation of [FormTxtVm.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormTxtVm.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  /// This will be called after [Vm.submit] method is called.
  /// This callback parameter `true` if the [Vm.submit] is success.
  final void Function(bool isSuccess)? onSubmit;
  /// This will be called right before [Vm.submit] method is called.
  /// For this callback parameter:
  ///   `true` means [Vm] can proceed to submit the form.
  ///   `false` means there still some invalid form fields.
  ///   `null` means the form is still in initial state.
  final void Function(bool? canProceed)? onPreSubmit;
  B? vm;

  _FormTxtVmObserverState({
    required this.submitBtnBuilder,
    required this.preSubmitBtnBuilder,
    required this.onSubmit,
    required this.onPreSubmit,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final vm = this.vm ??= ViewModelProvider.of<B>(context);
    final keyLabelList = vm.keyLabelList;

    final formWidgets = List<Widget>.generate(
      keyLabelList.length,
          (i) => Container(
            margin: EdgeInsets.all(10),
            child: AsyncVmObserver<B, bool>(
              liveDataGetter: (vm2) => vm2.isResponseValidList[i],
              builder: (ctx, isValid) => TxtInput(
                label: keyLabelList[i].item2,
                textController: vm.txtControllerList[i],
                errorText: (isValid == false)
                    ? vm.getInvalidMsg(keyLabelList[i].item1, vm.txtControllerList[i].text)
                    : null,
              ),
            ),
          ),
    );

    final submitBtn = AsyncVmObserver<B, bool>(
      liveDataGetter: (vm) => vm.canProceed,
      distinctUntilChanged: true,
      builder: (ctx, canProceed) => InkWell(
        child: submitBtnBuilder(ctx, canProceed),
        onTap: () {
          //print("SignUpPage.onTap() submit canProceed= $canProceed");
          onPreSubmit?.call(canProceed);
          if(canProceed == true) {
            vm.submit();
          }
        },
      ),
      preAsyncBuilder: preSubmitBtnBuilder,
    );
    formWidgets.add(
      Container(
        margin: EdgeInsets.only(top: 10,),
        child: submitBtn,
      ),
    );

    vm.onSubmit.observe(this, (result) {
      if(result != null) {
        onSubmit?.call(result is Success<String>);
      }
    });

    return Column(
      children: formWidgets,
    );
  }

  bool _isActive = true;
  @override
  bool get isActive => _isActive;

  @override
  void dispose() {
    _isActive = false;
    vm = null;
    super.dispose();
  }
}




class LateFormTxtVmObserver<Vm extends LateFormTxtVm>
    extends FormTxtVmObserver<Vm> {

  final Widget Function(BuildContext)? onVmNotReadyBuilder;

  LateFormTxtVmObserver({
    this.onVmNotReadyBuilder,
    required Widget Function(BuildContext, bool?) submitBtnBuilder,
    Widget? Function(BuildContext, String)? preSubmitBtnBuilder,
    void Function(bool isSuccess)? onSubmit,
    void Function(bool? canProceed)? onPreSubmit,
    Vm? vm,
  }) : super(
    vm: vm,
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
  );

  @override
  _LateFormTxtVmObserverState<Vm> createState() => _LateFormTxtVmObserverState<Vm>(
    onVmNotReadyBuilder: onVmNotReadyBuilder,
    vm: vm,
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
  );
}

class _LateFormTxtVmObserverState<Vm extends LateFormTxtVm>
    extends _FormTxtVmObserverState<Vm> {

  final Widget Function(BuildContext) onVmNotReadyBuilder;
  Vm? _vm;

  Vm? get vm => _vm;
  set vm(v) {
    if(v != null) {
      _addOnReadyCallbackToVm(v);
    }
    _vm = v;
  }

  _LateFormTxtVmObserverState({
    required Widget Function(BuildContext)? onVmNotReadyBuilder,
    required Widget Function(BuildContext, bool?) submitBtnBuilder,
    required Widget? Function(BuildContext, String)? preSubmitBtnBuilder,
    required Function(bool isSuccess)? onSubmit,
    required Function(bool? canProceed)? onPreSubmit,
    required Vm? vm,
  }): this._vm = vm,
        this.onVmNotReadyBuilder = onVmNotReadyBuilder ?? ((ctx) => defaultImg()),
        super(
        submitBtnBuilder: submitBtnBuilder,
        preSubmitBtnBuilder: preSubmitBtnBuilder,
        onSubmit: onSubmit,
        onPreSubmit: onPreSubmit,
        vm: vm,
      ) {
    if(vm != null) {
      _addOnReadyCallbackToVm(vm);
    }
  }

  void _addOnReadyCallbackToVm(Vm vm){
    vm.addOnReady((){
      if(isActive) {
        setState(() {});
      }
    });
  }

  Widget build(BuildContext context) {
    final vm = this.vm ??= ViewModelProvider.of<Vm>(context);
    if(vm.isFormReady){
      return super.build(context);
    } else {
      return onVmNotReadyBuilder(context);
    }
  }
}