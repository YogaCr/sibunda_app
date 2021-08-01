import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuple/tuple.dart';

import 'form_vm.dart';
import 'form_vm_group.dart';

mixin AuthVm {
  BuildContext? get _context;
  BuildContext? get context => _context;
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
      addOnFailTask(this, (key, failure) {
        final msg = "Error when call async task in VM `$runtimeType`, `key` = '$key', `failure` = '$failure'";
        prine(msg);
        if(isAutoToastOnFail &&
            (skippedKeyToToastOnFail == null || !skippedKeyToToastOnFail!.contains(key))
        ) {
          showToast(msg: msg, bgColor: red, textColor: white, len: Toast.LENGTH_LONG);
          showErrorPopup(context: _context!, error: failure.copy(msg: msg),);
          //Fluttertoast.showToast(msg: msg, backgroundColor: red, toastLength: Toast.LENGTH_LONG);
        }
        //showSnackBar(_context!, failure.toString());
      },);
    }
  }
  bool isAutoToastOnFail = ConfigUtil.isAutoToastEnabled;
  Set<String>? skippedKeyToToastOnFail;
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
      addOnFailTask(this, (key, failure) {
        final msg = "Error when call async task in VM `$runtimeType`, `key` = '$key', `failure` = '$failure'";
        prine(msg);
        if(isAutoToastOnFail &&
            (skippedKeyToToastOnFail == null || !skippedKeyToToastOnFail!.contains(key))
        ) {
          showToast(msg: msg, bgColor: red, textColor: white, len: Toast.LENGTH_LONG);
          showErrorPopup(context: _context!, error: failure.copy(msg: msg),);
          //Fluttertoast.showToast(msg: msg, backgroundColor: red, toastLength: Toast.LENGTH_LONG);
        }
        //showSnackBar(_context!, failure.toString());
      },);
    }
  }
  bool isAutoToastOnFail = ConfigUtil.isAutoToastEnabled;
  Set<String>? skippedKeyToToastOnFail;
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
      addOnFailTask(this, (key, failure) {
        final msg = "Error when call async task in VM `$runtimeType`, `key` = '$key', `failure` = '$failure'";
        prine(msg);
        if(isAutoToastOnFail &&
            (skippedKeyToToastOnFail == null || !skippedKeyToToastOnFail!.contains(key))
        ) {
          showToast(msg: msg, bgColor: red, textColor: white, len: Toast.LENGTH_LONG);
          showErrorPopup(context: _context!, error: failure.copy(msg: msg),);
          //Fluttertoast.showToast(msg: msg, backgroundColor: red, toastLength: Toast.LENGTH_LONG);
        }
        //showSnackBar(_context!, failure.toString());
      },);
    }
  }
  bool isAutoToastOnFail = ConfigUtil.isAutoToastEnabled;
  Set<String>? skippedKeyToToastOnFail;
  @override
  BuildContext? _context;
  @override
  void dispose() {
    _context = null;
    super.dispose();
  }
}