import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';

import 'form_vm.dart';
import 'form_vm_group.dart';

mixin AuthVm {
  BuildContext? get _context;
}

abstract class AsyncAuthVm extends AsyncVm with AuthVm {
  AsyncAuthVm({
    BuildContext? context,
  }): _context = context {
    if(_context != null) {
      VarDi.isSessionValid.observe(this, (valid) async {
        if(valid != true) {
          showSnackBar(_context!, Strings.session_expired);
          await UseCaseDi.clearUserData();
          await UseCaseDi.toLoginPage(context: _context!);
        }
      });
    }
  }
  @override
  BuildContext? _context;
  @override
  void dispose() {
    _context = null;
    super.dispose();
  }
}

abstract class FormAuthVm extends FormVm with AuthVm {
  FormAuthVm({
    BuildContext? context,
    required List<Tuple2<String, String>> keyLabelList,
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }): _context = context, super(
    keyLabelList: keyLabelList,
    defaultInvalidMsg: defaultInvalidMsg,
  ) {
    if(_context != null) {
      VarDi.isSessionValid.observe(this, (valid) async {
        if(valid != true) {
          showSnackBar(_context!, Strings.session_expired);
          await UseCaseDi.clearUserData();
          await UseCaseDi.toLoginPage(context: _context!);
        }
      });
    }
  }
  @override
  BuildContext? _context;
  @override
  void dispose() {
    _context = null;
    super.dispose();
  }
}

abstract class FormAuthVmGroup extends FormVmGroup with AuthVm {
  FormAuthVmGroup({
    BuildContext? context,
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }): _context = context, super(
    defaultInvalidMsg: defaultInvalidMsg,
  ) {
    if(_context != null) {
      VarDi.isSessionValid.observe(this, (valid) async {
        if(valid != true) {
          showSnackBar(_context!, Strings.session_expired);
          await UseCaseDi.clearUserData();
          await UseCaseDi.toLoginPage(context: _context!);
        }
      });
    }
  }
  @override
  BuildContext? _context;
  @override
  void dispose() {
    _context = null;
    super.dispose();
  }
}