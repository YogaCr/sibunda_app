import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/mother.dart';
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
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';
import 'package:tuple/tuple.dart';


class MotherFormVm extends FormAuthVmGroup {
  static const getMotherDataKey = "getMotherData";

  MotherFormVm({
    BuildContext? context,
    required SaveMotherData saveMotherData,
    required GetMotherData getMotherData,
    required GetCityById getCityById,
  }):
    _saveMotherData = saveMotherData,
    _getMotherData = getMotherData,
    _getCityById = getCityById, super(context: context,)
  {
    init();
    _motherData.observe(this, (data) async {
      if(data != null) {
        final map = data.toJson;
        final cityRes = await _getCityById(map[Const.KEY_BIRTH_PLACE]);
        if(cityRes is Success<IdStringModel>) {
          final data = cityRes.data;
          map[Const.KEY_BIRTH_PLACE] = data;
        } else {
          doOnFailTask(getMotherDataKey, cityRes as Fail);
          return;
        }
        patchResponse([map]);
      } else {
        resetResponses();
      }
    }, tag: toString());
  }
  final SaveMotherData _saveMotherData;
  final GetMotherData _getMotherData;
  final GetCityById _getCityById;

  final imgProfile = MutableLiveData<ImgData>();
  final isDataPresent = MutableLiveData<bool>();
  final _motherData = MutableLiveData<Mother>();

  ProfileCredential? _credential;

  @override
  List<LiveData> get liveDatas => [imgProfile, isDataPresent, _motherData];

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
    prind("MotherFormVm txtMap = $txtMap");
    final data = Mother.fromJson(txtMap);
    return await _saveMotherData(data).then<Result<String>>((value) => value is Success ? Success("") : value as Fail<String>);
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(motherFormData);

  @override
  String getResponseStringRepr(int groupPosition, String inputKey, response) {
    if(groupPosition == 0) {
      switch(inputKey) {
        case Const.KEY_BIRTH_PLACE: return (response as IdStringModel?)?.name ?? "";
      }
    }
    return super.getResponseStringRepr(groupPosition, inputKey, response);
  }

  void getMotherData({
    required ProfileCredential? credential,
    bool forceLoad = false,
  }) {
    if(!forceLoad && credential == _credential) return;
    if(credential == null) {
      _credential = null;
      return;
    }
    startJob(getMotherDataKey, (isActive) async {
      final res = await _getMotherData(credential);
      if(res is Success<Mother>) {
        _motherData.value = res.data;
        _credential = credential;
      } else {
        return res as Fail;
      }
    });
  }
}