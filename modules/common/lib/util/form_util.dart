import 'package:common/util/times.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';

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

String getTextForTextController(any) {
  //prind("setTextForTextController() any= $any any?.runtimeType= ${any?.runtimeType}");
  String? str;
  switch(any?.runtimeType) {
    case String: str = any;
      break;
    case DateTime:
      str = syncFormatTime(any);
      break;
    default:
      str = any?.toString() ?? "";
  }
  //prind("setTextForTextController() str= $str afterChanged == null => ${afterChanged == null} AKHIR DW");
  return str ?? "";
}