import 'package:kehamilanku/core/di/kehamilanku_usecase_di.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_vm.dart';
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
  );
}