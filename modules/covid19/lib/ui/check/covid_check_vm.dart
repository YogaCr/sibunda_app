import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:covid19/core/domain/usecase/covid_check_usecase.dart';

class CovidCheckVm extends FormVmGroup {
  CovidCheckVm({
    required GetCovidMotherCheckFormData getCovidMotherCheckFormData,
    required SubmitCovidMotherCheckForm submitCovidMotherCheckForm,
    required SubmitCovidBabyCheckForm submitCovidBabyCheckForm,
    required GetMotherNik getMotherNik,
    required GetBabyNik getBabyNik,
  }):
    _getCovidMotherCheckFormData = getCovidMotherCheckFormData,
    _submitCovidMotherCheckForm = submitCovidMotherCheckForm,
    _submitCovidBabyCheckForm = submitCovidBabyCheckForm,
    _getMotherNik = getMotherNik,
    _getBabyNik = getBabyNik
  {
    onSubmit.observe(this, (success) {
      if(success is Success<String>) {
        setFormEnabled(isEnabled: false);
      }
    });
  }
  final GetCovidMotherCheckFormData _getCovidMotherCheckFormData;
  final SubmitCovidMotherCheckForm _submitCovidMotherCheckForm;
  final SubmitCovidBabyCheckForm _submitCovidBabyCheckForm;
  final GetMotherNik _getMotherNik;
  final GetBabyNik _getBabyNik;
/*
  final MutableLiveData<List<FormUiGroupData>> _formDataList = MutableLiveData();
  LiveData<List<FormUiGroupData>> get formDataList => _formDataList;
 */

  final MutableLiveData<FormWarningStatus> _result = MutableLiveData();
  LiveData<FormWarningStatus> get result => _result;

  late bool isMother;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Set<String>? get mappedKey => null;
  @override
  mapResponse(int groupPosition, String key, response) => getBinaryAnswerYesNoInt(response);

  @override
  Future<Result<String>> doSubmitJob() async {
    final res1 = isMother
        ? await _getMotherNik()
        : await _getBabyNik();

    prind("CovidCheckVm.doSubmitJob() res1 = $res1");

    if(res1 is Success<String>) {
      final nik = res1.data;
      final data = getResponse().responseGroups.values.first.map((key, value) => MapEntry(parseInt(key), value));
      final res2 = isMother
          ? await _submitCovidMotherCheckForm(nik, data)
          : await _submitCovidBabyCheckForm(nik, data);

      prind("CovidCheckVm.doSubmitJob() res2 = $res2 nik = $nik data = $data");

      if(res2 is Success<FormWarningStatus>) {
        final data = res2.data;
        _result.value = data;
        return Success("ok");
      }
    }
    return Fail();
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    final res = await _getCovidMotherCheckFormData();
    if(res is Success<List<FormGroupData>>) {
      final data = res.data;
      return data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);
    }
    return List.empty();
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async =>
      (response as String?)?.isNotEmpty == true;
}