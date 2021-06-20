import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';

abstract class FormVm extends AsyncVm {

  /// The [Tuple2] format is (KEY, LABEL).
  final List<Tuple2<String, String>> txtKeyLabelList;
  final List<TextEditingController> txtControllerList;
  final List<bool> _isTxtInitList;
  final List<MutableLiveData<bool>> _isTxtValidList;
  final MutableLiveData<bool> _canProceed = MutableLiveData(false);
  final MutableLiveData<Result<String>> _onSubmit = MutableLiveData();

  //List<LiveData<bool>> get isTxtValidList => _isTxtValidList;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<Result<String>> get onSubmit => _onSubmit;
  List<LiveData<bool>> get isTxtValidList => _isTxtValidList;

  FormVm(
      List<Tuple2<String, String>> txtKeyLabelList,
  ):
      this.txtKeyLabelList = List.unmodifiable(txtKeyLabelList),
      txtControllerList = List.generate(txtKeyLabelList.length, (index) => TextEditingController(), growable: false),
      _isTxtValidList = List.generate(txtKeyLabelList.length, (index) => MutableLiveData(false), growable: false),
        _isTxtInitList = List.generate(txtKeyLabelList.length, (index) => true, growable: false)
  {
    for(int i = 0; i < _isTxtValidList.length; i++) {
      final isTxtValid = _isTxtValidList[i];
      isTxtValid.observe(this, (isValid) {
        _checkCanProceed();
      },
        //distinctUntilChanged: true,
        tag: "FormBloc_$i",
      );
      final txtControl = txtControllerList[i];
      txtControl.addListener(() {
        if(_isTxtInitList[i]) {
          _isTxtInitList[i] = false;
          return;
        }
        final pair = txtKeyLabelList[i];
        validateTxt(pair.item1, txtControl.text).then((isValid) {
          //print("FormBloc.validateTxt().then() pair= $pair txtControl.text= ${txtControl.text} isValid = $isValid _isTxtInitList[i]= ${_isTxtInitList[i]}");
          if(!_isTxtInitList[i] && isValid && _isTxtValidList[i].value == isValid) {
            return;
          }
          _isTxtValidList[i].value = isValid;
        });
      });
    }
  }

  void _checkCanProceed() {
    for(int i = 0; i < _isTxtValidList.length ; i++) {
      final isTxtValid = _isTxtValidList[i];
      final isTxtInit = _isTxtInitList[i];
      if(!isTxtValid.value! || isTxtInit) {
        _canProceed.value = false;
        return;
      }
    }
    _canProceed.value = true;
  }

  bool isTxtInit(int position) => _isTxtInitList[position];

  TextEditingController getTxtController(String key) {
    final i = txtKeyLabelList.indexWhere((it) => it.item1 == key);
    if(i < 0) {
      throw "No such TextEditingController with key $key in this $runtimeType";
    }
    return txtControllerList[i];
  }

  Map<String, dynamic> getTxtMap({
    Set<String>? mappedKey,
    dynamic Function(String key, String txt)? mapper
  }) {
    final result = <String, dynamic>{};
    if(mappedKey == null || mapper == null) {
      for(int i = 0; i < txtKeyLabelList.length; i++) {
        final key = txtKeyLabelList[i].item1;
        final txtControl = txtControllerList[i];
        result[key] = txtControl.text;
      }
    } else {
      for(int i = 0; i < txtKeyLabelList.length; i++) {
        final key = txtKeyLabelList[i].item1;
        final txtControl = txtControllerList[i];
        if(mappedKey.contains(key)) {
          result[key] = mapper(key, txtControl.text);
        } else {
          result[key] = txtControl.text;
        }
      }
    }
    return result;
  }

  void submit(){
    doSubmitJob().then((value) {
      _onSubmit.value = value;
    });
  }
  Future<Result<String>> doSubmitJob();
  Future<bool> validateTxt(String inputKey, String txt);

  @override
  void dispose() {
    super.dispose();
    for(final txtControl in txtControllerList) {
      txtControl.dispose();
    }
  }

  @override
  List<LiveData> get liveDatas {
    final list = <LiveData>[];
    list.addAll(_isTxtValidList);
    list.add(_canProceed);
    return list;
  }
}
