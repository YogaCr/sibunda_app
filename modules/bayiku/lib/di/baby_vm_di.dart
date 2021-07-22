import 'package:bayiku/core/di/baby_usecase_di.dart';
import 'package:bayiku/ui/chart/baby_chart_vm.dart';
import 'package:bayiku/ui/chart/baby_growth_chart_menu_vm.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:bayiku/ui/home/baby_home_vm.dart';
import 'package:bayiku/ui/immunization/baby_immunization_popup_vm.dart';
import 'package:bayiku/ui/immunization/baby_immunization_vm.dart';
import 'package:bayiku/ui/neonatal_service/neonatal_service_vm.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/profile_data.dart';

class BabyVmDi {
  BabyVmDi._();
  static final obj = BabyVmDi._();

  static BabyHomeVm get babyHomeVm => BabyHomeVm(
    getBabyAgeOverview: BabyUseCaseDi.getBabyAgeOverview,
    getBabyFormMenuList: BabyUseCaseDi.getBabyFormMenuList,
    getBornBabyList: UseCaseDi.getBornBabyList,
    getUnbornBabyList: UseCaseDi.getUnbornBabyList,
  );
  static BabyCheckFormVm babyCheckFormVm({
    required ProfileCredential babyCredential,
  }) => BabyCheckFormVm(
    credential: babyCredential,
    getBabyCheckForm: BabyUseCaseDi.getBabyCheckForm,
    getBabyCheckFormAnswer: BabyUseCaseDi.getBabyCheckFormAnswer,
    getBabyFromWarningStatus: BabyUseCaseDi.getBabyFormWarningStatus,
    saveBabyCheckForm: BabyUseCaseDi.saveBabyCheckForm,
  );
  static NeonatalServiceVm get neonatalServiceVm => NeonatalServiceVm(
    getNeonatalFormData: BabyUseCaseDi.getNeonatalFormData,
    saveNeonatalForm: BabyUseCaseDi.saveNeonatalForm,
  );
  static BabyImmunizationVm babyImmunizationVm({
    required ProfileCredential babyCredential,
  }) => BabyImmunizationVm(
    credential: babyCredential,
    getBabyImmunizationGroupList: BabyUseCaseDi.getBabyImmunizationGroupList,
    getBabyImmunizationOverview: BabyUseCaseDi.getBabyImmunizationOverview,
  );
  static BabyImmunizationPopupVm immunizationPopupVm({
    required ImmunizationData immunization,
    required ProfileCredential babyCredential,
  }) => BabyImmunizationPopupVm(
    credential: babyCredential,
    immunization: immunization,
    getBabyImmunizationConfirmForm: BabyUseCaseDi.getBabyImmunizationConfirmForm,
    confirmBabyImmunization: BabyUseCaseDi.confirmBabyImmunization,
  );
  static BabyGrowthChartMenuVm growthChartMenuVm(ProfileCredential babyCredential) => BabyGrowthChartMenuVm(
    credential: babyCredential,
    getBabyGrowthGraphMenu: BabyUseCaseDi.getBabyGrowthGraphMenu,
  );
  static BabyChartVm chartVm({
    required ProfileCredential babyCredential,
  }) => BabyChartVm(
    credential: babyCredential,
    getBabyWeightChart: BabyUseCaseDi.getBabyWeightChart,
    getBabyKmsChart: BabyUseCaseDi.getBabyKmsChart,
    getBabyLenChart: BabyUseCaseDi.getBabyLenChart,
    getBabyWeightToLenChart: BabyUseCaseDi.getBabyWeightToLenChart,
    getBabyHeadCircumChart: BabyUseCaseDi.getBabyHeadCircumChart,
    getBabyBmiChart: BabyUseCaseDi.getBabyBmiChart,
    getBabyDevChart: BabyUseCaseDi.getBabyDevChart,
    getBabyWeightChartWarning: BabyUseCaseDi.getBabyWeightChartWarning,
    getBabyKmsChartWarning: BabyUseCaseDi.getBabyKmsChartWarning,
    getBabyLenChartWarning: BabyUseCaseDi.getBabyLenChartWarning,
    getBabyWeightToLenChartWarning: BabyUseCaseDi.getBabyWeightToLenChartWarning,
    getBabyHeadCircumChartWarning: BabyUseCaseDi.getBabyHeadCircumChartWarning,
    getBabyBmiChartWarning: BabyUseCaseDi.getBabyBmiChartWarning,
    getBabyDevChartWarning: BabyUseCaseDi.getBabyDevChartWarning,
  );
}