import 'package:bayiku/core/di/baby_usecase_di.dart';
import 'package:bayiku/ui/chart/baby_chart_vm.dart';
import 'package:bayiku/ui/chart/baby_growth_chart_menu_vm.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:bayiku/ui/growth_graph_menu/baby_growth_graph_menu_vm.dart';
import 'package:bayiku/ui/home/baby_home_vm.dart';
import 'package:bayiku/ui/immunization/baby_immunization_popup_vm.dart';
import 'package:bayiku/ui/immunization/baby_immunization_vm.dart';
import 'package:common/arch/domain/model/immunization.dart';

class BabyVmDi {
  BabyVmDi._();
  static final obj = BabyVmDi._();

  static BabyHomeVm get babyHomeVm => BabyHomeVm(
    getBabyAgeOverview: BabyUseCaseDi.getBabyAgeOverview,
    getBabyFormMenuList: BabyUseCaseDi.getBabyFormMenuList,
  );
  static BabyCheckFormVm get babyCheckFormVm => BabyCheckFormVm(
    getBabyCheckForm: BabyUseCaseDi.getBabyCheckForm,
  );
  static BabyImmunizationVm get babyImmunizationVm => BabyImmunizationVm(
    getBabyImmunizationGroupList: BabyUseCaseDi.getBabyImmunizationGroupList,
    getBabyImmunizationOverview: BabyUseCaseDi.getBabyImmunizationOverview,
  );
  static BabyImmunizationPopupVm immunizationPopupVm(ImmunizationData immunization) => BabyImmunizationPopupVm(
    immunization: immunization,
    getBabyNik: BabyUseCaseDi.getBabyNik,
    getBabyImmunizationConfirmForm: BabyUseCaseDi.getBabyImmunizationConfirmForm,
    confirmBabyImmunization: BabyUseCaseDi.confirmBabyImmunization,
  );
  static BabyGrowthChartMenuVm get growthChartMenuVm => BabyGrowthChartMenuVm(
      getBabyGrowthGraphMenu: BabyUseCaseDi.getBabyGrowthGraphMenu,
  );
  static BabyChartVm get chartVm => BabyChartVm(
    getBabyNik: BabyUseCaseDi.getBabyNik,
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