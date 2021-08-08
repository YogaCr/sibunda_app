import 'package:common/arch/di/repo_di.dart';
import 'package:profile/core/domain/usecase/profile_edit_usecase.dart';


class ProfileUseCaseDi {
  ProfileUseCaseDi._();
  static ProfileUseCaseDiObj obj = ProfileUseCaseDiObjImpl();

  //static SaveProfile get saveProfile => SaveProfileImpl(RepoDi.profileRepo);
}


abstract class ProfileUseCaseDiObj {
  SaveProfile get saveProfile;
}
class ProfileUseCaseDiObjImpl extends ProfileUseCaseDiObj {
  @override
  SaveProfile get saveProfile => SaveProfileImpl(RepoDi.obj.profileRepo);
}