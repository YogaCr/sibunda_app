import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_group.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/enums.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_controller.dart';

class FormVmGroupObserver<VM extends FormVmGroup> extends StatefulWidget {
  /// The [bool] in its parameter is for representation of [FormTxtVm.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;
  final EdgeInsets? submitBtnMargin;

  /// The [String] in its parameter is for async key from [FormTxtVm.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  /// The [String] in its parameter is for async key from [AsyncVm.doPostAsyncTask].
  final Widget? Function(BuildContext, String)? postSubmitBtnBuilder;

  /// The [String] in its parameter is for async key from [AsyncVm.doOnFailTask].
  final Widget? Function(BuildContext, String, Fail, Widget disabledSubmitBtn)? onFailSubmitBtnBuilder;

  /// This will be called after [Vm.submit] method is called.
  /// This callback parameter `true` if the [Vm.submit] is success.
  final void Function(BuildContext, bool isSuccess)? onSubmit;
  /// This will be called right before [Vm.submit] method is called.
  /// For this callback parameter:
  ///   `true` means [Vm] can proceed to submit the form.
  ///   `false` means there still some invalid form fields.
  ///   `null` means the form is still in initial state.
  final void Function(BuildContext, bool? canProceed)? onPreSubmit;

  /// This will be called when [VM] is ready.
  /// This returns true, then new form will be displayed.
  final bool Function()? predicate;

  /// If somehow [FormVmGroupMixin.submit] doesn't use [FormVmGroupMixin.submitFormKey]
  /// for the key, then programmer can define custom key so that this widget can
  /// harness the power of [AsyncVmObserver.preAsyncBuilder].
  final Set<String>? submissionKeys;

  final bool showHeader;
  /// Just like [showHeader], but for each group. Its keys are index of group.
  /// Note that [showHeader] has higher privilege, so if [showHeader] is false,
  /// then this property has no effect.
  final Map<int, bool>? showHeaderMap;

  /// Flag whether 'all' fields this [FormVmGroupObserver] will build is enabled or not.
  final bool enabled;
  final Widget? Function(int group, String key, MutableLiveData data)? pickerIconBuilder;

  final VM? vm;
  final FormGroupInterceptor? interceptor;
  final RelativePosition imgPosition;

  FormVmGroupObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.postSubmitBtnBuilder,
    this.onFailSubmitBtnBuilder,
    this.onSubmit,
    this.onPreSubmit,
    this.predicate,
    this.submissionKeys,
    this.submitBtnMargin,
    this.vm,
    this.imgPosition = RelativePosition.below,
    this.showHeader = true,
    this.enabled = true,
    this.showHeaderMap,
    this.interceptor,
    this.pickerIconBuilder,
  });

  @override
  _FormVmGroupObserverState<VM> createState() => _FormVmGroupObserverState<VM>(
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    postSubmitBtnBuilder: postSubmitBtnBuilder,
    onFailSubmitBtnBuilder: onFailSubmitBtnBuilder,
    onSubmit: onSubmit,
    onPreSubmit: onPreSubmit,
    predicate: predicate,
    submissionKeys: submissionKeys,
    submitBtnMargin: submitBtnMargin,
    vm: vm,
    imgPosition: imgPosition,
    showHeader: showHeader,
    showHeaderMap: showHeaderMap,
    enabled: enabled,
    interceptor: interceptor,
    pickerIconBuilder: pickerIconBuilder,
  );
}

class _FormVmGroupObserverState<VM extends FormVmGroup>
    extends State<FormVmGroupObserver>
    implements Expirable
{
  /// The [bool] in its parameter is for representation of [FormVmGroup.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;
  final EdgeInsets? submitBtnMargin;

  /// The [String] in its parameter is for async key from [AsyncVm.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  /// The [String] in its parameter is for async key from [AsyncVm.doPostAsyncTask].
  final Widget? Function(BuildContext, String)? postSubmitBtnBuilder;

  /// The [String] in its parameter is for async key from [AsyncVm.doOnFailTask].
  final Widget? Function(BuildContext, String, Fail, Widget disabledSubmitBtn)? onFailSubmitBtnBuilder;

  /// This will be called after [Vm.submit] method is called.
  /// This callback parameter `true` if the [Vm.submit] is success.
  final void Function(BuildContext, bool isSuccess)? onSubmit;
  /// This will be called right before [Vm.submit] method is called.
  /// For this callback parameter:
  ///   `true` means [Vm] can proceed to submit the form.
  ///   `false` means there still some invalid form fields.
  ///   `null` means the form is still in initial state.
  final void Function(BuildContext, bool? canProceed)? onPreSubmit;

  /// This will be called when [VM] is ready.
  /// This returns true, then new form will be displayed.
  final bool Function()? predicate;

  /// If somehow [FormVmGroupMixin.submit] doesn't use [FormVmGroupMixin.submitFormKey]
  /// for the key, then programmer can define custom key so that this widget can
  /// harness the power of [AsyncVmObserver.preAsyncBuilder].
  final Set<String>? submissionKeys;

  final bool showHeader;
  /// Just like [showHeader], but for each group. Its keys are index of group.
  /// Note that [showHeader] has higher privilege, so if [showHeader] is false,
  /// then this property has no effect.
  final Map<int, bool>? showHeaderMap;

  /// Flag whether 'all' fields this [FormVmGroupObserver] will build is enabled or not.
  final bool enabled;
  final Widget? Function(int group, String key, MutableLiveData data)? pickerIconBuilder;

  VM? vm;
  final FormGroupInterceptor? interceptor;
  final RelativePosition imgPosition;

  _FormVmGroupObserverState({
    required this.submitBtnBuilder,
    required this.preSubmitBtnBuilder,
    required this.postSubmitBtnBuilder,
    required this.onFailSubmitBtnBuilder,
    required this.onSubmit,
    required this.onPreSubmit,
    required this.predicate,
    required this.submissionKeys,
    required this.submitBtnMargin,
    required this.vm,
    required this.imgPosition,
    required this.showHeader,
    required this.showHeaderMap,
    required this.enabled,
    required this.interceptor,
    required this.pickerIconBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final vm = this.vm ??= ViewModelProvider.of<VM>(context);

    final Widget? Function(BuildContext, bool?) builder = (ctx, isReady) {
      //prind("$runtimeType builder  vm.isFormReady = ${vm.isFormReady.value}");
      if(isReady == true) {
        final fieldGroupDataList = vm.fieldGroupList;
        interceptor?.value = fieldGroupDataList;
        final formGroupList = List<Widget>.generate(fieldGroupDataList.length, (i) {
          return Container(
            child: LiveDataObserver<FormUiGroupData>(
              liveData: fieldGroupDataList[i],
              builder: (ctx, formGroupData) => formGroupData != null
                  ? FormGenericGroup(
                vm: vm,
                groupData: formGroupData,
                groupPosition: i,
                imgPosition: imgPosition,
                showHeader: showHeader && (showHeaderMap?[i] ?? true),
                enabled: enabled,
                interceptor: interceptor?[i],
                pickerIconBuilder: pickerIconBuilder,
              ): defaultLoading(),
            ),
          );
        });

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: formGroupList,
        );
      } else {
        //If for form is not ready yet.
        return defaultLoading();
      }
    };
/*
    if(interceptor != null) {
      vm.isFormReady.observe(interceptor!, (isReady) {
        prind("vm.isFormReady.observe(interceptor!) isReady = $isReady");
        if(isReady == true) {
          interceptor!.value = vm.fieldGroupList;
        }
        //else { interceptor!.disposeAllControllers(); }
      });
    }
 */

    final formAreaWidget = LiveDataObserver<bool>(
      liveData: vm.isFormReady,
      predicate: (isReady) =>
          isReady != true // This will make this LiveDataObserver display loading widget when the form is not ready.
            || predicate?.call() != false, // This will make this LiveDataObserver display form when form is ready or predicate is null.
      initBuilder: (ctx) {
        //prind("$runtimeType initBuilder vm.isFormReady = ${vm.isFormReady.value}");

        Widget? widget;
        if(vm.isFormReady.value == true && predicate?.call() != false) {
          widget = builder(ctx, true);
        }

        return widget ?? defaultLoading();
      }, // So this LiveDataObserver is not forced to build widget via `builder` although the `predicate` says no.
      builder: builder,
    );

    final submitBtnWrapperBuilder = (BuildContext ctx, bool? canProceed) {
      final child = InkWell(
        child: submitBtnBuilder(ctx, canProceed),
        onTap: () {
          //print("SignUpPage.onTap() submit canProceed= $canProceed");
          onPreSubmit?.call(ctx, canProceed);
          if(canProceed == true) {
            vm.submit();
          } else if(vm.isFormEnabled.value == true) {
            vm.displayInvalidFields();
          }
        },
      );

      return submitBtnMargin == null ? child : Container(
        margin: submitBtnMargin,
        child: child,
      );
    };

    final outerChildren = <Widget>[
      formAreaWidget,
      MultiLiveDataObserver<bool>(
        liveDataList: [vm.isFormReady, vm.isFormEnabled,],
        predicate: predicate == null ? null : (bools) => predicate!.call(),
        builder: (ctx, bools) => boolAll(bools) ? Container(
          margin: EdgeInsets.only(top: 10,),
          child: AsyncVmObserver<VM, bool>(
            vm: vm,
            liveDataGetter: (vm) => vm.canProceed,
            distinctUntilChanged: true,
            builder: submitBtnWrapperBuilder,
            preAsyncBuilder: preSubmitBtnBuilder ?? (ctx, key) {
              prind("FormVmGroupObserver preAsyncBuilder key= $key submissionKeys= $submissionKeys submissionKeys?.contains(key)= ${submissionKeys?.contains(key)} key == FormVmGroupMixin.submitFormKey => ${key == FormVmGroupMixin.submitFormKey}");
              if(submissionKeys?.contains(key) == true
                || key == FormVmGroupMixin.submitFormKey) {
                return defaultLoading();
              }
            },
            postAsyncBuilder: postSubmitBtnBuilder ?? (ctx, key) {
              if(submissionKeys?.contains(key) == true
                  || key == FormVmGroupMixin.submitFormKey) {
                return submitBtnWrapperBuilder(ctx, true) /* Off course true after successfully sent data */;
              }
            },
            onFailBuilder: (ctx, key, fail) {
               if(submissionKeys?.contains(key) == true
                  || key == FormVmGroupMixin.submitFormKey) {
                 final disabledSubmitBtn = submitBtnWrapperBuilder(ctx, false);
                 return onFailSubmitBtnBuilder?.call(ctx, key, fail, disabledSubmitBtn)
                    ?? disabledSubmitBtn;
               }
            },
          ),
        ) : defaultEmptyWidget(),
      ),
    ];

    vm.onSubmit.observe(this, (result) {
      if(result != null) {
        onSubmit?.call(context, result is Success<String>);
      }
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
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