import 'package:bayiku/core/di/baby_usecase_di.dart';
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
  static BabyGrowthGraphMenuVm get babyGrowthGraphMenuVm => BabyGrowthGraphMenuVm(
      getBabyGrowthGraphMenu: BabyUseCaseDi.getBabyGrowthGraphMenu,
  );
}