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

  static KehamilankuHomeVm kehamilankuHomeVm({BuildContext? context,}) => KehamilankuHomeVm(
    context: context,
    getPregnancyAgeOverview: KehamilankuUseCaseDi.getPregnancyAgeOverview,
    getTrimesterList: KehamilankuUseCaseDi.getTrimesterList,
    getMotherFoodRecomList: KehamilankuUseCaseDi.getMotherFoodRecomList,
    getBornBabyList: UseCaseDi.getBornBabyList,
    getUnbornBabyList: UseCaseDi.getUnbornBabyList,
  );
  static KehamilankuCheckFormVm checkFormVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => KehamilankuCheckFormVm(
    context: context,
    pregnancyId: pregnancyCred,
    getPregnancyCheckUpId: UseCaseDi.getPregnancyCheckUpId,
    getPregnancyCheck: KehamilankuUseCaseDi.getPregnancyCheck,
    savePregnancyCheck: KehamilankuUseCaseDi.savePregnancyCheck,
    saveUsgImg: KehamilankuUseCaseDi.saveUsgImg,
    getMotherFormWarningStatus: KehamilankuUseCaseDi.getMotherFormWarningStatus,
    getPregnancyBabySize: KehamilankuUseCaseDi.getPregnancyBabySize,
    getPregnancyCheckForm: KehamilankuUseCaseDi.getPregnancyCheckForm,
    getCurrentMotherHpl: UseCaseDi.getCurrentMotherHpl,
    getCurrentMotherHpht: UseCaseDi.getCurrentMotherHpht,
    //getMotherNik: UseCaseDi.getMotherNik,
  );
  static PregnancyImmunizationVm immunizationVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => PregnancyImmunizationVm(
    context: context,
    pregnancyId: pregnancyCred,
    getMotherImmunizationGroupList: KehamilankuUseCaseDi.getMotherImmunizationGroupList,
    getMotherImmunizationOverview: KehamilankuUseCaseDi.getMotherImmunizationOverview,
  );
  static PregnancyImmunizationPopupVm immunizationPopupVm({
    required ImmunizationData immunization,
    required ProfileCredential pregnancyCred,
    BuildContext? context,
  }) => PregnancyImmunizationPopupVm(
    context: context,
    pregnancyId: pregnancyCred,
    immunization: immunization,
    getMotherNik: UseCaseDi.getMotherNik,
    getPregnancyImmunizationConfirmForm: KehamilankuUseCaseDi.getPregnancyImmunizationConfirmForm,
    confirmMotherImmunization: KehamilankuUseCaseDi.confirmMotherImmunization,
  );
  static MotherPregEvalChartMenuVm pregEvalChartMenuVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => MotherPregEvalChartMenuVm(
    context: context,
    pregnancyId: pregnancyCred,
    getMotherPregEvalGraphMenu: KehamilankuUseCaseDi.getMotherPregEvalGraphMenu,
  );
  static MotherChartVm motherChartVm({
    BuildContext? context,
    required ProfileCredential pregnancyCred,
  }) => MotherChartVm(
    context: context,
    pregnancyId: pregnancyCred,
    //getMotherNik: UseCaseDi.getMotherNik,
    //getCurrentMotherPregnancyId: UseCaseDi.getCurrentMotherPregnancyId,
    getMotherTfuChart: KehamilankuUseCaseDi.getMotherTfuChart,
    getMotherDjjChart: KehamilankuUseCaseDi.getMotherDjjChart,
    getMotherBmiChart: KehamilankuUseCaseDi.getMotherBmiChart,
    getMotherMapChart: KehamilankuUseCaseDi.getMotherMapChart,
    getMotherTfuChartWarning: KehamilankuUseCaseDi.getMotherTfuChartWarning,
    getMotherDjjChartWarning: KehamilankuUseCaseDi.getMotherDjjChartWarning,
    getMotherBmiChartWarning: KehamilankuUseCaseDi.getMotherBmiChartWarning,
    getMotherMapChartWarning: KehamilankuUseCaseDi.getMotherMapChartWarning,
  );
}