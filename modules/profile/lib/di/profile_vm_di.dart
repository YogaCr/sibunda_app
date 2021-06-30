import 'package:common/arch/di/usecase_di.dart';
import 'package:profile/core/di/profile_usecase_di.dart';
import 'package:profile/ui/edit/profile_edit_vm.dart';
import 'package:profile/ui/home/profile_home_vm.dart';

class ProfileVmDi {
  ProfileVmDi._();

  static ProfileHomeVm get profileHomeVm => ProfileHomeVm(
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getProfile: UseCaseDi.getProfile,
  );
  static ProfileEditVm get profileEditVm => ProfileEditVm(
    saveProfile: ProfileUseCaseDi.saveProfile,
  );
}