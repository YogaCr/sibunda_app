import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/widget/form_generic_field.dart';
import 'package:common/res/string/_string.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';
import 'package:collection/collection.dart';

part 'form_vm_late.dart';
/*
abstract class FormTxtVm extends AsyncVm {
  static const submitFormKey = "submitForm";

  /// The [Tuple2] format is (KEY, LABEL).
  final List<Tuple2<String, String>> txtKeyLabelList;
  final List<TextEditingController> txtControllerList;
  final List<bool> _isTxtInitList;
  final List<MutableLiveData<FormTxtFieldState>> _fieldStateList;
  //final List<MutableLiveData<bool>> _isTxtValidList;
  final MutableLiveData<bool> _canProceed = MutableLiveData(false);
  final MutableLiveData<Result<String>> _onSubmit = MutableLiveData();

  //List<LiveData<bool>> get isTxtValidList => _isTxtValidList;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<Result<String>> get onSubmit => _onSubmit;
  //List<LiveData<bool>> get isTxtValidList => _isTxtValidList;
  List<LiveData<FormTxtFieldState>> get fieldStateList => _fieldStateList;

  FormTxtVm(
      List<Tuple2<String, String>> txtKeyLabelList,
  ):
      this.txtKeyLabelList = List.unmodifiable(txtKeyLabelList),
      txtControllerList = List.generate(txtKeyLabelList.length, (index) => TextEditingController(), growable: false),
      //_isTxtValidList = List.generate(txtKeyLabelList.length, (index) => MutableLiveData(false), growable: false),
      _fieldStateList = List.generate(txtKeyLabelList.length, (index) => MutableLiveData(FormTxtFieldState(text: "", isValid: false)), growable: false),
        _isTxtInitList = List.generate(txtKeyLabelList.length, (index) => true, growable: false)
  {
    for(int i = 0; i < txtKeyLabelList.length; i++) {
      final fieldState = _fieldStateList[i];
      fieldState.observe(this, (isValid) {
        _checkCanProceed();
      },
        //distinctUntilChanged: true,
        tag: "FormVm_$i",
      );
/*
      final isTxtValid = _isTxtValidList[i];
      isTxtValid.observe(this, (isValid) {
        _checkCanProceed();
      },
        //distinctUntilChanged: true,
        tag: "FormBloc_$i",
      );
 */
      final txtControl = txtControllerList[i];
      txtControl.addListener(() {
        if(_isTxtInitList[i]) {
          _isTxtInitList[i] = false;
          return;
        }
        final pair = txtKeyLabelList[i];
        final newText = txtControl.text;
        validateTxt(pair.item1, newText).then((isValid) {
          //print("FormBloc.validateTxt().then() pair= $pair txtControl.text= ${txtControl.text} isValid = $isValid _isTxtInitList[i]= ${_isTxtInitList[i]}");
          if(!_isTxtInitList[i] && isValid && fieldState.value!.isValid == isValid) {
            return;
          }
          fieldState.value = fieldState.value!.copy(isValid: isValid);
          //_isTxtValidList[i].value = isValid;
        });
      });
    }
  }

  void _checkCanProceed() {
    for(int i = 0; i < _fieldStateList.length ; i++) {
      final fieldState = _fieldStateList[i];
      final isTxtInit = _isTxtInitList[i];
      if(!fieldState.value!.isValid || isTxtInit) {
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
    startJob(submitFormKey, (isActive) async {
      doSubmitJob().then((value) {
        _onSubmit.value = value;
      });
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
    list.addAll(_fieldStateList);
    list.add(_canProceed);
    return list;
  }
}
 */

//TODO: gmn caranya biar child widget pada form (TxtInput, RadioGroup, atau CHeckGroup) bisa ngakses responseList, namun aman dari jangkauan tangan (class) tak bertanggung jawab.
mixin FormVmMixin implements AsyncVm {
  //List<String> get keyList;

  /// The [Tuple2] format is (KEY, LABEL).
  List<Tuple2<String, String>> get keyLabelList;

  List<MutableLiveData<bool>> get _isResponseValidList;
  List<MutableLiveData<dynamic>> get _responseList;
  //List<bool> get _isResponseInitList;
  MutableLiveData<bool> get _canProceed;
  MutableLiveData<Result<String>> get _onSubmit;

  List<LiveData<bool>> get isResponseValidList => _isResponseValidList;
  List<LiveData<dynamic>> get responseList => _responseList;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<Result<String>> get onSubmit => _onSubmit;

  String defaultInvalidMsg = "not valid";

  bool isResponseInit(int position) => _isResponseValidList[position].value != null;
  Map<String, dynamic> getResponseMap({
    Set<String>? mappedKey,
    dynamic Function(String key, dynamic response)? mapper
  });

  void registerField(int position, SibFormField field) {
    field.responseLiveData.observe(this, (data) {
      //print("registerField() position= $position data= $data field.responseLiveData= ${field.responseLiveData}");
      _responseList[position].value = data;
    }, tag: "FormVmMixin.registerField() $position",);
  }

  void _checkCanProceed();
  void submit();
  Future<Result<String>> doSubmitJob();
  Future<bool> validateField(String inputKey, dynamic response);
  String getInvalidMsg(String inputKey, dynamic response) => defaultInvalidMsg;
  int getKeyIndex(String inputKey) => keyLabelList.indexWhere((element) => element.item1 == inputKey);
}



abstract class FormVm
    extends AsyncVm
    with FormVmMixin
{
  static const submitFormKey = "submitForm";
/*
  @override
  final List<String> keyList;
 */

  /// The [Tuple2] format is (KEY, LABEL).
  @override
  final List<Tuple2<String, String>> keyLabelList;
  @override
  final List<MutableLiveData<bool>> _isResponseValidList;
  @override
  final List<MutableLiveData<dynamic>> _responseList;
  @override
  final MutableLiveData<bool> _canProceed = MutableLiveData(false);
  @override
  final MutableLiveData<Result<String>> _onSubmit = MutableLiveData();
  //@override
  //final List<bool> _isResponseInitList;
  @override
  final String defaultInvalidMsg;

  FormVm({
    required List<Tuple2<String, String>> keyLabelList,
    this.defaultInvalidMsg = Strings.field_can_not_be_empty,
  }):
    this.keyLabelList = List.unmodifiable(keyLabelList),
    //_isResponseInitList = List.generate(keyLabelList.length, (index) => true, growable: false),
    _isResponseValidList = List.generate(keyLabelList.length, (index) => MutableLiveData(), growable: false),
    _responseList = List.generate(keyLabelList.length, (index) => MutableLiveData(), growable: false)
  {
    for(int i = 0; i < keyLabelList.length; i++) {
      final isResponseValid = _isResponseValidList[i];
      final response = _responseList[i];
      final fieldKey = keyLabelList[i].item1;
      response.observe(this, (data) {
        //print("_responseList[$i] data= $data response= $response _isResponseInitList[i]= ${_isResponseInitList[i]}");
/*
        if(_isResponseInitList[i]) {
          _isResponseInitList[i] = false;
          return;
        }
 */
        validateField(fieldKey, data).then((isValid) {
          //print("_responseList[$i] validateField() fieldKey= $fieldKey data= $data isValid= $isValid");
          isResponseValid.value = isValid;
        });
      },
        //distinctUntilChanged: true,
        tag: "FormVm_$i",
      );
      isResponseValid.observe(this, (isValid) {
        _checkCanProceed();
      },
        tag: "FormVm_$i",
      );
    }
  }

  void _checkCanProceed() {
    for(int i = 0; i < _isResponseValidList.length ; i++) {
      final isResponseValid = _isResponseValidList[i];
      //final isResponseInit = _isResponseInitList[i];
      if(isResponseValid.value != true) {
        _canProceed.value = false;
        return;
      }
    }
    _canProceed.value = true;
  }

  Map<String, dynamic> getResponseMap({
    Set<String>? mappedKey,
    dynamic Function(String key, dynamic response)? mapper
  }) {
    final result = <String, dynamic>{};
    if(mappedKey == null || mapper == null) {
      for(int i = 0; i < keyLabelList.length; i++) {
        final key = keyLabelList[i].item1;
        result[key] = _responseList[i].value;
      }
    } else {
      for(int i = 0; i < keyLabelList.length; i++) {
        final key = keyLabelList[i].item1;
        final response = _responseList[i].value;
        if(mappedKey.contains(key)) {
          result[key] = mapper(key, response);
        } else {
          result[key] = response;
        }
      }
    }
    return result;
  }

  void submit() {
    startJob(submitFormKey, (isActive) async {
      doSubmitJob().then((value) {
        _onSubmit.value = value;
      });
    });
  }
  Future<Result<String>> doSubmitJob();
  Future<bool> validateField(String inputKey, dynamic response);

  @override
  void dispose(){
    super.dispose();
    for(int i = 0; i < keyLabelList.length; i++) {
      _isResponseValidList[i].dispose();
      _responseList[i].dispose();
    }
    _canProceed.dispose();
    _onSubmit.dispose();
  }
}


mixin FormTxtVmMixin implements FormVmMixin {
  List<TextEditingController> get txtControllerList;
  TextEditingController getTxtController(String key) {
    final index = keyLabelList.indexWhere((element) => element.item1 == key);
    if(index < 0) {
      throw "No such key '$key' in this `$runtimeType`";
    }
    return txtControllerList[index];
  }
}

abstract class FormTxtVm extends FormVm with FormTxtVmMixin {
  FormTxtVm({
    required List<Tuple2<String, String>> keyLabelList,
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }) : txtControllerList = List.generate(keyLabelList.length, (index) => TextEditingController(), growable: false),
  super(
    keyLabelList: keyLabelList,
    defaultInvalidMsg: defaultInvalidMsg,
  ) {
    for(int i = 0; i < txtControllerList.length; i++) {
      final txtControl = txtControllerList[i];
      final response = _responseList[i];
      txtControl.addListener(() {
        if(isActive) {
          response.value = txtControl.text;
        }
      });
    }
  }
  @override
  final List<TextEditingController> txtControllerList;
}

//TODO: FormGenericVmMixin: pikirkan caranya biar bisa data ttg formnya diganti sama [FormGroupData].
mixin FormGenericVmMixin implements FormVmMixin {
  List<FormUiData> get itemDataList;

  /// [response] has 3 cases:
  ///   When [FormType.text] => `String` for answer text,
  ///   When [FormType.radio] => `String` for selected item value,
  ///   When [FormType.check] => `Set<int>` for selected item indices,
  @override
  Future<bool> validateField(String inputKey, dynamic response);
}

abstract class FormGenericVm extends FormVm with FormGenericVmMixin {
  FormGenericVm({
    required List<Tuple2<String, String>> keyLabelList,
    required List<FormUiData> itemDataList,
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }) : //txtControllerList = List.generate(keyLabelList.length, (index) => TextEditingController(), growable: false),
    this.itemDataList = List.unmodifiable(itemDataList),
  super(
    keyLabelList: keyLabelList,
    defaultInvalidMsg: defaultInvalidMsg,
  ) {
    if(keyLabelList.length != itemDataList.length) {
      throw "keyLabelList.length (${keyLabelList.length}) != itemDataList.length (${itemDataList.length})";
    }
/*
    for(int i = 0; i < txtControllerList.length; i++) {
      final txtControl = txtControllerList[i];
      final response = _responseList[i];
      txtControl.addListener(() {
        if(isActive) {
          response.value = txtControl.text;
        }
      });
    }
 */
  }
  //final List<TextEditingController> txtControllerList;
  @override
  final List<FormUiData> itemDataList;

  /// [response] has 3 cases:
  ///   When [FormType.text] => `String` for answer text,
  ///   When [FormType.radio] => `String` for selected item value,
  ///   When [FormType.check] => `Set<int>` for selected item indices,
  @override
  Future<bool> validateField(String inputKey, dynamic response);
}



/*
abstract class FormVm2 extends AsyncVm {
  static const submitFormKey = "submitForm";

  final List<String> keyList;
  final List<MutableLiveData<bool>> _isAnswerValidList;
  final MutableLiveData<bool> _canProceed = MutableLiveData(false);
  final MutableLiveData<Result<String>> _onSubmit = MutableLiveData();

  String defaultInvalidMsg = "not valid";


  /// The [Tuple2] format is (KEY, LABEL).
  final List<Tuple2<String, String>> txtKeyLabelList;
  final List<TextEditingController> txtControllerList;
  final List<bool> _isTxtInitList;
  //final List<MutableLiveData<FormTxtFieldState>> _fieldStateList;
  final List<MutableLiveData<bool>> _isTxtValidList;

  //List<LiveData<bool>> get isTxtValidList => _isTxtValidList;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<Result<String>> get onSubmit => _onSubmit;
  List<LiveData<bool>> get isTxtValidList => _isTxtValidList;
  //List<LiveData<FormTxtFieldState>> get fieldStateList => _fieldStateList;

  FormVm2(
      List<Tuple2<String, String>> txtKeyLabelList,
  ):
      this.txtKeyLabelList = List.unmodifiable(txtKeyLabelList),
      txtControllerList = List.generate(txtKeyLabelList.length, (index) => TextEditingController(), growable: false),
      _isTxtValidList = List.generate(txtKeyLabelList.length, (index) => MutableLiveData(false), growable: false),
      //_fieldStateList = List.generate(txtKeyLabelList.length, (index) => MutableLiveData(FormTxtFieldState(text: "", isValid: false)), growable: false),
        _isTxtInitList = List.generate(txtKeyLabelList.length, (index) => true, growable: false)
  {
    for(int i = 0; i < txtKeyLabelList.length; i++) {
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
        final newText = txtControl.text;
        validateTxt(pair.item1, newText).then((isValid) {
          //print("FormBloc.validateTxt().then() pair= $pair txtControl.text= ${txtControl.text} isValid = $isValid _isTxtInitList[i]= ${_isTxtInitList[i]}");
          if(!_isTxtInitList[i] && isValid && isTxtValid.value == isValid) {
            return;
          }
          isTxtValid.value = isValid;
          //_isTxtValidList[i].value = isValid;
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
    startJob(submitFormKey, (isActive) async {
      doSubmitJob().then((value) {
        _onSubmit.value = value;
      });
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
// */

/*
abstract class FormTxtVm extends AsyncVm {
  static const submitFormKey = "submitForm";

  /// The [Tuple2] format is (KEY, LABEL).
  final List<Tuple2<String, String>> txtKeyLabelList;
  final List<TextEditingController> txtControllerList;
  final List<bool> _isTxtInitList;
  //final List<MutableLiveData<FormTxtFieldState>> _fieldStateList;
  final List<MutableLiveData<bool>> _isTxtValidList;
  final MutableLiveData<bool> _canProceed = MutableLiveData(false);
  final MutableLiveData<Result<String>> _onSubmit = MutableLiveData();

  //List<LiveData<bool>> get isTxtValidList => _isTxtValidList;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<Result<String>> get onSubmit => _onSubmit;
  List<LiveData<bool>> get isTxtValidList => _isTxtValidList;
  //List<LiveData<FormTxtFieldState>> get fieldStateList => _fieldStateList;

  FormTxtVm(
      List<Tuple2<String, String>> txtKeyLabelList,
  ):
      this.txtKeyLabelList = List.unmodifiable(txtKeyLabelList),
      txtControllerList = List.generate(txtKeyLabelList.length, (index) => TextEditingController(), growable: false),
      _isTxtValidList = List.generate(txtKeyLabelList.length, (index) => MutableLiveData(false), growable: false),
      //_fieldStateList = List.generate(txtKeyLabelList.length, (index) => MutableLiveData(FormTxtFieldState(text: "", isValid: false)), growable: false),
        _isTxtInitList = List.generate(txtKeyLabelList.length, (index) => true, growable: false)
  {
    for(int i = 0; i < txtKeyLabelList.length; i++) {
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
        final newText = txtControl.text;
        validateTxt(pair.item1, newText).then((isValid) {
          //print("FormBloc.validateTxt().then() pair= $pair txtControl.text= ${txtControl.text} isValid = $isValid _isTxtInitList[i]= ${_isTxtInitList[i]}");
          if(!_isTxtInitList[i] && isValid && isTxtValid.value == isValid) {
            return;
          }
          isTxtValid.value = isValid;
          //_isTxtValidList[i].value = isValid;
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
    startJob(submitFormKey, (isActive) async {
      doSubmitJob().then((value) {
        _onSubmit.value = value;
      });
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
 */
