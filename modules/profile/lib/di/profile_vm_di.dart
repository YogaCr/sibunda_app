import 'package:common/arch/di/usecase_di.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/di/profile_usecase_di.dart';
import 'package:profile/ui/edit/profile_edit_vm.dart';
import 'package:profile/ui/edit_family/edit_family_home_vm.dart';
import 'package:profile/ui/home/profile_home_vm.dart';


class ProfileVmDi {
  ProfileVmDi._();
  static ProfileVmDiObj obj = ProfileVmDiObjImpl();
}


abstract class ProfileVmDiObj {
  ProfileHomeVm profileHomeVm({BuildContext? context,});
  ProfileEditVm profileEditVm({BuildContext? context,});
  EditFamilyHomeVm editFamilyHomeVm({BuildContext? context,});
}

class ProfileVmDiObjImpl extends ProfileVmDiObj {
  @override
  ProfileHomeVm profileHomeVm({BuildContext? context,}) => ProfileHomeVm(
    context: context,
    getCurrentEmail: UseCaseDi.obj.getCurrentEmail,
    getProfile: UseCaseDi.obj.getProfile,
    logout: UseCaseDi.obj.logout,
    toLoginPage: UseCaseDi.obj.toLoginPage,
  );
  @override
  ProfileEditVm profileEditVm({BuildContext? context,}) => ProfileEditVm(
    context: context,
    checkEmailAvailability: UseCaseDi.obj.checkEmailAvailability,
    saveProfile: ProfileUseCaseDi.obj.saveProfile,
  );
  @override
  EditFamilyHomeVm editFamilyHomeVm({BuildContext? context,}) => EditFamilyHomeVm(
    context: context,
    getFamilyProfile: UseCaseDi.obj.getFamilyProfile,
    getCurrentEmail: UseCaseDi.obj.getCurrentEmail,
  );
}