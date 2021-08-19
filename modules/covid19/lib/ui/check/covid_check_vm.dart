import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:covid19/core/domain/usecase/covid_check_usecase.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class CovidCheckVm extends FormAuthVmGroup {
  CovidCheckVm({
    BuildContext? context,
    required GetCovidMotherCheckFormData getCovidMotherCheckFormData,
    required GetCovidBabyCheckFormData getCovidBabyCheckFormData,
    required SubmitCovidMotherCheckForm submitCovidMotherCheckForm,
    required SubmitCovidBabyCheckForm submitCovidBabyCheckForm,
    required GetMotherNik getMotherNik,
    //required GetBabyNik getBabyNik,
    required GetBornBabyList getBornBabyList,
  }):
    _getCovidMotherCheckFormData = getCovidMotherCheckFormData,
    _getCovidBabyCheckFormData = getCovidBabyCheckFormData,
    _submitCovidMotherCheckForm = submitCovidMotherCheckForm,
    _submitCovidBabyCheckForm = submitCovidBabyCheckForm,
    _getMotherNik = getMotherNik,
    _getBornBabyList = getBornBabyList, super(context: context)
  {
    onSubmit.observe(this, (success) {
      if(success is Success<String>) {
        setFormEnabled(isEnabled: false);
      }
    });
    //WidgetsBinding.instance.addObserver(observer)
    isFormReady.observe(this, (ready) {
      if(ready == true && !isMother) {
        getResponseLiveDataWithKey(Const.KEY_BABY_NAME).observe(this, (babyIdString) {
          if(babyIdString != null) {
            final babyList = _babyList.value;
            if(babyList != null) {
              final selected = babyList.firstWhereOrNull((e) => e.id == babyIdString.id);
              if(selected != null) {
                _selectedBaby.value = selected;
              }
            }
          } else {
            _selectedBaby.value = null;
          }
        }, tag: toString());
      }
    }, tag: toString());
  }
  final GetCovidMotherCheckFormData _getCovidMotherCheckFormData;
  final GetCovidBabyCheckFormData _getCovidBabyCheckFormData;
  final SubmitCovidMotherCheckForm _submitCovidMotherCheckForm;
  final SubmitCovidBabyCheckForm _submitCovidBabyCheckForm;
  final GetMotherNik _getMotherNik;
  //final GetBabyNik _getBabyNik;
  final GetBornBabyList _getBornBabyList;
  //final GetUnbornBabyList _getUnbornBabyList;
/*
  final MutableLiveData<List<FormUiGroupData>> _formDataList = MutableLiveData();
  LiveData<List<FormUiGroupData>> get formDataList => _formDataList;
 */

  final MutableLiveData<FormWarningStatus> _result = MutableLiveData();
  LiveData<FormWarningStatus> get result => _result;

  final MutableLiveData<List<BabyOverlayData>> _babyList = MutableLiveData();
  LiveData<List<BabyOverlayData>> get babyList => _babyList;

  final MutableLiveData<BabyOverlayData> _selectedBaby = MutableLiveData();
  LiveData<BabyOverlayData> get selectedBaby => _selectedBaby;

  late bool isMother;
  String? _motherNik;

  @override
  List<LiveData> get liveDatas => [_result, _babyList, _selectedBaby,];

  @override
  Set<String>? get mappedKey => null;
  @override
  mapResponse(int groupPosition, String key, response) {
    if(key == Const.KEY_BABY_NAME) {
      if(response is IdStringModel) {
        return response.id;
      }
      return parseInt(response);
    }
    return getBinaryAnswerYesNoInt(response);
  }

  @override
  String getResponseStringRepr(int groupPosition, String inputKey, response) {
    if(inputKey == Const.KEY_BABY_NAME && response is IdStringModel) {
      return response.name;
    }
    return super.getResponseStringRepr(groupPosition, inputKey, response);
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    String? nik;
    if(isMother) {
      if(_motherNik != null) {
        nik = _motherNik;
      } else {
        final res = await _getMotherNik();
        if(res is Success<String>) {
          nik = res.data;
        }
      }
    } else {
      nik = selectedBaby.value?.nik;
    }

    if(nik == null) {
      throw "`nik` is still null";
    }

    //final nik = res1.data;
    final groupIndex = isMother ? 0 : 1;
    final data = getResponse().responseGroups.values
        .toList()[groupIndex].map((key, value) => MapEntry(parseInt(key), value));
    final res2 = isMother
        ? await _submitCovidMotherCheckForm(nik, data)
        : await _submitCovidBabyCheckForm(nik, data);

    prind("CovidCheckVm.doSubmitJob() res2 = $res2 nik = $nik data = $data");

    if(res2 is Success<FormWarningStatus>) {
      final data = res2.data;
      _result.value = data;
      return Success("ok");
    }
    return Fail(msg: "Fail submitting Covid check form");
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    final res = isMother
        ? await _getCovidMotherCheckFormData()
        : await _getCovidBabyCheckFormData();
    if(res is Success<List<FormGroupData>>) {
      if(!isMother) {
        if(_motherNik == null) {
          final nikRes = await _getMotherNik();
          if(nikRes is Success<String>) {
            final nik = nikRes.data;
            _motherNik = nik;
          } else {
            throw "Can't get mother nik to get born baby list data, e= $nikRes";
          }
        }
        final babyRes = await _getBornBabyList(_motherNik!);
        if(babyRes is Success<List<BabyOverlayData>>) {
          final data = babyRes.data;
          _babyList.value = data;
        } else {
          throw "Can't get born baby list data, e= $babyRes";
        }
      }
      final data = res.data;
      return data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);
    }
    return List.empty();
  }
}