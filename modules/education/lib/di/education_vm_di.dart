import 'package:common/arch/di/usecase_di.dart';
import 'package:education/core/di/education_usecase_di.dart';
import 'package:education/ui/detail/education_detail_vm.dart';
import 'package:education/ui/home/education_home_vm.dart';
import 'package:flutter/material.dart';

class EducationVmDi {
  EducationVmDi._();

  static EducationHomeVm educationHomeVm({BuildContext? context,}) => EducationHomeVm(
    context: context,
    getMotherNik: UseCaseDi.getMotherNik,
    getEducationMainPanelData: EducationUseCaseDi.getEducationMainPanelData,
    getEducationHomeTipsData: EducationUseCaseDi.getEducationHomeTipsData,
  );
  static EducationDetailVm educationDetailVm({BuildContext? context,}) => EducationDetailVm(
    context: context,
    getEducationDetail: EducationUseCaseDi.getEducationDetail,
  );
}