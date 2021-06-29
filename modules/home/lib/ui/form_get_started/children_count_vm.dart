import 'package:common/util/times.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';

class ChildrenCountVm extends AsyncVm {
  ChildrenCountVm() {
    _init();
  }

  //final MutableLiveData<DateTime> _lastChildBirthDate = MutableLiveData();

  final TextEditingController lastChildBirthDateTxtControl = TextEditingController();

  final MutableLiveData<DateTime> lastChildBirthDate = MutableLiveData();

  @override
  List<LiveData> get liveDatas => [lastChildBirthDate];

  void _init() {
    lastChildBirthDate.observe(this, (date) {
      if(date != null) {
        formatTime(date).then((str) =>
          lastChildBirthDateTxtControl.text = str
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    lastChildBirthDateTxtControl.dispose();
  }
}