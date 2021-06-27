import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_group.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormVmGroupObserver<VM extends FormVmGroup> extends StatefulWidget {
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
  final VM? vm;

  FormVmGroupObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.onSubmit,
    this.onPreSubmit,
    this.vm,
  });

  @override
  _FormVmGroupObserverState<VM> createState() => _FormVmGroupObserverState<VM>(
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
    vm: vm,
  );
}

class _FormVmGroupObserverState<VM extends FormVmGroup>
    extends State<FormVmGroupObserver>
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
  VM? vm;

  _FormVmGroupObserverState({
    required this.submitBtnBuilder,
    required this.preSubmitBtnBuilder,
    required this.onSubmit,
    required this.onPreSubmit,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final vm = this.vm ??= ViewModelProvider.of<VM>(context);

    final formAreaWidget = LiveDataObserver<bool>(
      liveData: vm.isFormReady,
      builder: (ctx, isReady) {
        if(isReady == true) {
          final fieldGroupDataList = vm.fieldGroupList;
          final formGroupList = List<Widget>.generate(fieldGroupDataList.length, (i) {
            return Container(
              child: LiveDataObserver<FormUiGroupData>(
                liveData: fieldGroupDataList[i],
                builder: (ctx, formGroupData) => formGroupData != null
                    ? FormGenericGroup(
                      vm: vm,
                      groupData: formGroupData,
                      groupPosition: i,
                    ): defaultLoading(),
              ),
            );
          });

          return Column(
            children: formGroupList,
          );
        } else {
          //If for form is not ready yet.
          return defaultLoading();
        }
      },
    );


    final submitBtn = AsyncVmObserver<VM, bool>(
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

    final outerChildren = <Widget>[
      formAreaWidget,
      Container(
        margin: EdgeInsets.only(top: 10,),
        child: submitBtn,
      ),
    ];

    vm.onSubmit.observe(this, (result) {
      if(result != null) {
        onSubmit?.call(result is Success<String>);
      }
    });

    return Column(
      children: outerChildren,
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