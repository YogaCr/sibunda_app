import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/times.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:core/util/val_util.dart';
import 'package:kehamilanku/core/domain/usecase/pregnancy_check_use_case.dart';

class KehamilankuCheckFormVm extends FormVmGroup {
  static const getPregnancyCheckKey = "getPregnancyCheck";
  static const getMotherFormWarningStatusKey = "getMotherFormWarningStatus";
  static const getPregnancyBabySizeKey = "getPregnancyBabySize";

  KehamilankuCheckFormVm({
    required GetMotherNik getMotherNik,
    required GetMotherHpl getMotherHpl,
    required GetMotherHpht getMotherHpht,
    required GetPregnancyCheckUpId getPregnancyCheckUpId,
    required SavePregnancyCheck savePregnancyCheck,
    required GetPregnancyCheck getPregnancyCheck,
    required GetMotherFormWarningStatus getMotherFormWarningStatus,
    required GetPregnancyBabySize getPregnancyBabySize,
    required GetPregnancyCheckForm getPregnancyCheckForm,
  }):
    _getMotherNik = getMotherNik,
    _getMotherHpl = getMotherHpl,
    _getMotherHpht = getMotherHpht,
    _getPregnancyCheckUpId = getPregnancyCheckUpId,
    _savePregnancyCheck = savePregnancyCheck,
    _getPregnancyCheck = getPregnancyCheck,
    _getMotherFormWarningStatus = getMotherFormWarningStatus,
    _getPregnancyBabySize = getPregnancyBabySize,
    _getPregnancyCheckForm = getPregnancyCheckForm {

    currentWeek.observe(this, (week) {
      setResponse(0, Const.KEY_WEEK, week);
    });
    pregnancyCheck.observe(this, (data) {
      if(data != null) {
        final map = data.toJson();
        patchResponse([map]);
      } else {
        resetResponses();
      }
      //_isFormEnabled = data == null;
    });
    _lateInit();
  }

  final GetPregnancyCheckUpId _getPregnancyCheckUpId;
  final SavePregnancyCheck _savePregnancyCheck;
  final GetPregnancyCheck _getPregnancyCheck;
  final GetMotherFormWarningStatus _getMotherFormWarningStatus;
  final GetPregnancyBabySize _getPregnancyBabySize;
  final GetPregnancyCheckForm _getPregnancyCheckForm;
  final GetMotherNik _getMotherNik;
  final GetMotherHpl _getMotherHpl;
  final GetMotherHpht _getMotherHpht;

  final MutableLiveData<PregnancyCheck> _pregnancyCheck = MutableLiveData();
  final MutableLiveData<List<FormWarningStatus>> _formWarningStatusList = MutableLiveData();
  final MutableLiveData<PregnancyBabySize> _pregnancyBabySize = MutableLiveData();

  LiveData<PregnancyCheck> get pregnancyCheck => _pregnancyCheck;
  LiveData<List<FormWarningStatus>> get formWarningStatusList => _formWarningStatusList;
  LiveData<PregnancyBabySize> get pregnancyBabySize => _pregnancyBabySize;

  MutableLiveData<int> currentWeek = MutableLiveData();
  late int currentTrimesterId;

  bool _isFormEnabled = true;
  @override
  bool get isFormEnabled => _isFormEnabled;

  void _lateInit() async {
    final res1 = await _getMotherNik();
    if(res1 is Success<String>) {
      final motherNik = res1.data;
      final res2 = await _getMotherHpl(motherNik);
      final res3 = await _getMotherHpht(motherNik);

      if(res2 is Success<DateTime> && res3 is Success<DateTime>) {
        final hpl = res2.data;
        final hpht = res3.data;

        setResponse(0, Const.KEY_HPL, hpl);
        setResponse(0, Const.KEY_HPHT, hpht);
      }
    }
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    prind("KehamilankuCheckFormVm doSubmitJob() ==== AWAL");
    final responseMap = getResponse();
    prind("KehamilankuCheckFormVm doSubmitJob() ==== responseMap = ${responseMap.responseGroups}");
    final data = PregnancyCheck.fromJson(responseMap.responseGroups.values.first);
    prind("KehamilankuCheckFormVm doSubmitJob() ==== data = ${data.toJson()}");
    final motherNik = VarDi.motherNik.getOrElse();
    return _savePregnancyCheck(motherNik, data, currentTrimesterId).then((value) =>
      value is Success<bool> ? Success("") : value as Fail<String>
    );
  }

  @override
  Set<String>? get mappedKey => {
    Const.KEY_VISIT_DATE,
    Const.KEY_FUTURE_VISIT_DATE,
    Const.KEY_HPHT,
    Const.KEY_HPL,

    Const.KEY_WEEK,
    Const.KEY_WEIGHT,
    Const.KEY_WEIGHT_DIFF,
    Const.KEY_HEIGHT,
    Const.KEY_BABY_MOVEMENT,
    Const.KEY_TFU,
    Const.KEY_DJJ,
    Const.KEY_SYSTOLIC_PRESSURE,
    Const.KEY_DIASTOLIC_PRESSURE,
    Const.KEY_MAP,
  };
  @override
  mapResponse(int groupPosition, String key, response) {
    switch(key) {
      case Const.KEY_VISIT_DATE:
      case Const.KEY_FUTURE_VISIT_DATE:
      case Const.KEY_HPHT:
      case Const.KEY_HPL: return response?.toString();

      case Const.KEY_WEEK:
      case Const.KEY_WEIGHT:
      case Const.KEY_WEIGHT_DIFF:
      case Const.KEY_HEIGHT:
      case Const.KEY_BABY_MOVEMENT:
      case Const.KEY_TFU:
      case Const.KEY_DJJ:
      case Const.KEY_SYSTOLIC_PRESSURE:
      case Const.KEY_DIASTOLIC_PRESSURE:
      case Const.KEY_MAP: return parseInt(response);
    }
    return super.mapResponse(groupPosition, key, response);
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    //prind("PregTrimFormVm validateField() group=$groupPosition key=$inputKey resp=$response");
    switch(inputKey) {
      case Const.KEY_WEEK:
      case Const.KEY_WEIGHT:
      case Const.KEY_WEIGHT_DIFF:
      case Const.KEY_HEIGHT:
      case Const.KEY_BABY_MOVEMENT:
      case Const.KEY_TFU:
      case Const.KEY_DJJ:
      case Const.KEY_SYSTOLIC_PRESSURE:
      case Const.KEY_DIASTOLIC_PRESSURE:
      case Const.KEY_MAP: return tryParseInt(response) != null;
    }
    return super.validateField(groupPosition, inputKey, response);
  }

  @override
  String getResponseStringRepr(int groupPosition, String inputKey, response) {
    if(response is DateTime) {
      return syncFormatTime(response);
    }
    return super.getResponseStringRepr(groupPosition, inputKey, response);
  }

  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey) {
      case Const.KEY_WEEK:
      case Const.KEY_WEIGHT:
      case Const.KEY_WEIGHT_DIFF:
      case Const.KEY_HEIGHT:
      case Const.KEY_TFU:
      case Const.KEY_DJJ:
      case Const.KEY_SYSTOLIC_PRESSURE:
      case Const.KEY_DIASTOLIC_PRESSURE:
      case Const.KEY_MAP: return (response is String) && response.isNotEmpty == true
        ? Strings.field_must_be_number
        : Strings.field_can_not_be_empty;
    }
    return super.getInvalidMsg(inputKey, response);
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    final res = await _getPregnancyCheckForm();
    if(res is Success<List<FormGroupData>>) {
      final data = res.data;
      return data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);
    } else {
      return List.empty();
    }
  }

  @override
  List<LiveData> get liveDatas => [
    _pregnancyCheck, _formWarningStatusList, _pregnancyBabySize,
  ];


  void getPregnancyCheck({
//    required String motherNik,
    required int week,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _pregnancyCheck.value != null) return;
    startJob(getPregnancyCheckKey, (isActive) async {
      final motherNik = VarDi.motherNik.getOrElse();
      final res = await _getPregnancyCheckUpId(motherNik, week);
      final checkUpId = tryGetResultValue(res);
      prind("getPregnancyCheck() checkUpId = $checkUpId motherNik = $motherNik week = $week res = $res");
      if(checkUpId != null) {
        _getPregnancyCheck(checkUpId).then((value) {
          prind("getPregnancyCheck() _getPregnancyCheck() value = $value");
          if(value is Success<PregnancyCheck>) {
            final data = value.data;
            _pregnancyCheck.value = data;
          }
        });
      } else {
        _pregnancyCheck.value = null;
      }
    });
  }
  void getMotherFormWarningStatus({
    //required String motherNik,
    required int week,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _formWarningStatusList.value != null) return;
    startJob(getMotherFormWarningStatusKey, (isActive) async {
      final motherNik = VarDi.motherNik.getOrElse();
      final checkUpId = tryGetResultValue(await _getPregnancyCheckUpId(motherNik, week));
      if(checkUpId != null) {
        _getMotherFormWarningStatus(checkUpId).then((value) {
          if(value is Success<List<FormWarningStatus>>) {
            final data = value.data;
            _formWarningStatusList.value = data;
          }
        });
      } else {
        _formWarningStatusList.value = null;
      }
    });
  }
  void getPregnancyBabySize({
    required int pregnancyWeekAge,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _pregnancyBabySize.value != null) return;
    startJob(getPregnancyBabySizeKey, (isActive) async {
      final motherNik = VarDi.motherNik.getOrElse();
      final checkUpId = tryGetResultValue(await _getPregnancyCheckUpId(motherNik, pregnancyWeekAge));
      if(checkUpId != null) {
        _getPregnancyBabySize(checkUpId).then((value) {
          if(value is Success<PregnancyBabySize>) {
            final data = value.data;
            _pregnancyBabySize.value = data;
          }
        });
      } else {
        _pregnancyBabySize.value = null;
      }
    });
  }
}


/*
class KehamilankuCheckFormVm extends FormVm {
  static const getPregnancyCheckKey = "getPregnancyCheck";
  static const getMotherFormWarningStatusKey = "getMotherFormWarningStatus";
  static const getPregnancyBabySizeKey = "getPregnancyBabySize";

  KehamilankuCheckFormVm({
    required SavePregnancyCheck savePregnancyCheck,
    required GetPregnancyCheck getPregnancyCheck,
    required GetMotherFormWarningStatus getMotherFormWarningStatus,
    required GetPregnancyBabySize getPregnancyBabySize,
  }):
    _savePregnancyCheck = savePregnancyCheck,
    _getPregnancyCheck = getPregnancyCheck,
    _getMotherFormWarningStatus = getMotherFormWarningStatus,
    _getPregnancyBabySize = getPregnancyBabySize,
  super([
    Tuple2(Const.KEY_VISIT_DATE, Strings.visit_date),
    Tuple2(Const.KEY_VISIT_PLACE, Strings.visit_place),
    Tuple2(Const.KEY_CHECKER_NAME, Strings.checker_name),
    Tuple2(Const.KEY_MOTHER_DIFFICULTY, Strings.mother_difficulty),
    Tuple2(Const.KEY_PREGNANCY_AGE, Strings.pregnancy_age),
    Tuple2(Const.KEY_BABY_GENDER, Strings.baby_gender),
    Tuple2(Const.KEY_FUTURE_VISIT_DATE, Strings.future_visit_date),
    Tuple2(Const.KEY_HPHT, Strings.hpht),
    Tuple2(Const.KEY_HPL, Strings.hpl),
    Tuple2(Const.KEY_MOTHER_WEIGHT, Strings.mother_weight),
    Tuple2(Const.KEY_MOTHER_WEIGHT_DIFF, Strings.mother_weight_diff),
    Tuple2(Const.KEY_MOTHER_HEIGHT, Strings.mother_height),
    Tuple2(Const.KEY_TFU, Strings.tfu),
    Tuple2(Const.KEY_DJJ, Strings.djj),
    Tuple2(Const.KEY_SYSTOLIC_PRESSURE, Strings.systolic_pressure),
    Tuple2(Const.KEY_DIASTOLIC_PRESSURE, Strings.diastolic_pressure),
    Tuple2(Const.KEY_MAP, Strings.map),
    Tuple2(Const.KEY_BABY_MOVEMENT, Strings.baby_movement),
    Tuple2(Const.KEY_DRUG_PRESCRIPT, Strings.drug_prescript),
    Tuple2(Const.KEY_DRUG_ALLERGY, Strings.drug_allergy),
    Tuple2(Const.KEY_DISEASE_HISTORY, Strings.disease_history),
    Tuple2(Const.KEY_SPECIAL_NOTE, Strings.special_note),
  ]);

  final SavePregnancyCheck _savePregnancyCheck;
  final GetPregnancyCheck _getPregnancyCheck;
  final GetMotherFormWarningStatus _getMotherFormWarningStatus;
  final GetPregnancyBabySize _getPregnancyBabySize;

  final MutableLiveData<PregnancyCheck> _pregnancyCheck = MutableLiveData();
  final MutableLiveData<List<FormWarningStatus>> _formWarningStatusList = MutableLiveData();
  final MutableLiveData<PregnancyBabySize> _pregnancyBabySize = MutableLiveData();

  LiveData<PregnancyCheck> get pregnancyCheck => _pregnancyCheck;
  LiveData<List<FormWarningStatus>> get formWarningStatusList => _formWarningStatusList;
  LiveData<PregnancyBabySize> get pregnancyBabySize => _pregnancyBabySize;

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getTxtMap(
      mappedKey: {
        Const.KEY_PREGNANCY_AGE,
        Const.KEY_MOTHER_WEIGHT,
        Const.KEY_MOTHER_WEIGHT_DIFF,
        Const.KEY_MOTHER_HEIGHT,
        Const.KEY_TFU,
        Const.KEY_DJJ,
        Const.KEY_SYSTOLIC_PRESSURE,
        Const.KEY_DIASTOLIC_PRESSURE,
        Const.KEY_MAP,
      },
      mapper: (key, txt) => int.parse(txt),
    );
    final data = PregnancyCheck.fromJson(txtMap);
    return _savePregnancyCheck(data).then((value) => value is Success<bool> ? Success("") : value as Fail<String>);
  }

  @override
  Future<bool> validateTxt(String inputKey, String txt) async {
    switch(inputKey) {
      case Const.KEY_PREGNANCY_AGE:
      case Const.KEY_MOTHER_WEIGHT:
      case Const.KEY_MOTHER_WEIGHT_DIFF:
      case Const.KEY_MOTHER_HEIGHT:
      case Const.KEY_TFU:
      case Const.KEY_DJJ:
      case Const.KEY_SYSTOLIC_PRESSURE:
      case Const.KEY_DIASTOLIC_PRESSURE:
      case Const.KEY_MAP: return int.tryParse(txt) != null;
    }
    return txt.isNotEmpty;
  }

  void getPregnancyCheck({
    required String motherNik,
    required int week,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _pregnancyCheck.value != null) return;
    startJob(getPregnancyCheckKey, (isActive) async {
      _getPregnancyCheck(motherNik, week).then((value) {
        if(value is Success<PregnancyCheck>) {
          final data = value.data;
          _pregnancyCheck.value = data;
        }
      });
    });
  }
  void getMotherFormWarningStatus({
    required String motherNik,
    required int week,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _formWarningStatusList.value != null) return;
    startJob(getMotherFormWarningStatusKey, (isActive) async {
      _getMotherFormWarningStatus(motherNik, week).then((value) {
        if(value is Success<List<FormWarningStatus>>) {
          final data = value.data;
          _formWarningStatusList.value = data;
        }
      });
    });
  }
  void getPregnancyBabySize({
    required int pregnancyWeekAge,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _pregnancyBabySize.value != null) return;
    startJob(getPregnancyBabySizeKey, (isActive) async {
      _getPregnancyBabySize(pregnancyWeekAge).then((value) {
        if(value is Success<PregnancyBabySize>) {
          final data = value.data;
          _pregnancyBabySize.value = data;
        }
      });
    });
  }
}

 */