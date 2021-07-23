import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/img_widget.dart';
import 'package:common/arch/ui/widget/txt_input.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_generic_field.dart';

part 'form_generic_vm_observer.dart';
part 'form_txt_vm_observer.dart';

mixin FormVmObserver {
  LiveData<List<FormUiData>> get fieldData;

  /// The [bool] in its parameter is for representation of [FormTxtVm.canProceed].
  Widget Function(BuildContext, bool?) get submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormTxtVm.doPreAsyncTask].
  Widget? Function(BuildContext, String)? get preSubmitBtnBuilder;

  /// This will be called after [Vm.submit] method is called.
  /// This callback parameter `true` if the [Vm.submit] is success.
  void Function(bool isSuccess)? get onSubmit;
  /// This will be called right before [Vm.submit] method is called.
  /// For this callback parameter:
  ///   `true` means [Vm] can proceed to submit the form.
  ///   `false` means there still some invalid form fields.
  ///   `null` means the form is still in initial state.
  void Function(bool? canProceed)? get onPreSubmit;
}