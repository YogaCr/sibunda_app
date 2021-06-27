part of 'form_vm.dart';

mixin LateFormVmMixin implements FormVmMixin {
  bool get isFormReady;
  LiveData<List<Tuple2<String, String>>> get keyLabelListLiveData;
  void addOnReady(void Function() callback);
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

  MutableLiveData<List<Tuple2<String, String>>> _keyLabelListLiveData = MutableLiveData();
  @override
  LiveData<List<Tuple2<String, String>>> get keyLabelListLiveData => _keyLabelListLiveData;

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
  //@mustCallSuper
  void onKeyLabelListInit(List<Tuple2<String, String>> newKeyLabelList) {
    _keyLabelListLiveData.value = newKeyLabelList;
    for(final callback in _onReadyCallbacks) {
      callback();
    }
  }

  /// These will be called once right after this [LateFormVm] is ready.
  /// If this [LateFormVm] is currently ready, then newly added callback
  /// will be called right away.
  final List<void Function()> _onReadyCallbacks = [];
  void addOnReady(void Function() callback) {
    if(isFormReady) {
      callback();
    } else {
      _onReadyCallbacks.add(callback);
    }
  }

  @override
  @protected
  Future<List<Tuple2<String, String>>> getKeyLabelList();

  @override
  void dispose() {
    _onReadyCallbacks.clear();
    super.dispose();
  }
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
    super.onKeyLabelListInit(newKeyLabelList);
  }
}

mixin LateFormGenericVmMixin implements LateFormVmMixin, FormGenericVmMixin {
  LiveData<List<FormUiData>> get fieldDataList;

  @protected
  Future<List<FormUiData>> getItemDataList();
}

abstract class LateFormGenericVm extends LateFormVm with LateFormGenericVmMixin {
  LateFormGenericVm({
    String defaultInvalidMsg = Strings.field_can_not_be_empty,
  }): super(
    defaultInvalidMsg: defaultInvalidMsg,
  );

  bool get isFormReady => super.isFormReady && _itemDataList != null;
  bool _isKeyLabelDownloading = false;
  bool _isItemDataDownloading = false;

  List<FormUiData>? _itemDataList;
  @override
  List<FormUiData> get itemDataList {
    _assertReady();
    return _itemDataList!;
  }
  MutableLiveData<List<FormUiData>> _fieldDataList = MutableLiveData();
  @override
  LiveData<List<FormUiData>> get fieldDataList => _fieldDataList;

  /// Called when the first value of [_keyLabelList] arrived.
  @override
  void onKeyLabelListInit(List<Tuple2<String, String>> newKeyLabelList) {
    _isKeyLabelDownloading = false;
    if(!_isItemDataDownloading) {
      _assertFormDataReady();
    }
    _keyLabelListLiveData.value = newKeyLabelList;
    //super.onKeyLabelListInit(newKeyLabelList);
  }

  void initKeyLabelList() {
    super.initKeyLabelList();
    _getItemDataList().then((itemDataList) {
      _itemDataList = itemDataList;
      _isItemDataDownloading = false;
      if(!_isKeyLabelDownloading) {
        _assertFormDataReady();
      }
      _fieldDataList.value = itemDataList;
     });
  }

  Future<List<Tuple2<String, String>>> _getKeyLabelList() {
    _isKeyLabelDownloading = true;
    return getKeyLabelList();
  }
  Future<List<FormUiData>> _getItemDataList() {
    _isItemDataDownloading = true;
    return getItemDataList();
  }

  void _assertFormDataReady() {
    if(_itemDataList?.length != _keyLabelList?.length) {
      throw "_itemDataList?.length (${_itemDataList?.length} )!= _keyLabelList?.length (${_keyLabelList?.length})";
    }
    // _OnReadyCallbacks are called here because this kind of FormVm
    // needs 2 types of data to be ready:
    //   1. List<Tuple2<String key, String label>>
    //   2. List<FormUiData>
    for(final callback in _onReadyCallbacks) {
      callback();
    }
  }
}