import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:kehamilanku/core/di/kehamilanku_usecase_di.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_vm.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_vm.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_vm.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_vm.dart';

class KehamilankuVmDi {
  KehamilankuVmDi._();

  static KehamilankuHomeVm get kehamilankuHomeVm => KehamilankuHomeVm(
    getPregnancyAgeOverview: KehamilankuUseCaseDi.getPregnancyAgeOverview,
    getTrimesterList: KehamilankuUseCaseDi.getTrimesterList,
    getMotherFoodRecomList: KehamilankuUseCaseDi.getMotherFoodRecomList,
  );
  static KehamilankuCheckFormVm get checkFormVm => KehamilankuCheckFormVm(
    getPregnancyCheck: KehamilankuUseCaseDi.getPregnancyCheck,
    savePregnancyCheck: KehamilankuUseCaseDi.savePregnancyCheck,
    getMotherFormWarningStatus: KehamilankuUseCaseDi.getMotherFormWarningStatus,
    getPregnancyBabySize: KehamilankuUseCaseDi.getPregnancyBabySize,
    getPregnancyCheckForm: KehamilankuUseCaseDi.getPregnancyCheckForm,
  );
  static PregnancyImmunizationVm get immunizationVm => PregnancyImmunizationVm(
    getMotherImmunizationGroupList: KehamilankuUseCaseDi.getMotherImmunizationGroupList,
    getMotherImmunizationOverview: KehamilankuUseCaseDi.getMotherImmunizationOverview,
  );
  static PregnancyImmunizationPopupVm immunizationPopupVm(ImmunizationData immunization) => PregnancyImmunizationPopupVm(
    immunization: immunization,
    getMotherNik: UseCaseDi.getMotherNik,
    getPregnancyImmunizationConfirmForm: KehamilankuUseCaseDi.getPregnancyImmunizationConfirmForm,
    confirmMotherImmunization: KehamilankuUseCaseDi.confirmMotherImmunization,
  );
}