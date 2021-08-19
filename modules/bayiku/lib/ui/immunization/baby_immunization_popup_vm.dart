import 'package:bayiku/core/domain/usecase/baby_immunization_use_case.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

class BabyImmunizationPopupVm extends FormAuthVmGroup {
  //static const confirmImmunizationKey = "confirmImmunization";

  BabyImmunizationPopupVm({
    BuildContext? context,
    required this.immunization,
    required this.credential,
    required GetBabyImmunizationConfirmForm getBabyImmunizationConfirmForm,
    required ConfirmBabyImmunization confirmBabyImmunization,
    //required GetBabyNik getBabyNik,
  }):
    //_getBabyNik = getBabyNik,
    _getBabyImmunizationConfirmForm = getBabyImmunizationConfirmForm,
    _confirmBabyImmunization = confirmBabyImmunization, super(context: context)
  ;

  //final GetBabyNik _getBabyNik;
  final GetBabyImmunizationConfirmForm _getBabyImmunizationConfirmForm;
  final ConfirmBabyImmunization _confirmBabyImmunization;

  //final int babyId;
  final ImmunizationData immunization;
  final ProfileCredential credential;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<Result<String>> doSubmitJob() async {
    final respMap = getResponse().responseGroups.values.first;
    final data = ImmunizationConfirmData(
      immunization: immunization.copy(
        date: respMap[Const.KEY_IMMUNIZATION_DATE],
        location: respMap[Const.KEY_IMMUNIZATION_PLACE],
        batchNo: respMap[Const.KEY_NO_BATCH]!.toString(),
      ),
      responsibleName: respMap[Const.KEY_RESPONSIBLE_NAME],
      date: respMap[Const.KEY_IMMUNIZATION_DATE],
      place: respMap[Const.KEY_IMMUNIZATION_PLACE],
      noBatch: respMap[Const.KEY_NO_BATCH]!.toString(), // ?? "<>",
    );

    final res = await _confirmBabyImmunization(credential.nik, data);
    prind("BabyImmunizationPopupVm `doSubmit()` res= $res");
    if(res is Success<bool>) {
      return Success("ok");
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
  Set<String>? get mappedKey => {
    //Const.KEY_NO_BATCH,
    Const.KEY_IMMUNIZATION_DATE,
  };
  @override
  dynamic mapResponse(int groupPosition, String key, dynamic response) {
    //if(key == Const.KEY_NO_BATCH) return int.parse(response);
    if(response is DateTime) return response.toString();
  }
}