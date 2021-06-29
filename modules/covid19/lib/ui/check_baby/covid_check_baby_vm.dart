import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:covid19/core/domain/usecase/covid_check_usecase.dart';

class CovidCheckBabyVm extends FormVmGroup {
  CovidCheckBabyVm({
    required GetCovidMotherCheckFormData getCovidMotherCheckFormData,
    required SubmitCovidMotherCheckForm submitCovidMotherCheckForm,
    required GetMotherNik getMotherNik,
  }):
    _getCovidMotherCheckFormData = getCovidMotherCheckFormData,
    _submitCovidMotherCheckForm = submitCovidMotherCheckForm,
    _getMotherNik = getMotherNik
  ;
  final GetCovidMotherCheckFormData _getCovidMotherCheckFormData;
  final SubmitCovidMotherCheckForm _submitCovidMotherCheckForm;
  final GetMotherNik _getMotherNik;
/*
  final MutableLiveData<List<FormUiGroupData>> _formDataList = MutableLiveData();
  LiveData<List<FormUiGroupData>> get formDataList => _formDataList;
 */

  @override
  List<LiveData> get liveDatas => [];


  @override
  Future<Result<String>> doSubmitJob() async {
    final res1 = await _getMotherNik();
    if(res1 is Success<String>) {
      final motherNik = res1.data;
      final form = CovidMotherCheckForm();
      final res2 = await _submitCovidMotherCheckForm(motherNik, form);
      if(res2 is Success<bool>) {
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