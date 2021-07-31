import 'dart:math';

import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/widget/form_generic_field.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

/// This approach uses generic type of form (form that consists of text, check box, and radio)
/// and late approach (data about field is defined in runtime, not directly in this ViewModel).
mixin FormVmGroupMixin implements AsyncVm {
  static const submitFormKey = "submitForm";

  LiveData<bool> get isFormReady;
  LiveData<bool> get isFormEnabled;

  List<MutableLiveData<FormUiGroupData>> get _fieldGroupList;
  //List<Map<String, MutableLiveData<bool>>> get _isResponseValidList;
  List<Map<String, MutableFormVmResponse>> get _responseGroupList;
  MutableLiveData<bool> get _canProceed;
  MutableLiveData<Result<String>> get _onSubmit;

  List<LiveData<FormUiGroupData>> get fieldGroupList => _fieldGroupList;
  /// Its map keys are [FormUiData.key].
  //List<Map<String, LiveData<bool>>> get isResponseValidList => _isResponseValidList;
  /// Its map keys are [FormUiData.key].
  List<Map<String, FormVmResponse>> get responseGroupList => _responseGroupList;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<Result<String>> get onSubmit => _onSubmit;

  String defaultInvalidMsg = "not valid";

  bool isResponseInit(int groupPosition, String fieldKey) => _responseGroupList[groupPosition][fieldKey]!.isValid.value != null;
  dynamic getResponseWithKey(String key) => getResponseLiveDataWithKey(key).value;
  LiveData getResponseLiveDataWithKey(String key) {
    for(final respGroup in _responseGroupList) {
      for(final entry in respGroup.entries) {
        if(entry.key == key) {
          return entry.value.response;
        }
      }
    }
    throw "No such key '$key' in $runtimeType";
  }
  FormGroupResponse getResponse() {
    final respGroupList = <FormResponse>[];
    for(int i = 0; i < _responseGroupList.length; i++) {
      final respGroup = _responseGroupList[i];
      final header = _fieldGroupList[i].value!.header;
      final respMap = <String, dynamic>{};
      respGroupList.add(FormResponse(header: header, responses: respMap));

      // All responses will not be mapped, `mappedKey` not null and isEmpty
      if(mappedKey?.isEmpty == true) {
        for(final entry in respGroup.entries) {
          respMap[entry.key] = entry.value.response.value;
        }
      }
      // Some responses will be mapped, `mappedKey` not null and isNotEmpty
      else if(mappedKey != null) {
        for(final entry in respGroup.entries) {
          if(mappedKey!.contains(entry.key)) {
            respMap[entry.key] = mapResponse(i, entry.key, entry.value.response.value);
            //mappedKey.remove(entry.key);
          } else {
            respMap[entry.key] = entry.value.response.value;
          }
        }
      }
      // All responses will be mapped, `mappedKey` is null
      else {
        for(final entry in respGroup.entries) {
          respMap[entry.key] = mapResponse(i, entry.key, entry.value.response.value);
        }
      }
    }
    return FormGroupResponse(respGroupList);
  }

  Map<String, dynamic> getResponseMap() => getResponse().toLinear();

  /// Be careful when work with multiple group that have duplicate key
  /// in different group. Because this method will flatten all responses
  /// in all groups to 1 flat map.
  Map<String, dynamic> getRawResponseMap() {
    final map = <String, dynamic>{};
    for(final group in responseGroupList) {
      for(final field in group.entries) {
        map[field.key] = field.value.response.value;
      }
    }
    return map;
  }

  /// Responses with these input keys will be mapped before submitted.
  /// If this `null`, it means all responses will be mapped.
  /// If this empty, it means all responses will *NOT* be mapped.
  Set<String>? get mappedKey => {}; //TODO: Di sini, key dari field dianggap unik semua, bahkan untuk group lain.
  dynamic mapResponse(int groupPosition, String key, dynamic response) => response;

  void registerField({
    required int groupPosition,
    required String inputKey,
    required SibFormField field,
  }) {
    field.responseLiveData.observe(this, (data) {
      //prind("registerField() groupPosition= $groupPosition inputKey= $inputKey data= $data field.responseLiveData= ${field.responseLiveData}");
      _responseGroupList[groupPosition][inputKey]!.response.value = data;
    }, tag: "FormVmGroupMixin.registerField() $groupPosition, $inputKey",);
  }

  /// [isOneShot] is true then method [getFieldGroupList] won't be called
  /// if [isFormReady] is currently true.
  void init({bool isOneShot = true,});

  void _assertCanProceed() {
    //prind("FormVmGroupMixin _assertCanProceed() _canProceed= $_canProceed isFormReady= $isFormReady");
    if(_canProceed.value != true) {
      if(isFormReady.value != true) {
        throw "VM '$runtimeType' can't cal `_assertCanProceed()` because this VM is not ready yet (isFormReady=$isFormReady)";
      }
      throw "VM '$runtimeType' can't proceed (current proceed status = ${_canProceed.value}), (current each field status = $_responseGroupList)";
    }
  }
  void _checkCanProceed() {
    for(int i = 0; i < _responseGroupList.length ; i++) {
      final responseMap = _responseGroupList[i];
      for(final responsePair in responseMap.entries) {
        final response = responsePair.value;
        //prind("_checkCanProceed() group = $i _responseGroupList.length = ${_responseGroupList.length} responsePair= $responsePair");
        //final isResponseInit = _isResponseInitList[i];
        if(response.isValid.value != true) {
          _canProceed.value = false;
          return;
        }
      }
    }
    _canProceed.value = true;
  }

  //TODO: FormVmGroup: Cari cara biar isValid LiveData ke reset jika pindah halaman, namun dalam 1 VM.
  void displayInvalidFields() {
    for(int i = 0; i < _responseGroupList.length ; i++) {
      final isResponseValidMap = _responseGroupList[i];
      for(final entry in isResponseValidMap.entries) {
        final isResponseValid = entry.value;
        if(isResponseValid.isValid.value == null) {
          // So even the field that still in init will be notified as invalid.
          isResponseValid.isValid.value = false;
          Future.delayed(Duration(milliseconds: 200), () => isResponseValid.isValid.value = false);
        }
      }
    }
  }

  Future<void> submit() {
    _assertCanProceed(); // For unit test, make sure that programmer delay the submission after patch response.
    return startJob(submitFormKey, (isActive) async {
      return await doSubmitJob().then((value) {
        //prind("FormVmGroupMixin() submit() value = $value");
        _onSubmit.value = value;
        if(value is Fail<String>) {
          return value;
        }
      });
    });
  }
  Future<List<FormUiGroupData>> getFieldGroupList();
  /// Called right after this [FormVmGroupMixin] form is ready.
  @protected
  void onReady(){}
  Future<Result<String>> doSubmitJob();

  /// Until July 5th, 2021, probable types of [response] is like this:
  /// - For [FormType.text] : It can be either [String] or [DateTime].
  /// - For [FormType.radio] : [String] for selected radio value.
  /// - For [FormType.check] : [Set<int>].
  Future<bool> validateField(int groupPosition, String inputKey, dynamic response) async {
    if(response is String) return response.isNotEmpty;
    if(response is Iterable) return response.isNotEmpty;
    return response != null;
  }
  /// Called before [validateField]. This method is useful for validation preparation
  /// That can't be solve just by observing the response live data outside this class.
  void preValidateField(int groupPosition, String inputKey, dynamic response) {}
  String getResponseStringRepr(int groupPosition, String inputKey, dynamic response) =>
      response is String ? response : response?.toString() ?? "";
  String getInvalidMsg(String inputKey, dynamic response) => defaultInvalidMsg;
}


abstract class FormVmGroup extends AsyncVm with FormVmGroupMixin {
  FormVmGroup({
    this.defaultInvalidMsg = Strings.field_can_not_be_empty,
  });

  @override
  late List<MutableLiveData<FormUiGroupData>> _fieldGroupList;

  @override
  late List<Map<String, MutableFormVmResponse>> _responseGroupList;

  @override
  List<LiveData<FormUiGroupData>> get fieldGroupList {
    _assertFormReady();
    return _fieldGroupList;
  }
  /// Its map keys are [FormUiData.key].
  List<Map<String, FormVmResponse>> get responseGroupList {
    _assertFormReady();
    return _responseGroupList;
  }

  @override
  final MutableLiveData<bool> _canProceed = MutableLiveData();

  @override
  final MutableLiveData<Result<String>> _onSubmit = MutableLiveData();

  @override
  final String defaultInvalidMsg;

  MutableLiveData<bool> _isFormReady = MutableLiveData(false);
  MutableLiveData<bool> _isFormEnabled = MutableLiveData(true);

  @override
  LiveData<bool> get isFormReady => _isFormReady;
  @override
  LiveData<bool> get isFormEnabled => _isFormEnabled;

  bool _isReseting = false;

  @protected
  void setFormEnabled({ bool isEnabled = true}) {
    _isFormEnabled.value = isEnabled;
  }

  //List<void Function()> _onReadyCallbacks = [];

  void _assertFormReady() {
    if(!isActive) {
      throw "Form `$runtimeType` is not active, thus it is unusable";
    }
    if(isFormReady.value != true) {
      throw "Form `$runtimeType` is not ready yet";
    }
  }

  @override
  void init({bool isOneShot = true}){
    if(isOneShot && _isFormReady.value == true) return;
    final isFormReadyBefore = _isFormReady.value;
    _isFormReady.value = false;
    getFieldGroupList().catchError((e, stack) {
      prine("Error in $runtimeType.init(): msg = $e");
      prine(stack);
      _isFormReady.value = isFormReadyBefore;
    }).then((fieldGroupList) {
      prind("FormVmGroupMixin.init().getFieldGroupList().then() fieldGroupList = $fieldGroupList");
      _fieldGroupList = fieldGroupList.map((e) => MutableLiveData(e)).toList(growable: false);
      int i = 0;
      _responseGroupList = fieldGroupList.map((e) {
        final i2 = i++;
        final map = <String, MutableFormVmResponse>{};
        for(final formData in e.data) {
          final isValidData = MutableLiveData<bool>();
          isValidData.observe(this, (isValid) {
            prind("isValidData.observe() formData.key = ${formData.key} isValid = $isValid _isReseting= $_isReseting");
            if(!_isReseting) {
              _checkCanProceed();
            }
          }, tag: "FormVmGroup ${formData.key}",);
          final responseData = MutableLiveData();
          responseData.observe(this, (response) async {
            prind("responseData.observe() AWAL _isReseting= $_isReseting");
            if(!_isReseting) {
              preValidateField(i2, formData.key, response);
              final isValid = await validateField(i2, formData.key, response);
              prind("responseData.observe() validateField() formData.key = ${formData.key} isValid = $isValid");
              isValidData.value = isValid;
            }
/*
            .then((isValid) {
              isValidData.value = isValid;
              prind("responseData.observe() validateField() formData.key = ${formData.key} isValid = $isValid");
            });
 */
          }, tag: "FormVmGroup ${formData.key}",);
          map[formData.key] = MutableFormVmResponse(
            response: responseData,
            isValid: isValidData,
          );
        }
        return map;
      }).toList(growable: false);
      _isFormReady.value = true;
      onReady();
    });
  }

  @protected
  void patchResponse(List<Map<String, dynamic>> responses) {
    //_assertFormReady();
    final minLen = min(responses.length, _responseGroupList.length);
    for(int i = 0; i < minLen; i++) {
      final resps = responses[i];
      final vmGroup = _responseGroupList[i];

      for(final key in vmGroup.keys) {
        prind("resps.containsKey($key) = ${resps.containsKey(key)} resps[key]= ${resps[key]}");
        if(resps.containsKey(key)) {
          vmGroup[key]!.response.value = resps[key];
        }
      }
    }
  }
  @protected
  void resetResponses({ Set<String>? skippedKeys }) {
    _isReseting = true;
    //prind("FormVmGroup.resetResponses() AWAL");
    try {
      if(skippedKeys?.isNotEmpty != true) { //null or empty
        //prind("resetResponses() skippedKeys= $skippedKeys _responseGroupList = $_responseGroupList");
        for(final group in _responseGroupList) {
          for(final e in group.values) {
            e.response.value = null;
            e.isValid.value = null;
          }
        }
      } else {
        for(final group in _responseGroupList) {
          for(final e in group.entries) {
            if(skippedKeys!.contains(e.key)) {
              skippedKeys.remove(e.key);
              continue;
            }
            e.value.response.value = null;
            e.value.isValid.value = null;
          }
        }
      }
    } catch(e, stack) {
      prinw("An error occured when calling `resetResponses()`; e= $e");
      prinw(stack);
    }
    _canProceed.value = null;
    _onSubmit.value = null;
    _isReseting = false;
    //prind("FormVmGroup.resetResponses() AKHIR _isReseting= $_isReseting");
  }
  @protected
  void setResponse(int group, String key, response) {
    if(_isFormReady.value == true) {
      if(_responseGroupList[group][key] == null) {
        throw "No such `key` '$key' in group '$group' in this '$runtimeType'";
      }
      _responseGroupList[group][key]!.response.value = response;
    } else {
      _isFormReady.observeOnce((isReady) {
        //prind("FormVmGroup setResponse() NOT READY group= $group key= $key response= $response isReady = $isReady");
        if(isReady == true) {
          if(_responseGroupList[group][key] == null) {
            throw "No such `key` '$key' in group '$group' in this '$runtimeType'";
          }
          _responseGroupList[group][key]!.response.value = response;
        }
      }, immediatelyGet: false //Cuz, the init value of `_isFormReady.value` is false, thus it will available immediately
        // but that's not the case we want here.
      );
    }
  }
  @protected
  void setFieldValidity(int group, String key, bool isValid) {
    if(_isFormReady.value == true) {
      if(_responseGroupList[group][key] == null) {
        throw "No such `key` '$key' in group '$group' in this '$runtimeType'";
      }
      //_isReseting = true;
      _responseGroupList[group][key]!.isValid.value = isValid;
      //_isReseting = false;
    } else {
      _isFormReady.observeOnce((isReady) {
        //prind("FormVmGroup setResponse() NOT READY group= $group key= $key response= $response isReady = $isReady");
        if(isReady == true) {
          if(_responseGroupList[group][key] == null) {
            throw "No such `key` '$key' in group '$group' in this '$runtimeType'";
          }
          //_isReseting = true;
          _responseGroupList[group][key]!.isValid.value = isValid;
          //_isReseting = false;
        }
      }, immediatelyGet: false //Cuz, the init value of `_isFormReady.value` is false, thus it will available immediately
        // but that's not the case we want here.
      );
    }
  }

  @override
  void dispose() {
    _isFormReady.value = false;
    _isFormReady.dispose();
    for(int i = 0; i < _fieldGroupList.length; i++) {
      _fieldGroupList[i].dispose();
      for(final formResponse in _responseGroupList[i].values) {
        formResponse.response.dispose();
        formResponse.isValid.dispose();
      }
    }
    super.dispose();
  }
}