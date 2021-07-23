part of 'form_vm_observer.dart';


//TODO: FormVmObserver: Ganti ketergantungan observer menjadi pada model, bkn ViewModel. Misal, kelas ini membutuhkan [ViewModel.keyLabelList], maka pindahakan keyLabelList dkk ke model tersendiri, bkn pada kelas ViewModel.
class FormGenericVmObserver<Vm extends FormGenericVmMixin> extends StatefulWidget {
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

  /// Its keys are keys of [FormGenericVm.keyLabelList].
  final Map<String, MutableLiveData> itemLiveDatas = {};
  final Vm? vm;

  FormGenericVmObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.onSubmit,
    this.onPreSubmit,
    this.vm,
  });

  @override
  _FormGenericVmObserverState<Vm> createState() => _FormGenericVmObserverState<Vm>(
    vm: vm,
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
  );
}

class _FormGenericVmObserverState<Vm extends FormGenericVmMixin>
    extends State<FormGenericVmObserver<Vm>>
    implements Expirable
{
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

  /// Its keys are keys of [FormGenericVm.keyLabelList].
  final Map<String, MutableLiveData> itemLiveDatas = {};
  Vm? vm;

  _FormGenericVmObserverState({
    required this.submitBtnBuilder,
    required this.preSubmitBtnBuilder,
    required this.onSubmit,
    required this.onPreSubmit,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final vm = this.vm ??= ViewModelProvider.of<Vm>(context);
    final keyLabelList = vm.keyLabelList;

    final formWidgets = List<Widget>.generate(
      keyLabelList.length,
          (i) {
            final key = keyLabelList[i].item1;
            Widget field;
            //Widget Function(BuildContext, bool?)? fieldBuilder_old;
            final itemData = vm.itemDataList[i];
            switch(itemData.type) {
              case FormType.text:
                final txtControl = TextEditingController();
                final txtLiveData = MutableLiveData<String>();
                itemLiveDatas[key] = txtLiveData;

                field = TxtField(
                  itemData: itemData as FormUiTxt,
                  isValid: vm.isResponseValidList[i],
                  invalidMsgGenerator: (response) => vm.getInvalidMsg(key, txtLiveData.value),
                  responseLiveData: txtLiveData,
                );

                vm.registerField(i, field as SibFormField);

                final answer = itemData.answer;
                if(answer != null) {
                  txtControl.text = answer;
                }
                break;
              case FormType.radio:
                //final isValid = vm.isResponseValidList[i];
                final groupValue = MutableLiveData<String>();
                itemLiveDatas[key] = groupValue;

                field = RadioGroup(
                  itemData: itemData as FormUiRadio,
                  isValid: vm.isResponseValidList[i],
                  invalidMsgGenerator: (response) => vm.getInvalidMsg(key, groupValue.value),
                  groupValueLiveData: groupValue,
                );

                vm.registerField(i, field as SibFormField);

                final selectedAnswerIndex = itemData.selectedAnswer;
                if(selectedAnswerIndex != null) {
                  groupValue.value = itemData.answerItems[selectedAnswerIndex];
                }
                break;
              case FormType.check:
                final selectedAnswerIndices = MutableLiveData<Set<int>>({});
                itemLiveDatas[key] = selectedAnswerIndices;

                field = CheckGroup(
                  itemData: itemData as FormUiCheck,
                  isValid: vm.isResponseValidList[i],
                  invalidMsgGenerator: (response) => vm.getInvalidMsg(key, selectedAnswerIndices.value),
                  selectedIndicesLiveData: selectedAnswerIndices,
                );

                vm.registerField(i, field as SibFormField);
                final selectedAnswers = itemData.selectedAnswers;

                if(selectedAnswers.isNotEmpty) {
                  selectedAnswerIndices.value = selectedAnswers;
                }
                break;
              case FormType.imgPick:
                final imgController = MutableLiveData<ImgData>();
                itemLiveDatas[key] = imgController;

                //final enabled = this.enabled && itemData.isInputEnabled;
                //interceptor?.isEnabled = enabled;

                field = ImgPickerField(
                  itemData: itemData as FormUiImgPicker,
                  isValid: vm.isResponseValidList[i],
                  //isEnabledController: vm.isFormEnabled,
                  invalidMsgGenerator: (response) => vm.getInvalidMsg(key, imgController.value),
                  imgController: imgController,
                  //enabled: enabled,
                  //controller: interceptor as FieldController<Set<int>>?,
                );
                /*
                vmLiveData.observe(this, (data) {
                  imgController.value = data;
                });
                 */

                vm.registerField(i, field as SibFormField,);
                break;
            }

            return Container(
              margin: EdgeInsets.all(10),
              child: field,
            );
          },
    );

    final submitBtn = AsyncVmObserver<Vm, bool>(
      vm: vm,
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
    for(final ld in itemLiveDatas.values) {
      ld.dispose();
    }
  }
}



class LateFormGenericVmObserver<Vm extends LateFormGenericVmMixin>
    extends FormGenericVmObserver<Vm> {

  final Widget Function(BuildContext)? onVmNotReadyBuilder;

  LateFormGenericVmObserver({
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
  _LateFormGenericVmObserverState<Vm> createState() => _LateFormGenericVmObserverState<Vm>(
    onVmNotReadyBuilder: onVmNotReadyBuilder,
    vm: vm,
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
  );
}

class _LateFormGenericVmObserverState<Vm extends LateFormGenericVmMixin>
    extends _FormGenericVmObserverState<Vm> {

  final Widget Function(BuildContext) onVmNotReadyBuilder;
  Vm? _vm;

  Vm? get vm => _vm;
  set vm(v) {
    if(v != null) {
      _addOnReadyCallbackToVm(v);
    }
    _vm = v;
  }

  _LateFormGenericVmObserverState({
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