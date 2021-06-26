part of 'form_vm.dart';

mixin LateFormVmMixin implements FormVmMixin {
  bool get isFormReady;
  @protected
  Future<List<Tuple2<String, String>>> getKeyLabelList();
}

abstract class LateFormVm extends FormVm with LateFormVmMixin {
  LateFormVm({
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }) : super(
    keyLabelList: [],
    defaultInvalidMsg: defaultInvalidMsg,
  );

  @override
  bool get isFormReady => _keyLabelList != null;

  /// The [Tuple2] format is (KEY, LABEL).
  List<Tuple2<String, String>>? _keyLabelList;

  /// The [Tuple2] format is (KEY, LABEL).
  @override
  List<Tuple2<String, String>> get keyLabelList {
    initKeyLabelList();
    return _keyLabelList!;
  }

  @nonVirtual
  List<MutableLiveData<bool>>? _mIsResponseValidList;
  @override
  List<MutableLiveData<bool>> get _isResponseValidList {
    initKeyLabelList();
    return _mIsResponseValidList!;
  }

  @nonVirtual
  List<MutableLiveData<dynamic>>? _mResponseList;
  @override
  List<MutableLiveData<dynamic>> get _responseList {
    _assertReady();
    return _mResponseList!;
  }
/*
  @nonVirtual
  List<bool>? _mIsResponseInitList;
  @override
  List<bool> get _isResponseInitList {
    _assertReady();
    return _mIsResponseInitList!;
  }
*/

  @protected
  void _assertReady() {
    if(!isFormReady) {
      throw "`_keyLabelList == null`, so this '$runtimeType' is not ready yet for form building";
    }
  }

  @mustCallSuper
  void initKeyLabelList() {
    getKeyLabelList().then((keyLabelList) {
      _keyLabelList = keyLabelList;
      _mIsResponseValidList = List.generate(keyLabelList.length, (index) => MutableLiveData(false));
      _mResponseList = List.generate(keyLabelList.length, (index) => MutableLiveData());
      //_mIsResponseInitList = List.generate(keyLabelList.length, (index) => true);
      onKeyLabelListInit(keyLabelList);
    });
  }

  /// Called when the first value of [_keyLabelList] arrived.
  void onKeyLabelListInit(List<Tuple2<String, String>> newKeyLabelList) {}

  @override
  @protected
  Future<List<Tuple2<String, String>>> getKeyLabelList();
}


abstract class LateFormTxtVm extends LateFormVm with FormTxtVmMixin {
  LateFormTxtVm({
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }): super(
    defaultInvalidMsg: defaultInvalidMsg,
  );

  List<TextEditingController>? _txtControllerList;
  @override
  List<TextEditingController> get txtControllerList {
    _assertReady();
    return _txtControllerList!;
  }

  /// Called when the first value of [_keyLabelList] arrived.
  @override
  void onKeyLabelListInit(List<Tuple2<String, String>> newKeyLabelList) {
    _txtControllerList = List.generate(newKeyLabelList.length, (index) => TextEditingController());
    final txtControllerList = _txtControllerList!;
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
}


abstract class LateFormGenericVm extends LateFormVm with FormGenericVmMixin {
  LateFormGenericVm({
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }): super(
    defaultInvalidMsg: defaultInvalidMsg,
  );

  bool get isFormReady => super.isFormReady && _itemDataList != null;

  List<FormUiData>? _itemDataList;
  @override
  List<FormUiData> get itemDataList {
    _assertReady();
    return _itemDataList!;
  }

  void initKeyLabelList() {
    super.initKeyLabelList();
    getItemDataList().then((itemDataList) {
      _itemDataList = itemDataList;
      if(_keyLabelList != null) {
        _assertItemDataCount();
      }
     });
  }

  /// Called when the first value of [_keyLabelList] arrived.
  @override
  void onKeyLabelListInit(List<Tuple2<String, String>> newKeyLabelList) {
    if(_itemDataList != null) {
      _assertItemDataCount();
    }
  }

  void _assertItemDataCount() {
    if(_itemDataList?.length != _keyLabelList?.length) {
      throw "`_itemDataList?.length != _keyLabelList?.length`";
    }
  }

  @protected
  Future<List<FormUiData>> getItemDataList();
}