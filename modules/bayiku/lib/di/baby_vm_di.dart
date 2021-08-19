import 'package:bayiku/core/di/baby_usecase_di.dart';
import 'package:bayiku/ui/chart/baby_chart_vm.dart';
import 'package:bayiku/ui/chart/baby_growth_chart_menu_vm.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:bayiku/ui/home/baby_home_vm.dart';
import 'package:bayiku/ui/immunization/baby_immunization_popup_vm.dart';
import 'package:bayiku/ui/immunization/baby_immunization_vm.dart';
import 'package:bayiku/ui/neonatal_service/neonatal_service_vm.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:flutter/material.dart';


class BabyVmDi {
  BabyVmDi._();
  static BabyVmDiObj obj = BabyVmDiObjImpl();
}


abstract class BabyVmDiObj {
  BabyHomeVm babyHomeVm({BuildContext? context,});
  BabyCheckFormVm babyCheckFormVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  });
  NeonatalServiceVm neonatalServiceVm({
    BuildContext? context,
    required BabyFormId checkUpId,
  });
  BabyImmunizationVm babyImmunizationVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  });
  BabyImmunizationPopupVm immunizationPopupVm({
    BuildContext? context,
    required ImmunizationData immunization,
    required ProfileCredential babyCredential,
  });
  BabyGrowthChartMenuVm growthChartMenuVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  });
  BabyChartVm chartVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  });
}

class BabyVmDiObjImpl extends BabyVmDiObj {
  @override
  BabyHomeVm babyHomeVm({BuildContext? context,}) => BabyHomeVm(
    context: context,
    getBabyAgeOverview: BabyUseCaseDi.obj.getBabyAgeOverview,
    getBabyFormMenuList: BabyUseCaseDi.obj.getBabyFormMenuList,
    getBornBabyList: UseCaseDi.obj.getBornBabyList,
    getUnbornBabyList: UseCaseDi.obj.getUnbornBabyList,
  );
  @override
  BabyCheckFormVm babyCheckFormVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  }) => BabyCheckFormVm(
    context: context,
    credential: babyCredential,
    getBabyCheckForm: BabyUseCaseDi.obj.getBabyCheckForm,
    getBabyCheckFormAnswer: BabyUseCaseDi.obj.getBabyCheckFormAnswer,
    getBabyGrowthFormWarningStatus: BabyUseCaseDi.obj.getBabyFormWarningStatus,
    getBabyDevFormWarningStatus: BabyUseCaseDi.obj.getBabyDevFormWarningStatus,
    saveBabyCheckForm: BabyUseCaseDi.obj.saveBabyCheckForm,
  );
  @override
  NeonatalServiceVm neonatalServiceVm({
    BuildContext? context,
    required BabyFormId checkUpId,
  }) => NeonatalServiceVm(
    context: context,
    monthlyCheckUpId: checkUpId,
    getNeonatalFormData: BabyUseCaseDi.obj.getNeonatalFormData,
    getNeonatalFormAnswer: BabyUseCaseDi.obj.getNeonatalFormAnswer,
    saveNeonatalForm: BabyUseCaseDi.obj.saveNeonatalForm,
  );
  @override
  BabyImmunizationVm babyImmunizationVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  }) => BabyImmunizationVm(
    context: context,
    credential: babyCredential,
    getBabyImmunizationGroupList: BabyUseCaseDi.obj.getBabyImmunizationGroupList,
    getBabyImmunizationOverview: BabyUseCaseDi.obj.getBabyImmunizationOverview,
  );
  @override
  BabyImmunizationPopupVm immunizationPopupVm({
    BuildContext? context,
    required ImmunizationData immunization,
    required ProfileCredential babyCredential,
  }) => BabyImmunizationPopupVm(
    context: context,
    credential: babyCredential,
    immunization: immunization,
    getBabyImmunizationConfirmForm: BabyUseCaseDi.obj.getBabyImmunizationConfirmForm,
    confirmBabyImmunization: BabyUseCaseDi.obj.confirmBabyImmunization,
  );
  @override
  BabyGrowthChartMenuVm growthChartMenuVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  }) => BabyGrowthChartMenuVm(
    context: context,
    credential: babyCredential,
    getBabyGrowthGraphMenu: BabyUseCaseDi.obj.getBabyGrowthGraphMenu,
  );
  @override
  BabyChartVm chartVm({
    BuildContext? context,
    required ProfileCredential babyCredential,
  }) => BabyChartVm(
    context: context,
    credential: babyCredential,
    getBabyWeightChart: BabyUseCaseDi.obj.getBabyWeightChart,
    getBabyKmsChart: BabyUseCaseDi.obj.getBabyKmsChart,
    getBabyLenChart: BabyUseCaseDi.obj.getBabyLenChart,
    getBabyWeightToLenChart: BabyUseCaseDi.obj.getBabyWeightToLenChart,
    getBabyHeadCircumChart: BabyUseCaseDi.obj.getBabyHeadCircumChart,
    getBabyBmiChart: BabyUseCaseDi.obj.getBabyBmiChart,
    getBabyDevChart: BabyUseCaseDi.obj.getBabyDevChart,
    getBabyWeightChartWarning: BabyUseCaseDi.obj.getBabyWeightChartWarning,
    getBabyKmsChartWarning: BabyUseCaseDi.obj.getBabyKmsChartWarning,
    getBabyLenChartWarning: BabyUseCaseDi.obj.getBabyLenChartWarning,
    getBabyWeightToLenChartWarning: BabyUseCaseDi.obj.getBabyWeightToLenChartWarning,
    getBabyHeadCircumChartWarning: BabyUseCaseDi.obj.getBabyHeadCircumChartWarning,
    getBabyBmiChartWarning: BabyUseCaseDi.obj.getBabyBmiChartWarning,
    getBabyDevChartWarning: BabyUseCaseDi.obj.getBabyDevChartWarning,
  );
}