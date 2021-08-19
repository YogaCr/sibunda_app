import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/core/domain/usecase/mother_immunization_use_case.dart';

class PregnancyImmunizationPopupVm extends FormAuthVmGroup {
  //static const confirmImmunizationKey = "confirmImmunization";

  PregnancyImmunizationPopupVm({
    BuildContext? context,
    required this.pregnancyId,
    required this.immunization,
    required GetPregnancyImmunizationConfirmForm getPregnancyImmunizationConfirmForm,
    required ConfirmMotherImmunization confirmMotherImmunization,
    required GetMotherNik getMotherNik,
  }):
    _getMotherNik = getMotherNik,
    _getPregnancyImmunizationConfirmForm = getPregnancyImmunizationConfirmForm,
    _confirmMotherImmunization = confirmMotherImmunization, super(context: context)
  ;
  final ProfileCredential pregnancyId;

  final GetMotherNik _getMotherNik;
  final GetPregnancyImmunizationConfirmForm _getPregnancyImmunizationConfirmForm;
  final ConfirmMotherImmunization _confirmMotherImmunization;

  final ImmunizationData immunization;

  final MutableLiveData<DateTime> _date = MutableLiveData();
  LiveData<DateTime> get date => _date;

  @override
  List<LiveData> get liveDatas => [];
  @override
  Set<String>? get mappedKey => null;
  @override
  mapResponse(int groupPosition, String key, response) {
    if(response is DateTime) return response.toString();
    return super.mapResponse(groupPosition, key, response);
  }
  @override
  Future<Result<String>> doSubmitJob() async {
    try {
      final nikRes = await _getMotherNik();
      if(nikRes is Success<String>) {
        final nik = nikRes.data;
        final respMap = getResponse().responseGroups.values.first;
        final data = ImmunizationConfirmData(
          immunization: immunization,
          responsibleName: respMap[Const.KEY_RESPONSIBLE_NAME],
          date: respMap[Const.KEY_IMMUNIZATION_DATE],
          place: respMap[Const.KEY_IMMUNIZATION_PLACE],
          noBatch: respMap[Const.KEY_NO_BATCH] ?? "",
        );
        final res = await _confirmMotherImmunization(nik, data);
        if(res is Success<bool>) {
          _date.value = parseDate(responseGroupList.first[Const.KEY_IMMUNIZATION_DATE]!.response.value);
          return Success("ok");
        }
      }
    } catch(e, stack) {
      final msg = "Can't send pregnancy immunization";
      prine("$msg; e= $e");
      prine(stack);
      return Fail(msg: msg, error: e, stack: stack,);
    }
    return Fail(msg: "Can't send pregnancy immunization. Something error",);
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
}