import 'package:common/arch/ui/bloc/form_bloc.dart';
import 'package:common/arch/ui/widget/txt_input.dart';
import 'package:common/res/string/_string.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormVmObserver<B extends FormVm>
    extends StatefulWidget
{
  final bool? Function(int, String)? txtValidator;

  /// Its keys are key to [FormVm.txtKeyLabelList], not the label.
  final Map<String, String>? errorTxtMap;

  /// The [bool] in its parameter is for representation of [FormVm.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormVm.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  final void Function(bool)? onSubmit;

  FormVmObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.txtValidator,
    this.errorTxtMap,
    this.onSubmit,
  });

  @override
  FormVmObserverState<B> createState() => FormVmObserverState(
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    txtValidator: txtValidator,
    errorTxtMap: errorTxtMap,
    onSubmit: onSubmit,
  );
}
class FormVmObserverState<B extends FormVm>
    extends State<FormVmObserver<B>>
    implements Expirable
{
  final bool? Function(int, String)? txtValidator;

  /// Its keys are key to [FormVm.txtKeyLabelList], not the label.
  final Map<String, String>? errorTxtMap;

  /// The [bool] in its parameter is for representation of [FormVm.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormVm.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  final void Function(bool)? onSubmit;

  FormVmObserverState({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.txtValidator,
    this.errorTxtMap,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<B>(context);
    final keyLabelList = vm.txtKeyLabelList;

    final formWidgets = List<Widget>.generate(
      keyLabelList.length,
          (i) => Container(
            margin: EdgeInsets.all(10),
            child: AsyncVmObserver<B, bool>(
              liveDataGetter: (vm2) => vm2.isTxtValidList[i],
              //distinctUntilChanged: true,
              builder: (ctx, isValid) => TxtInput(
                label: vm.txtKeyLabelList[i].item2,
                textController: vm.txtControllerList[i],
                errorText: (isValid == false && !vm.isTxtInit(i)) ? (errorTxtMap?[i] ?? Strings.please_enter_your_name) : null,
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