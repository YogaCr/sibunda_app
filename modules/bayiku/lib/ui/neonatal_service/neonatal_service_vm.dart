import 'package:bayiku/core/domain/usecase/baby_neonatal_usecase.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';

class NeonatalServiceVm extends FormVmGroup {
  static const getAnswerKey = "getAnswer";

  NeonatalServiceVm({
    required SaveNeonatalForm saveNeonatalForm,
    required GetNeonatalFormData getNeonatalFormData,
  }):
    _saveNeonatalForm = saveNeonatalForm,
    _getNeonatalFormData = getNeonatalFormData
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
      } else {
        resetResponses();
      }
    });
  }
  final SaveNeonatalForm _saveNeonatalForm;
  final GetNeonatalFormData _getNeonatalFormData;

  final MutableLiveData<Map<String, dynamic>> _formAnswer = MutableLiveData();

  int _currentPage = 0;
  int get currentPage => _currentPage;
  late int monthlyCheckUpId;

  @override
  List<LiveData> get liveDatas => [];


  void initFormInPage(int page) {
    _currentPage = page;
    init(isOneShot: false);
  }

  @override
  Set<String>? get mappedKey => null;
  @override
  mapResponse(int groupPosition, String key, response) {
    if(key.startsWith("q_")) {
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
        map["q_kuning${i+1}"] = kuningSet.contains(i);
      }
      map.remove("q_kuning");
    }
    map["monthly_checkup_id"] = monthlyCheckUpId;
    final res = await _saveNeonatalForm(
      page: currentPage,
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
    final res = await _getNeonatalFormData(currentPage);
    if(res is Success<List<FormGroupData>>) {
      final data = res.data;
      return formDataListToUi(data);
    }
    return List.empty();
  }

/*
  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    return (response as String).isNotEmpty;
  }
 */

  //TODO: NeonatalServiceVm - getAnswer: blum ada endpoint.
  void getAnswer({ bool forceLoad = false }) {
    if(!forceLoad && _formAnswer.value != null) return;
    startJob(getAnswerKey, (isActive) async {

    });
  }
}