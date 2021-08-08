import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/ui.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/expirable.dart';
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
      _observeIsValid(
        context: _context!,
        expirable: this,
      );
      _observeError(
        context: _context!,
        expirable: this,
      );
      addOnFailTask(this, _getOnFail(
        context: _context!,
        isAutoToastOnFail: isAutoToastOnFail,
        skippedKeyToToastOnFail: skippedKeyToToastOnFail,
        type: runtimeType,
      ));
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
      _observeIsValid(
        context: _context!,
        expirable: this,
      );
      _observeError(
        context: _context!,
        expirable: this,
      );
      addOnFailTask(this, _getOnFail(
        context: _context!,
        isAutoToastOnFail: isAutoToastOnFail,
        skippedKeyToToastOnFail: skippedKeyToToastOnFail,
        type: runtimeType,
      ));
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
      _observeIsValid(
        context: _context!,
        expirable: this,
      );
      _observeError(
        context: _context!,
        expirable: this,
      );
      addOnFailTask(this, _getOnFail(
        context: _context!,
        isAutoToastOnFail: isAutoToastOnFail,
        skippedKeyToToastOnFail: skippedKeyToToastOnFail,
        type: runtimeType,
      ));
      /*
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
        if(VarDi.isSessionValid.value == true
            && isAutoToastOnFail
            && (skippedKeyToToastOnFail == null || !skippedKeyToToastOnFail!.contains(key))
        ) {
          showToast(msg: msg, bgColor: red, textColor: white, len: Toast.LENGTH_LONG);
          showErrorPopup(context: _context!, error: failure.copy(msg: msg),);
          //Fluttertoast.showToast(msg: msg, backgroundColor: red, toastLength: Toast.LENGTH_LONG);
        }
        //showSnackBar(_context!, failure.toString());
      },);
       */
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



void _observeIsValid({
  required Expirable expirable,
  required BuildContext context,
}) {
  VarDi.isSessionValid.observe(expirable, (valid) async {
    if(valid != true) {
      showSnackBar(context, Strings.session_expired, duration: Duration(milliseconds: 2500,),);
      await UseCaseDi.obj.clearUserData();
      await UseCaseDi.obj.toLoginPage(context: context);
    }
  });
}
void _observeError({
  required Expirable expirable,
  required BuildContext context,
  //required BuildContext context,
  bool isAutoToastOnError = ConfigUtil.isAutoErrorExposureEnabled,
}) {
  VarDi.error.observe(expirable, (error) async {
    //final msg = "Error when call async task in VM `$type`, `key` = '$key', `failure` = '$failure'";
    //prine(msg);
    if(error != null) {
      /*
      final msg = "Error outside async `Fail` catcher";
      prine("=========== $msg ===========");
      prine(error);
      prine("=========== $msg =========== end");
       */

      if(isAutoToastOnError) {
        final msg = "Error outside async `Fail` catcher";
        final failure = Fail.fromError(
          details: error,
          msg: msg,
        );
        showErrorPopup(context: context, error: failure,);
      }
    }
  });
  VarDi.isSessionValid.observe(expirable, (valid) async {
    prind("VarDi.isSessionValid.observe valid= $valid");
    if(valid == false) { //This will make `null` as initial state, not unauthenticated.
      showSnackBar(context, Strings.session_expired);
      await UseCaseDi.obj.clearUserData();
      await UseCaseDi.obj.toLoginPage(context: context);
      Future.delayed(Duration(milliseconds: 200), () {
        VarDi.isSessionValid.value = null;
      });
    }
  });
}
void Function(String, Fail) _getOnFail({
  required BuildContext context,
  required bool isAutoToastOnFail,
  required Set<String>? skippedKeyToToastOnFail,
  required Type type,
}) => (String key, Fail failure) {
  final msg = "Error when call async task in VM `$type`, `key` = '$key', `failure` = '$failure'";
  prine(msg);
  if(VarDi.isSessionValid.value != false // when some async process failed because of unauthenticated, then don't show error popup.
      && isAutoToastOnFail
      && (skippedKeyToToastOnFail == null || !skippedKeyToToastOnFail.contains(key))
  ) {
    showToast(msg: msg, bgColor: red, textColor: white, len: Toast.LENGTH_LONG);
    showErrorPopup(context: context, error: failure.copy(msg: msg),);
    //Fluttertoast.showToast(msg: msg, backgroundColor: red, toastLength: Toast.LENGTH_LONG);
  }
  //showSnackBar(_context!, failure.toString());
};