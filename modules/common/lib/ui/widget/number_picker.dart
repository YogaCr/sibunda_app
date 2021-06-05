import 'package:common/config/_config.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:flutter/material.dart';

import 'CircleBtn.dart';

class NumberPicker extends StatefulWidget {
  final void Function(int)? onNumberChange;
  final int min;
  final int max;

  NumberPicker({
    this.onNumberChange,
    this.min = 0,
    this.max = 100000,
  });

  @override
  State createState() => NumberPickerState(
    onNumberChange: onNumberChange,
    min: min,
    max: max,
  );
}


class NumberPickerState extends State<NumberPicker> {
  final void Function(int)? onNumberChange;
  int _number = 0;
  final int min;
  final int max;

  NumberPickerState({
    this.onNumberChange,
    required this.min,
    required this.max,
  });


  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    onNumberChange?.call(_number);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Manifest.theme.colorPrimary;
    final disabledColor = Colors.grey;
    final minColor = (_number > min) ? primaryColor : disabledColor;
    final maxColor = (_number < max) ? primaryColor : disabledColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleBtn(
          color: minColor,
          child: Icon(
            Icons.remove,
            color: minColor,
          ),
          onClick: () => _changeNumber(-1),
        ),
        Spacer(),
        Text(_number.toString()),
        Spacer(),
        CircleBtn(
          color: maxColor,
          child: Icon(
            Icons.add,
            color: maxColor,
          ),
          onClick: () => _changeNumber(1),
        ),
      ],
    );
  }

  bool _changeNumber(int change) {
    final changedNumber = _number + change;
    if(changedNumber < min || changedNumber > max) {
      return false;
    } else {
      setState(() => _number = changedNumber);
      return true;
    }
  }
}