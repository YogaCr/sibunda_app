import 'package:common/arch/di/repo_di.dart';
import 'package:education/core/domain/usecase/education_detail_usecase.dart';
import 'package:education/core/domain/usecase/education_home_usecase.dart';


class EducationUseCaseDi {
  EducationUseCaseDi._();

  static EducationUseCaseDiObj obj = EducationUseCaseDiObjImpl();
}

abstract class EducationUseCaseDiObj {
  GetEducationMainPanelData get getEducationMainPanelData;
  GetEducationHomeTipsData get getEducationHomeTipsData;

  GetEducationDetail get getEducationDetail;
}
class EducationUseCaseDiObjImpl extends EducationUseCaseDiObj {
  @override
  GetEducationMainPanelData get getEducationMainPanelData => GetEducationMainPanelDataImpl(RepoDi.obj.educationRepo);
  @override
  GetEducationHomeTipsData get getEducationHomeTipsData => GetEducationHomeTipsDataImpl(RepoDi.obj.educationRepo);

  @override
  GetEducationDetail get getEducationDetail => GetEducationDetailImpl(RepoDi.obj.educationRepo);
}