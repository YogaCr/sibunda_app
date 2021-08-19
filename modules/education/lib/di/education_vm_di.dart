import 'package:common/arch/di/usecase_di.dart';
import 'package:education/core/di/education_usecase_di.dart';
import 'package:education/ui/detail/education_detail_vm.dart';
import 'package:education/ui/home/education_home_vm.dart';
import 'package:flutter/material.dart';


class EducationVmDi {
  EducationVmDi._();

  static EducationVmDiObj obj = EducationVmDiObjImpl();
}


abstract class EducationVmDiObj {
  EducationHomeVm educationHomeVm({BuildContext? context,});
  EducationDetailVm educationDetailVm({BuildContext? context,});
}
class EducationVmDiObjImpl extends EducationVmDiObj {
  @override
  EducationHomeVm educationHomeVm({BuildContext? context,}) => EducationHomeVm(
    context: context,
    getMotherNik: UseCaseDi.obj.getMotherNik,
    getEducationMainPanelData: EducationUseCaseDi.obj.getEducationMainPanelData,
    getEducationHomeTipsData: EducationUseCaseDi.obj.getEducationHomeTipsData,
  );
  @override
  EducationDetailVm educationDetailVm({BuildContext? context,}) => EducationDetailVm(
    context: context,
    getEducationDetail: EducationUseCaseDi.obj.getEducationDetail,
  );
}