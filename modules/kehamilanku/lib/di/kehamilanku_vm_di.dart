import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/core/di/kehamilanku_usecase_di.dart';
import 'package:kehamilanku/ui/chart/mother_chart_vm.dart';
import 'package:kehamilanku/ui/chart/mother_preg_eval_chart_menu_vm.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_vm.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_vm.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_vm.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_vm.dart';


class KehamilankuVmDi {
  KehamilankuVmDi._();

  static KehamilankuVmDiObj obj = KehamilankuVmDiObjImpl();
}


abstract class KehamilankuVmDiObj {
  KehamilankuHomeVm kehamilankuHomeVm({BuildContext? context,});
  KehamilankuCheckFormVm checkFormVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  });
  PregnancyImmunizationVm immunizationVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  });
  PregnancyImmunizationPopupVm immunizationPopupVm({
    required ImmunizationData immunization,
    required ProfileCredential pregnancyCred,
    BuildContext? context,
  });
  MotherPregEvalChartMenuVm pregEvalChartMenuVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  });
  MotherChartVm motherChartVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  });
}

class KehamilankuVmDiObjImpl extends KehamilankuVmDiObj {
  @override
  KehamilankuHomeVm kehamilankuHomeVm({BuildContext? context,}) => KehamilankuHomeVm(
    context: context,
    getPregnancyAgeOverview: KehamilankuUseCaseDi.obj.getPregnancyAgeOverview,
    getTrimesterList: KehamilankuUseCaseDi.obj.getTrimesterList,
    getMotherFoodRecomList: KehamilankuUseCaseDi.obj.getMotherFoodRecomList,
    getBornBabyList: UseCaseDi.obj.getBornBabyList,
    getUnbornBabyList: UseCaseDi.obj.getUnbornBabyList,
    isBabyBorn: UseCaseDi.obj.isBabyBorn,
  );
  @override
  KehamilankuCheckFormVm checkFormVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => KehamilankuCheckFormVm(
    context: context,
    pregnancyId: pregnancyCred,
    isBabyBorn: UseCaseDi.obj.isBabyBorn,
    getMotherHpl: UseCaseDi.obj.getMotherHpl,
    getPregnancyCheckUpId: UseCaseDi.obj.getPregnancyCheckUpId,
    getPregnancyCheck: KehamilankuUseCaseDi.obj.getPregnancyCheck,
    savePregnancyCheck: KehamilankuUseCaseDi.obj.savePregnancyCheck,
    saveUsgImg: KehamilankuUseCaseDi.obj.saveUsgImg,
    getMotherFormWarningStatus: KehamilankuUseCaseDi.obj.getMotherFormWarningStatus,
    getPregnancyBabySize: KehamilankuUseCaseDi.obj.getPregnancyBabySize,
    getPregnancyCheckForm: KehamilankuUseCaseDi.obj.getPregnancyCheckForm,
    //getCurrentMotherHpl: UseCaseDi.getCurrentMotherHpl,
    //getCurrentMotherHpht: UseCaseDi.getCurrentMotherHpht,
    //getMotherNik: UseCaseDi.getMotherNik,
  );
  @override
  PregnancyImmunizationVm immunizationVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => PregnancyImmunizationVm(
    context: context,
    pregnancyId: pregnancyCred,
    getMotherImmunizationGroupList: KehamilankuUseCaseDi.obj.getMotherImmunizationGroupList,
    getMotherImmunizationOverview: KehamilankuUseCaseDi.obj.getMotherImmunizationOverview,
  );
  @override
  PregnancyImmunizationPopupVm immunizationPopupVm({
    required ImmunizationData immunization,
    required ProfileCredential pregnancyCred,
    BuildContext? context,
  }) => PregnancyImmunizationPopupVm(
    context: context,
    pregnancyId: pregnancyCred,
    immunization: immunization,
    getMotherNik: UseCaseDi.obj.getMotherNik,
    getPregnancyImmunizationConfirmForm: KehamilankuUseCaseDi.obj.getPregnancyImmunizationConfirmForm,
    confirmMotherImmunization: KehamilankuUseCaseDi.obj.confirmMotherImmunization,
  );
  @override
  MotherPregEvalChartMenuVm pregEvalChartMenuVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => MotherPregEvalChartMenuVm(
    context: context,
    pregnancyId: pregnancyCred,
    getMotherPregEvalGraphMenu: KehamilankuUseCaseDi.obj.getMotherPregEvalGraphMenu,
  );
  @override
  MotherChartVm motherChartVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => MotherChartVm(
    context: context,
    pregnancyId: pregnancyCred,
    //getMotherNik: UseCaseDi.getMotherNik,
    //getCurrentMotherPregnancyId: UseCaseDi.getCurrentMotherPregnancyId,
    getMotherTfuChart: KehamilankuUseCaseDi.obj.getMotherTfuChart,
    getMotherDjjChart: KehamilankuUseCaseDi.obj.getMotherDjjChart,
    getMotherBmiChart: KehamilankuUseCaseDi.obj.getMotherBmiChart,
    getMotherMapChart: KehamilankuUseCaseDi.obj.getMotherMapChart,
    getMotherTfuChartWarning: KehamilankuUseCaseDi.obj.getMotherTfuChartWarning,
    getMotherDjjChartWarning: KehamilankuUseCaseDi.obj.getMotherDjjChartWarning,
    getMotherBmiChartWarning: KehamilankuUseCaseDi.obj.getMotherBmiChartWarning,
    getMotherMapChartWarning: KehamilankuUseCaseDi.obj.getMotherMapChartWarning,
  );
}