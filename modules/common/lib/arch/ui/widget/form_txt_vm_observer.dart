import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/widget/txt_input.dart';
import 'package:common/res/string/_string.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_multi_observer.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  FormTxtVmObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.onSubmit,
    this.onPreSubmit
  });

  @override
  FormTxtVmObserverState<B> createState() => FormTxtVmObserverState(
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
  );
}
class FormTxtVmObserverState<B extends FormTxtVmMixin>
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

  FormTxtVmObserverState({
    required this.submitBtnBuilder,
    required this.preSubmitBtnBuilder,
    required this.onSubmit,
    required this.onPreSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<B>(context);
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
    super.dispose();
  }
}