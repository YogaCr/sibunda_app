import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';
import 'package:home/core/di/home_usecase_di.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';
import 'package:home/ui/form_get_started/children_count_vm.dart';
import 'package:home/ui/form_get_started/do_mother_have_pregnancy_vm.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';
import 'package:home/ui/form_get_started/get_started_form_main_vm.dart';
import 'package:home/ui/form_get_started/mother_form_vm.dart';
import 'package:home/ui/form_get_started/mother_hpl_vm.dart';
import 'package:home/ui/home/home_vm.dart';
import 'package:home/ui/home/notif_and_message_vm.dart';
import 'package:home/ui/login/login_vm.dart';
import 'package:home/ui/signup/sign_up_vm.dart';
import 'package:home/ui/splash/splash_vm.dart';


class HomeVmDi {
  HomeVmDi._();

  static HomeVmDiObj obj = HomeVmDiObjImpl();
/*
  static SplashVm get splashVm => SplashVm(
    getCityList: UseCaseDi.getCityList,
    isLoggedInUseCase: UseCaseDi.isLoggedIn,
    initConfig: UseCaseDi.initConfig,
  );
  static GetStartedFormMainVm getStartedFormMainVm({
    BuildContext? context,
  }) => GetStartedFormMainVm(
    context: context,
    getFcmToken: UseCaseDi.getFcmToken,
    signUpAndRegisterOtherData: HomeUseCaseDi.signUpAndRegister,
    login: HomeUseCaseDi.login,
    initConfig: UseCaseDi.initConfig,
    //saveMotherHpl: HomeUseCaseDi.saveMotherHpl,
  );
  static SignUpFormVm get signUpFormVm => SignUpFormVm(
    saveSignupData: HomeUseCaseDi.signUp,
    checkEmailAvailability: UseCaseDi.checkEmailAvailability,
  );
  static LoginFormVm get loginFormVm => LoginFormVm(
    login: HomeUseCaseDi.login,
    getFcmToken: UseCaseDi.getFcmToken,
  );
  static MotherFormVm get motherFormVm => MotherFormVm(HomeUseCaseDi.saveMotherData);
  static FatherFormVm get fatherFormVm => FatherFormVm(HomeUseCaseDi.saveFatherData);
  static MotherHplVm motherHplVm({
    BuildContext? context,
  }) => MotherHplVm(
    context: context,
    getMotherNik: UseCaseDi.getMotherNik,
    //saveMotherPregnancy: UseCaseDi.saveMotherPregnancy,
    saveMotherHpl: HomeUseCaseDi.saveMotherHpl,
  );
  static DoMotherHavePregnancyVm get doMotherHavePregnancyVm => DoMotherHavePregnancyVm(
    deleteCurrentMotherHpl: HomeUseCaseDi.deleteCurrentMotherHpl,
  );
  static ChildrenCountVm get childrenCountVm => ChildrenCountVm(
    //saveLastChildBirthDate: HomeUseCaseDi.saveLastChildBirthDate,
    saveChildrenCount: HomeUseCaseDi.saveChildrenCount,
  );
  static ChildFormVm childFormVm({
    BuildContext? context,
    LiveData<int>? childCount,
    ProfileCredential? pregnancyId,
  }) => ChildFormVm(
    context: context,
    pregnancyId: pregnancyId,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    childCount: childCount ?? MutableLiveData(1),
    saveChildrenData: HomeUseCaseDi.saveChildrenData,
  );
  static HomeVm homeVm({BuildContext? context,}) => HomeVm(
    context: context,
    getHomeMenuList: HomeUseCaseDi.getHomeMenuList,
    getHomeStatusList: HomeUseCaseDi.getHomeStatusList,
    getHomeTipsList: HomeUseCaseDi.getHomeTipsList,
    getMotherNik: UseCaseDi.getMotherNik,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getProfile: UseCaseDi.getProfile,
  );
  static NotifAndMessageVm notifAndMessageVm({BuildContext? context,}) => NotifAndMessageVm(
    context: context,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getMessageList: HomeUseCaseDi.getMessageList,
    getNotifList: HomeUseCaseDi.getNotifList,
  );
 */
}


abstract class HomeVmDiObj {
  SplashVm get splashVm;
  GetStartedFormMainVm getStartedFormMainVm({
    BuildContext? context,
  });
  SignUpFormVm get signUpFormVm;
  LoginFormVm get loginFormVm;
  MotherFormVm get motherFormVm;
  FatherFormVm get fatherFormVm;
  MotherHplVm motherHplVm({
    BuildContext? context,
  });
  DoMotherHavePregnancyVm get doMotherHavePregnancyVm;
  ChildrenCountVm get childrenCountVm;
  ChildFormVm childFormVm({
    BuildContext? context,
    LiveData<int>? childCount,
    ProfileCredential? pregnancyId,
  });
  HomeVm homeVm({BuildContext? context,});
  NotifAndMessageVm notifAndMessageVm({BuildContext? context,});
}

class HomeVmDiObjImpl extends HomeVmDiObj {
  @override
  SplashVm get splashVm => SplashVm(
    getCityList: UseCaseDi.obj.getCityList,
    isLoggedInUseCase: UseCaseDi.obj.isLoggedIn,
    initConfig: UseCaseDi.obj.initConfig,
  );
  @override
  GetStartedFormMainVm getStartedFormMainVm({
    BuildContext? context,
  }) => GetStartedFormMainVm(
    context: context,
    getFcmToken: UseCaseDi.obj.getFcmToken,
    signUpAndRegisterOtherData: HomeUseCaseDi.obj.signUpAndRegister,
    login: HomeUseCaseDi.obj.login,
    initConfig: UseCaseDi.obj.initConfig,
    //saveMotherHpl: HomeUseCaseDi.saveMotherHpl,
  );
  @override
  SignUpFormVm get signUpFormVm => SignUpFormVm(
    saveSignupData: HomeUseCaseDi.obj.signUp,
    checkEmailAvailability: UseCaseDi.obj.checkEmailAvailability,
  );
  @override
  LoginFormVm get loginFormVm => LoginFormVm(
    login: HomeUseCaseDi.obj.login,
    getFcmToken: UseCaseDi.obj.getFcmToken,
  );
  @override
  MotherFormVm get motherFormVm => MotherFormVm(HomeUseCaseDi.obj.saveMotherData);
  @override
  FatherFormVm get fatherFormVm => FatherFormVm(HomeUseCaseDi.obj.saveFatherData);
  @override
  MotherHplVm motherHplVm({
    BuildContext? context,
  }) => MotherHplVm(
    context: context,
    getMotherNik: UseCaseDi.obj.getMotherNik,
    //saveMotherPregnancy: UseCaseDi.saveMotherPregnancy,
    saveMotherHpl: HomeUseCaseDi.obj.saveMotherHpl,
  );
  @override
  DoMotherHavePregnancyVm get doMotherHavePregnancyVm => DoMotherHavePregnancyVm(
    deleteCurrentMotherHpl: HomeUseCaseDi.obj.deleteCurrentMotherHpl,
  );
  @override
  ChildrenCountVm get childrenCountVm => ChildrenCountVm(
    //saveLastChildBirthDate: HomeUseCaseDi.saveLastChildBirthDate,
    saveChildrenCount: HomeUseCaseDi.obj.saveChildrenCount,
  );
  @override
  ChildFormVm childFormVm({
    BuildContext? context,
    LiveData<int>? childCount,
    ProfileCredential? pregnancyId,
  }) => ChildFormVm(
    context: context,
    pregnancyId: pregnancyId,
    getCurrentEmail: UseCaseDi.obj.getCurrentEmail,
    childCount: childCount ?? MutableLiveData(1),
    saveChildrenData: HomeUseCaseDi.obj.saveChildrenData,
  );
  @override
  HomeVm homeVm({BuildContext? context,}) => HomeVm(
    context: context,
    getHomeMenuList: HomeUseCaseDi.obj.getHomeMenuList,
    getHomeStatusList: HomeUseCaseDi.obj.getHomeStatusList,
    getHomeTipsList: HomeUseCaseDi.obj.getHomeTipsList,
    getMotherNik: UseCaseDi.obj.getMotherNik,
    getCurrentEmail: UseCaseDi.obj.getCurrentEmail,
    getProfile: UseCaseDi.obj.getProfile,
  );
  @override
  NotifAndMessageVm notifAndMessageVm({BuildContext? context,}) => NotifAndMessageVm(
    context: context,
    getCurrentEmail: UseCaseDi.obj.getCurrentEmail,
    getMessageList: HomeUseCaseDi.obj.getMessageList,
    getNotifList: HomeUseCaseDi.obj.getNotifList,
  );
}