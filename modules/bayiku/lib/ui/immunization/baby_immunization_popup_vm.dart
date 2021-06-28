import 'package:bayiku/core/domain/usecase/baby_immunization_use_case.dart';
import 'package:bayiku/core/domain/usecase/baby_overall_usecase.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';

class BabyImmunizationPopupVm extends FormVmGroup {
  //static const confirmImmunizationKey = "confirmImmunization";

  BabyImmunizationPopupVm({
    required this.immunization,
    required GetBabyImmunizationConfirmForm getBabyImmunizationConfirmForm,
    required ConfirmBabyImmunization confirmBabyImmunization,
    required GetBabyNik getBabyNik,
  }):
    _getBabyNik = getBabyNik,
    _getBabyImmunizationConfirmForm = getBabyImmunizationConfirmForm,
    _confirmBabyImmunization = confirmBabyImmunization
  ;

  final GetBabyNik _getBabyNik;
  final GetBabyImmunizationConfirmForm _getBabyImmunizationConfirmForm;
  final ConfirmBabyImmunization _confirmBabyImmunization;

  final ImmunizationData immunization;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<Result<String>> doSubmitJob() async {
    final nikRes = await _getBabyNik();
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

      final res = await _confirmBabyImmunization(nik, data);
      if(res is Success<bool>) {
        return Success("ok");
      }
    }
    return Fail();
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    final res = await _getBabyImmunizationConfirmForm();
    if(res is Success<List<FormGroupData>>) {
      final data = res.data;
      return data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);
    } else {
      return List.empty();
    }
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_NO_BATCH: return int.tryParse(response) != null;
    }
    return (response as String).isNotEmpty;
  }
  
  @override
  Set<String>? get mappedKey => {
    Const.KEY_NO_BATCH,
  };
  @override
  dynamic mapResponse(int groupPosition, String key, dynamic response) => int.parse(response);
}