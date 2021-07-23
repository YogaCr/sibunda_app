import 'package:common/arch/di/usecase_di.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/di/profile_usecase_di.dart';
import 'package:profile/ui/edit/profile_edit_vm.dart';
import 'package:profile/ui/home/profile_home_vm.dart';

class ProfileVmDi {
  ProfileVmDi._();

  static ProfileHomeVm profileHomeVm({BuildContext? context,}) => ProfileHomeVm(
    context: context,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getProfile: UseCaseDi.getProfile,
    logout: UseCaseDi.logout,
    toLoginPage: UseCaseDi.toLoginPage,
  );
  static ProfileEditVm profileEditVm({BuildContext? context,}) => ProfileEditVm(
    context: context,
    saveProfile: ProfileUseCaseDi.saveProfile,
  );
}