import 'package:common/arch/di/repo_di.dart';
import 'package:education/core/domain/usecase/education_home_usecase.dart';

class EducationUseCaseDi {
  EducationUseCaseDi._();

  static GetEducationMainPanelData get getEducationMainPanelData => GetEducationMainPanelDataImpl(RepoDi.educationRepo);
  static GetEducationHomeTipsData get getEducationHomeTipsData => GetEducationHomeTipsDataImpl(RepoDi.educationRepo);
}