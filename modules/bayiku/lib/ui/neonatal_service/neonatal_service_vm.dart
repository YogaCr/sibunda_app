import 'package:bayiku/core/domain/usecase/baby_neonatal_usecase.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

class NeonatalServiceVm extends FormAuthVmGroup {
  static const getAnswerKey = "getAnswer";

  NeonatalServiceVm({
    BuildContext? context,
    required this.monthlyCheckUpId,
    required SaveNeonatalForm saveNeonatalForm,
    required GetNeonatalFormData getNeonatalFormData,
    required GetNeonatalFormAnswer getNeonatalFormAnswer,
  }):
    _saveNeonatalForm = saveNeonatalForm,
    _getNeonatalFormData = getNeonatalFormData,
    _getNeonatalFormAnswer = getNeonatalFormAnswer, super(context: context)
  {
    _formAnswer.observe(this, (data) {
      if(data != null) {
        final mappedData = data.map((key, value) {
          if(key.startsWith("q_") && !key.startsWith("q_kuning")) {
            return MapEntry(key, getBinaryAnswerHaveNotStr(value));
          }
          return MapEntry(key, value);
        });
        //final map = <String, dynamic>{};
        if(data.keys.any((k) => k.startsWith("q_kuning"))) {
          final qKuningKeys = <String>{};
          final checkSet = <int>{};
          mappedData["q_kuning"] = checkSet;
          int i = 0;
          for(final e in data.entries) {
            if(e.key.startsWith("q_kuning")) {
              qKuningKeys.add(e.key);
              if(e.value == 1) {
                checkSet.add(i);
              }
              i++;
            }
          }
          for(final kuningKey in qKuningKeys) {
            mappedData.remove(kuningKey);
          }
        }
        patchResponse([mappedData]);
        setFormEnabled(isEnabled: false);
      } else {
        resetResponses();
        setFormEnabled(isEnabled: true);
      }
    });
    isFormReady.observe(this, (isReady) {
      if(isReady == true) {
        getAnswer(forceLoad: true);
      }
    });
  }
  final SaveNeonatalForm _saveNeonatalForm;
  final GetNeonatalFormData _getNeonatalFormData;
  final GetNeonatalFormAnswer _getNeonatalFormAnswer;

  final MutableLiveData<Map<String, dynamic>> _formAnswer = MutableLiveData();

  final MutableLiveData<int> _currentPage = MutableLiveData();
  LiveData<int> get currentPage => _currentPage;
  final BabyFormId monthlyCheckUpId;

  @override
  List<LiveData> get liveDatas => [_formAnswer, _currentPage,];


  void initFormInPage({
    required int page,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _currentPage.value == page) return;
    _currentPage.value = page;
    init(isOneShot: false);
  }

  @override
  Set<String>? get mappedKey => null;
  @override
  mapResponse(int groupPosition, String key, response) {
    if(key.startsWith("q_") && key != "q_kuning") {
      return getBinaryAnswerHaveNotInt(response as String);
    }
    if(response is DateTime) return response.toString();
    if(response is TimeOfDay) return timeOfDayToString(response);
    return super.mapResponse(groupPosition, key, response);
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    final map = getResponseMap();
    if(map.containsKey("q_kuning")) {
      final kuningSet = map["q_kuning"] as Set<int>;
      for(int i = 0; i < 5; i++) { //For now, 'kuning' until 5.
        map["q_kuning${i+1}"] = kuningSet.contains(i) ? 1 : 0;
      }
      map.remove("q_kuning");
    }
    map["monthly_checkup_id"] = monthlyCheckUpId.checkUpId;
    prind("NeonatalServiceVm.doSubmitJob() map = $map");
    final res = await _saveNeonatalForm(
      page: _currentPage.value!,
      formData: map,
    );
    if(res is Success<bool>) {
      final data = res.data;
      if(data) {
        return Success("ok");
      }
    }
    return Fail();
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    final res = await _getNeonatalFormData(_currentPage.value!);
    if(res is Success<List<FormGroupData>>) {
      final data = res.data;
      return formDataListToUi(data);
    }
    return List.empty();
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) {
    switch(_currentPage.value) {
      case 0: return neonatal6HourFormValidator(defaultValidator: super.validateField)(groupPosition, inputKey, response);
      case 1: return neonatalKn1FormValidator(defaultValidator: super.validateField)(groupPosition, inputKey, response);
      case 2: return neonatalKn2FormValidator(defaultValidator: super.validateField)(groupPosition, inputKey, response);
      case 3: return neonatalKn3FormValidator(defaultValidator: super.validateField)(groupPosition, inputKey, response);
    }
    return super.validateField(groupPosition, inputKey, response);
  }


  @protected
  void getAnswer({ bool forceLoad = false }) {
    prind("Neonatal Vm getAnswer() forceLoad= $forceLoad _formAnswer= $_formAnswer");
    if(!forceLoad && _formAnswer.value != null) return;
    startJob(getAnswerKey, (isActive) async {
      final res = await _getNeonatalFormAnswer(
        page: _currentPage.value!,
        yearId: monthlyCheckUpId.yearId,
        month: monthlyCheckUpId.month,
      );
      prind("Neonatal Vm getAnswer() res= $res");
      if(res is Success<Map<String, dynamic>?>) {
        final map = res.data;
        _formAnswer.value = map;
      }
    });
  }
}