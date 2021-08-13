import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:common/arch/domain/usecase/family_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';


class FatherFormVm extends FormAuthVmGroup {
  static const getFatherDataKey = "getFatherData";

  FatherFormVm({
    BuildContext? context,
    required SaveFatherData saveFatherData,
    required GetFatherData getFatherData,
    required GetCityById getCityById,
  }):
    _saveFatherData = saveFatherData,
    _getFatherData = getFatherData,
    _getCityById = getCityById, super(context: context,)
  {
    init();
    _fatherData.observe(this, (data) async {
      if(data != null) {
        final map = data.toJson;
        final cityRes = await _getCityById(map[Const.KEY_BIRTH_PLACE]);
        if(cityRes is Success<IdStringModel>) {
          final data = cityRes.data;
          map[Const.KEY_BIRTH_PLACE] = data;
        } else {
          doOnFailTask(getFatherDataKey, cityRes as Fail);
          return;
        }
        patchResponse([map]);
      } else {
        resetResponses();
      }
    }, tag: toString());
  }
  final SaveFatherData _saveFatherData;
  final GetFatherData _getFatherData;
  final GetCityById _getCityById;

  final imgProfile = MutableLiveData<ImgData>();
  final isDataPresent = MutableLiveData<bool>();
  final _fatherData = MutableLiveData<Father>();

  ProfileCredential? _credential;

  @override
  List<LiveData> get liveDatas => [imgProfile, isDataPresent, _fatherData];

  @override
  Set<String>? get mappedKey => {
    Const.KEY_BIRTH_PLACE,
    Const.KEY_BIRTH_DATE,
  };
  @override
  mapResponse(int groupPosition, String key, response) {
    switch(key) {
      case Const.KEY_BIRTH_PLACE:
        if(response is IdStringModel) {
          return response.id;
        }
        throw "Expected type of response with `key` of '$key' is `IdStringModel`";
      case Const.KEY_BIRTH_DATE:
        if(response is DateTime) {
          return response.toString();
        }
        throw "Expected type of response with `key` of '$key' is `DateTime`";
    }
    return super.mapResponse(groupPosition, key, response);
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getResponseMap();
    final data = Father.fromJson(txtMap);
    return await _saveFatherData(data).then<Result<String>>((value) => value is Success ? Success("") : value as Fail<String>);
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(fatherFormData);

  @override
  String getResponseStringRepr(int groupPosition, String inputKey, response) {
    if(groupPosition == 0) {
      switch(inputKey) {
        case Const.KEY_BIRTH_PLACE: return (response as IdStringModel?)?.name ?? "";
      }
    }
    return super.getResponseStringRepr(groupPosition, inputKey, response);
  }

  void getFatherData({
    required ProfileCredential? credential,
    bool forceLoad = false
  }) {
    if(!forceLoad && credential == _credential) return;
    if(credential == null) {
      _credential = null;
      return;
    }
    startJob(getFatherDataKey, (isActive) async {
      final res = await _getFatherData(credential);
      if(res is Success<Father>) {
        _fatherData.value = res.data;
        _credential = credential;
      } else {
        return res as Fail;
      }
    });
  }
/*
  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_SALARY: return double.tryParse(response) != null;
    }
    return response.isNotEmpty;
  }

  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey) {
      case Const.KEY_SALARY: return Strings.field_must_be_number;
    }
    return defaultInvalidMsg;
  }
 */
}

/*
class FatherFormVm extends FormTxtVm {
  FatherFormVm(this._useCase) : super(keyLabelList: [
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_SALARY, Strings.salary),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_FASKES1, Strings.faskes1),
    Tuple2(Const.KEY_FASKES_RUJUKAN, Strings.faskes_rujukan),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_EDUCATION, Strings.education),
    Tuple2(Const.KEY_OCCUPANCY, Strings.occupancy),
    Tuple2(Const.KEY_ADDRESS, Strings.address),
    Tuple2(Const.KEY_PHONE, Strings.phone),
  ]);
  
  final SaveFatherData _useCase;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<bool> validateField(String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_SALARY: return double.tryParse(response) != null;
    }
    return response.isNotEmpty;
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getResponseMap(mappedKey: {Const.KEY_SALARY}, mapper: (key, txt) => double.parse(txt));
    final data = Father.fromJson(txtMap);
    return await _useCase(data).then<Result<String>>((value) => value is Success ? Success("") : value as Fail<String>);
  }
}
 */