import 'package:common/util/text.dart';
import 'package:common/util/times.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> setTextForTextController(
  TextEditingController controller,
  any, {
    bool skipIfNull = true,
    void Function()? afterChanged,
  }
) async {
  prind("setTextForTextController() any= $any any?.runtimeType= ${any?.runtimeType}");
  String? str;
  switch(any?.runtimeType) {
    case String: str = any;
      break;
    case DateTime:
      str = await formatTime(any);
/*
      .then((str) {
        prind("setTextForTextController() str= $str afterChanged == null => ${afterChanged == null}");
        controller.text = str;
        afterChanged?.call();
      });
 */
      return;
    default:
      if(skipIfNull && any == null) {
        afterChanged?.call();
        return;
      }
      str = any?.toString() ?? "";
  }
  prind("setTextForTextController() str= $str afterChanged == null => ${afterChanged == null} AKHIR DW");
  if(str != null) {
    controller.text = str;
    afterChanged?.call();
  }
}

String getTextForTextController(any, { BuildContext? context }) {
  //prind("setTextForTextController() any= $any any?.runtimeType= ${any?.runtimeType}");
  if(any is String) return any;
  if(any is DateTime) return syncFormatTime(any);
  if(any is TimeOfDay) {
    if(context == null) {
      return "${toIntDuoStr(any.hour)}:${toIntDuoStr(any.minute)}";
    }
    return any.format(context);
  }
  return any?.toString() ?? "";
}