import 'package:aa_cob/cob_element.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_generic_field.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CobField extends SibFormField {

  @override
  StatelessElement createElement() => CobStatelessElement(
    widget: this,
    liveData: responseLiveData as MutableLiveData,
  );
  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return LiveDataObserver<String>(
      liveData: responseLiveData,
      builder: (ctx, str) {
        prind("CobField str = $str");
        return str != null
            ? Text(str)
            : defaultLoading();
      },
    );
  }

  @override
  final LiveData<bool> isValid = MutableLiveData(false);

  @override
  final LiveData<String> responseLiveData = MutableLiveData();
}