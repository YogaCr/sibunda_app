import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_generic_item.dart';

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

  FormGenericVmObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.onSubmit,
    this.onPreSubmit,
  });

  @override
  _FormGenericVmObserverState<Vm> createState() => _FormGenericVmObserverState<Vm>(
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

  _FormGenericVmObserverState({
    required this.submitBtnBuilder,
    required this.preSubmitBtnBuilder,
    required this.onSubmit,
    required this.onPreSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<Vm>(context);
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
    super.dispose();
    for(final key in itemLiveDatas.keys) {
      itemLiveDatas[key]!.dispose();
    }
  }
}