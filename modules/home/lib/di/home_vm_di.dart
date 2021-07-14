import 'package:common/arch/di/usecase_di.dart';
import 'package:core/ui/base/live_data.dart';
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

  static SplashVm get splashVm => SplashVm(getCityList: UseCaseDi.getCityList,);
  static GetStartedFormMainVm get getStartedFormMainVm => GetStartedFormMainVm(
    signUpAndRegisterOtherData: HomeUseCaseDi.signUpAndRegister,
    saveMotherHpl: HomeUseCaseDi.saveMotherHpl,
  );
  static SignUpFormVm get signUpFormVm => SignUpFormVm(HomeUseCaseDi.signUp);
  static LoginFormVm get loginFormVm => LoginFormVm(HomeUseCaseDi.login);
  static MotherFormVm get motherFormVm => MotherFormVm(HomeUseCaseDi.saveMotherData);
  static FatherFormVm get fatherFormVm => FatherFormVm(HomeUseCaseDi.saveFatherData);
  static MotherHplVm get motherHplVm => MotherHplVm(saveMotherHpl: HomeUseCaseDi.saveMotherHpl);
  static DoMotherHavePregnancyVm get doMotherHavePregnancyVm => DoMotherHavePregnancyVm(
    deleteCurrentMotherHpl: UseCaseDi.deleteCurrentMotherHpl,
  );
  static ChildrenCountVm get childrenCountVm => ChildrenCountVm(
    //saveLastChildBirthDate: HomeUseCaseDi.saveLastChildBirthDate,
    saveChildrenCount: HomeUseCaseDi.saveChildrenCount,
  );
  static ChildFormVm get childFormVm => ChildFormVm(
    childCount: MutableLiveData(),
    saveChildrenData: HomeUseCaseDi.saveChildrenData,
  );
  static HomeVm get homeVm => HomeVm(
    getHomeMenuList: HomeUseCaseDi.getHomeMenuList,
    getHomeStatusList: HomeUseCaseDi.getHomeStatusList,
    getHomeTipsList: HomeUseCaseDi.getHomeTipsList,
    getMotherNik: UseCaseDi.getMotherNik,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getProfile: UseCaseDi.getProfile,
  );
  static NotifAndMessageVm get notifAndMessageVm => NotifAndMessageVm(
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getMessageList: HomeUseCaseDi.getMessageList,
    getNotifList: HomeUseCaseDi.getNotifList,
  );
}