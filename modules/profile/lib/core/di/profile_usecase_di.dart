import 'package:common/arch/di/repo_di.dart';
import 'package:profile/core/domain/usecase/profile_edit_usecase.dart';

class ProfileUseCaseDi {
  ProfileUseCaseDi._();

  static SaveProfile get saveProfile => SaveProfileImpl(RepoDi.profileRepo);
}