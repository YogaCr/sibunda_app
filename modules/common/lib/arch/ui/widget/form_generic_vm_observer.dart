import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_generic_item.dart';

class FormGenericVmObserver<Vm extends FormGenericVmMixin> extends StatefulWidget {
  /// The [bool] in its parameter is for representation of [FormTxtVm.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormTxtVm.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  final void Function(bool)? onSubmit;

  /// Its keys are keys of [FormGenericVm.keyLabelList].
  final Map<String, MutableLiveData> itemLiveDatas = {};

  FormGenericVmObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.onSubmit,
  });

  @override
  _FormGenericVmObserverState<Vm> createState() => _FormGenericVmObserverState<Vm>(
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
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

  final void Function(bool)? onSubmit;

  /// Its keys are keys of [FormGenericVm.keyLabelList].
  final Map<String, MutableLiveData> itemLiveDatas = {};

  _FormGenericVmObserverState({
    required this.submitBtnBuilder,
    required this.preSubmitBtnBuilder,
    required this.onSubmit,
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
                final txtLiveData = MutableChangeNotifLiveData<String>(
                  txtControl,
                  getNotif: (notif) => txtControl.text,
                  setNotif: (notif, data) => txtControl.text = data ?? "",
                  isNotifierOwner: true,
                );
                itemLiveDatas[key] = txtLiveData;

                field = LiveDataObserver<bool>(
                  liveData: vm.isResponseValidList[i],
                  builder: (ctx, isValid) => TxtInput(
                    label: keyLabelList[i].item2,
                    textController: txtControl,
                    errorText: (isValid == false && !vm.isResponseInit(i))
                        ? vm.getInvalidMsg(key, txtControl.text)
                        : null,
                  ),
                );
                final answer = (itemData as FormUiTxt).answer;
                if(answer != null) {
                  txtControl.text = answer;
                }
                break;
              case FormType.radio:
                final selectedAnswerIndex = (itemData as FormUiRadio).selectedAnswer;
                final selectedAnswer = selectedAnswerIndex != null
                    ? itemData.answerItems[selectedAnswerIndex]
                    : null;

                //final isValid = vm.isResponseValidList[i];
                final groupValue = MutableLiveData(selectedAnswer);
                itemLiveDatas[key] = groupValue;

                field = RadioGroup(
                  itemData: itemData,
                  isValid: vm.isResponseValidList[i],
                  invalidMsgGenerator: (response) => vm.getInvalidMsg(key, groupValue.value),
                  groupValueLiveData: groupValue,
                );
                break;
              case FormType.check:
                final selectedAnswerIndices = MutableLiveData<Set<int>>((itemData as FormUiCheck).selectedAnswers);
                itemLiveDatas[key] = selectedAnswerIndices;

                field = CheckGroup(
                  itemData: itemData,
                  isValid: vm.isResponseValidList[i],
                  invalidMsgGenerator: (response) => vm.getInvalidMsg(key, selectedAnswerIndices.value),
                  selectedIndicesLiveData: selectedAnswerIndices,
                );
/*
                fieldBuilder_old = (ctx, isValid) {
                  final optionWidgetList = <Widget>[];

                  final selectedAnswerIndices = MutableLiveData<Set<int>>((itemData as FormUiCheck).selectedAnswers);
                  itemLiveDatas[keyLabelList[i].item1] = selectedAnswerIndices;

                  for(int i = 0; i < itemData.answerItems.length; i++) {
                    final i2 = i;
                    final option = itemData.answerItems[i];
                    optionWidgetList.add(
                      ListTile(
                        title: Text(option),
                        leading: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: LiveDataObserver<Set<int>>(
                            distinctUtilChanged: false,
                            liveData: selectedAnswerIndices,
                            builder: (ctx, data) => Checkbox(
                              value: selectedAnswerIndices.value!.contains(i2),
                              onChanged: (isSelected) {
                                print("CheckBox i2 = $i2 isSelected= $isSelected");
                                if(isSelected == true) {
                                  selectedAnswerIndices.value!.add(i2);
                                } else {
                                  selectedAnswerIndices.value!.remove(i2);
                                }
                                selectedAnswerIndices.notifyObservers();
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  final optionsWidget = Column(
                    children: optionWidgetList,
                  );

                  return Column(
                    children: [
                      Text(itemData.question),
                      optionsWidget,
                    ],
                  );
                };
 */
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