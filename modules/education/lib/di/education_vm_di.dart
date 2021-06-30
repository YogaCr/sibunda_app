import 'package:common/arch/di/usecase_di.dart';
import 'package:education/core/di/education_usecase_di.dart';
import 'package:education/ui/detail/education_detail_vm.dart';
import 'package:education/ui/home/education_home_vm.dart';

class EducationVmDi {
  EducationVmDi._();

  static EducationHomeVm get educationHomeVm => EducationHomeVm(
    getMotherNik: UseCaseDi.getMotherNik,
    getEducationMainPanelData: EducationUseCaseDi.getEducationMainPanelData,
    getEducationHomeTipsData: EducationUseCaseDi.getEducationHomeTipsData,
  );
  static EducationDetailVm get educationDetailVm => EducationDetailVm(
    getEducationDetail: EducationUseCaseDi.getEducationDetail,
  );
}