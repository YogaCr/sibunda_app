import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/collections.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/range.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';
import 'package:tuple/tuple.dart';


class ChildFormVm extends FormAuthVmGroup {
  static const saveBatchChildrenKey = "saveBatchChildren";

  ChildFormVm({
    BuildContext? context,
    //required SaveChildData saveChildData,
    required SaveChildrenData saveChildrenData,
    required GetCurrentEmail getCurrentEmail,
    required this.childCount,
  }):
    //_saveChildData = saveChildData,
    _saveChildrenData = saveChildrenData,
    _getCurrentEmail = getCurrentEmail, super(context: context)
  {
    _currentPage.observe(this, (page) {
      Map<String, dynamic>? map;
      if(page != null) {
        //await _saveCurrentResponses(saveIncompleteResponses: canProceed.value != true);
        final child = _children.value![page];
        if(child != null) {
          map = child.toJson;
          map[Const.KEY_BIRTH_PLACE] = _birthPlaces.value![page];
          map[Const.KEY_BIRTH_DATE] = parseDate(map[Const.KEY_BIRTH_DATE]);
          map[Const.KEY_JKN_START_DATE] = parseDate(map[Const.KEY_JKN_START_DATE]);
        } else {
          final incompleteResponses = _currentIncompleteResponses.value![page];
          if(incompleteResponses != null) {
            map = incompleteResponses;
          }
        }
      }
      //prind("_currentPage.observe map= $map");
      resetResponses();
      if(map != null) {
        patchResponse([map]);
        //return;
      }
    }, distinctUntilChanged: true,);
    childCount.observe(this, (count) {
      if(count != null) {
        if(count < 0) {
          throw "Can't have negative `count`";
        }
        final childList = _children.value ??= [];
        final cityList = _birthPlaces.value ??= [];
        final incompleteResponses = _currentIncompleteResponses.value ??= [];
        setListSize(childList, count);
        setListSize(cityList, count);
        setListSize(incompleteResponses, count);
      }
    });
    if(childCount.value != null) {
      childCount.notifyObservers();
    }
    init();
  }
  //final SaveChildData _saveChildData; //Now, we use `SaveChildrenData` for batch saving
  final SaveChildrenData _saveChildrenData;
  final GetCurrentEmail _getCurrentEmail;
/*
  int? _childCount;
  int get childCount {
    if(_childCount == null) {
      throw "`childCount` is not initialized";
    }
    return _childCount!;
  }
  set childCount(v) {
    if(_childCount != null) {
      throw "`childCount` can only be initialized once";
    }
    _children = MutableLiveData(List.generate(v, (index) => null));
    _childCount = v;
  }
 */

  int? _pageInParent;
  int? get pageInParent => _pageInParent;
  final LiveData<int> childCount;

  //void Function()? onActiveInParent;

  //TODO: <tag>ChildFromVM</tag>
  final MutableLiveData<int> _currentPage = MutableLiveData();
  LiveData<int> get currentPage => _currentPage;

  final MutableLiveData<List<Map<String, dynamic>?>> _currentIncompleteResponses = MutableLiveData();
  final MutableLiveData<List<Child?>> _children = MutableLiveData();
  final MutableLiveData<List<IdStringModel?>> _birthPlaces = MutableLiveData();

  final MutableLiveData<bool> _onSaveBatch = MutableLiveData(false);
  LiveData<bool> get onSaveBatch => _onSaveBatch;

  //LiveData<List<Child>> get children => _children;

  @override
  List<LiveData> get liveDatas => [_currentPage, _children, _onSaveBatch,];


  bool checkPageActiveInParent(int page, { bool force = false }) {
    if(force || _pageInParent == null) {
      _pageInParent = page;
    }
    return page == _pageInParent;
  }

  void initPage(int page, { bool force = false }) {
    prind("initPage page= $page _currentPage= $_currentPage force= $force");
    if(!force && page == _currentPage.value) return;
    //final currPage = _currentPage.value;
    if(_currentPage.value != null) {
      _saveCurrentResponses(saveIncompleteResponses: canProceed.value != true);
    }
    _currentPage.value = page;
  }

  @override
  Set<String>? get mappedKey => {
    Const.KEY_BIRTH_PLACE,
    Const.KEY_BIRTH_DATE,
    Const.KEY_JKN_START_DATE,
    Const.KEY_CHILD_ORDER,
  };
  @override
  mapResponse(int groupPosition, String key, response) {
    switch(key) {
      case Const.KEY_CHILD_ORDER:
        final i = tryParseInt(response);
        if(i != null) {
          return i;
        }
        throw "Can't parse `response` of '$response' to `int`";
      case Const.KEY_BIRTH_PLACE:
        if(response is IdStringModel) {
          return response.id;
        }
        throw "Expected type of response with `key` of '$key' is `IdStringModel`";
      case Const.KEY_JKN_START_DATE:
      case Const.KEY_BIRTH_DATE:
        if(response is DateTime) {
          return response.toString();
        }
        throw "Expected type of response with `key` of '$key' is `DateTime`";
    }
    return super.mapResponse(groupPosition, key, response);
  }

  @override
  Future<Result<String>> doSubmitJob() => _saveCurrentResponses(
    saveIncompleteResponses: false,
  );

  Future<Result<String>> _saveCurrentResponses({
    bool saveIncompleteResponses = false,
  }) async {
    prind("_saveCurrentResponses() _currentPage = $_currentPage saveIncompleteResponses= $saveIncompleteResponses");
    if(saveIncompleteResponses) {
      _currentIncompleteResponses.value![_currentPage.value!] = getRawResponseMap();
      return Success("ok");
    }
    try {
      final txtMap = getResponseMap();
      final data = Child.fromJson(txtMap);
      _children.value![_currentPage.value!] = data;
      _birthPlaces.value![_currentPage.value!] = responseGroupList[0][Const.KEY_BIRTH_PLACE]!.response.value as IdStringModel?;
      //final res = await _saveChildData(data, _currentPage.value!); //.then<Result<String>>((value) => );
      return Success("ok");
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(msg: "Error submitting in `$runtimeType`", error: e);
    }
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(childFormData);

  @override
  String getResponseStringRepr(int groupPosition, String inputKey, response) {
    if(groupPosition == 0) {
      switch(inputKey) {
        case Const.KEY_BIRTH_PLACE: return (response as IdStringModel?)?.name ?? "";
      }
    }
    return super.getResponseStringRepr(groupPosition, inputKey, response);
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    prind("ChildFormVm groupPosition= $groupPosition inputKey= $inputKey response= $response");
    switch(inputKey) {
      case Const.KEY_CHILD_ORDER: return tryParseInt(response) != null;
    }
    return super.validateField(groupPosition, inputKey, response);
  }

  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey) {
      case Const.KEY_CHILD_ORDER: return Strings.field_must_be_number;
    }
    return defaultInvalidMsg;
  }

  void saveBatchChildren() {
    if(_currentPage.value != childCount.value! -1) {
      throw "`currentPage` is '${_currentPage.value}' and total children count (`pageCount`) is '$childCount'.\n"
            "There are still some `Child`s with no data.\n"
            "Thus, can't save batch all `Child`s";
    }
    if(_children.value!.any((e) => e == null)) {
      throw "`_children.value` can't have any null value";
    }
    startJob(saveBatchChildrenKey, (isActive) async {
      final emailRes = await _getCurrentEmail();
      Fail? fail;
      if(emailRes is Success<String>) {
        final email = emailRes.data;
        final newList = _children.value!.map<Child>((e) => e!).toList(growable: false);
        final res = await _saveChildrenData(
          data: newList,
          email: email,
        );
        if(res is Success<bool>) {
          _onSaveBatch.value = res.data;
          return null;
        }
        fail = (res as Fail<bool>);
      } else {
        fail = (emailRes as Fail<String>);
      }
      return fail;
    });
  }
}

/*
class ChildFormVm extends FormTxtVm {
  ChildFormVm(this._useCase) : super(keyLabelList: [
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_CHILD_ORDER, Strings.child_order),
    Tuple2(Const.KEY_GENDER, Strings.gender),
    Tuple2(Const.KEY_BIRTH_CERT_NO, Strings.birth_cert_no),
    Tuple2(Const.KEY_JKN_START_DATE, Strings.jkn_start_date),
    Tuple2(Const.KEY_BABY_COHORT_REG, Strings.baby_cohort_no),
    Tuple2(Const.KEY_TODDLER_COHORT_REG, Strings.toddler_cohort_no),
    Tuple2(Const.KEY_HOSPITAL_MEDIC_NO, Strings.hospital_medic_no),
  ]);
  
  final SaveChildData _useCase;
  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getResponseMap(mappedKey: {Const.KEY_CHILD_ORDER}, mapper: (key, txt) => int.parse(txt));
    final data = Child.fromJson(txtMap);
    return await _useCase(data).then<Result<String>>((value) => value is Success<bool> ? Success("") : value as Fail<String>);
  }

  @override
  Future<bool> validateField(String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_CHILD_ORDER: return int.tryParse(response) != null;
    }
    return response.isNotEmpty;
  }
}
 */