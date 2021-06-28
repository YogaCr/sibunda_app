import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:kehamilanku/core/domain/usecase/mother_immunization_use_case.dart';

class PregnancyImmunizationPopupVm extends FormVmGroup {
  //static const confirmImmunizationKey = "confirmImmunization";

  PregnancyImmunizationPopupVm({
    required this.immunization,
    required GetPregnancyImmunizationConfirmForm getPregnancyImmunizationConfirmForm,
    required ConfirmMotherImmunization confirmMotherImmunization,
    required GetMotherNik getMotherNik,
  }):
    _getMotherNik = getMotherNik,
    _getPregnancyImmunizationConfirmForm = getPregnancyImmunizationConfirmForm,
    _confirmMotherImmunization = confirmMotherImmunization
  ;

  final GetMotherNik _getMotherNik;
  final GetPregnancyImmunizationConfirmForm _getPregnancyImmunizationConfirmForm;
  final ConfirmMotherImmunization _confirmMotherImmunization;

  final ImmunizationData immunization;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<Result<String>> doSubmitJob() async {
    final nikRes = await _getMotherNik();
    if(nikRes is Success<String>) {
      final nik = nikRes.data;
      final respMap = getResponse().responseGroups.values.first;
      final data = ImmunizationConfirmData(
        immunization: immunization,
        responsibleName: respMap[Const.KEY_RESPONSIBLE_NAME],
        date: respMap[Const.KEY_IMMUNIZATION_DATE],
        place: respMap[Const.KEY_IMMUNIZATION_PLACE],
        noBatch: respMap[Const.KEY_NO_BATCH] ?? -1,
      );

      final res = await _confirmMotherImmunization(nik, data);
      if(res is Success<bool>) {
        return Success("ok");
      }
    }
    return Fail();
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    final res = await _getPregnancyImmunizationConfirmForm();
    if(res is Success<List<FormGroupData>>) {
      final data = res.data;
      return data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);
    } else {
      return List.empty();
    }
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async =>
      (response as String).isNotEmpty;
}