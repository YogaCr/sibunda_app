import 'package:bayiku/core/domain/usecase/baby_neonatal_usecase.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/util/data_mapper.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';

class NeonatalServiceVm extends FormVmGroup {
  NeonatalServiceVm({
    required SaveNeonatalForm saveNeonatalForm,
    required GetNeonatalFormData getNeonatalFormData,
  }):
    _saveNeonatalForm = saveNeonatalForm,
    _getNeonatalFormData = getNeonatalFormData
  ;
  final SaveNeonatalForm _saveNeonatalForm;
  final GetNeonatalFormData _getNeonatalFormData;

  int currentPage = 0;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<Result<String>> doSubmitJob() async {
    final map = getResponseMap();
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

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    return (response as String).isNotEmpty;
  }
}