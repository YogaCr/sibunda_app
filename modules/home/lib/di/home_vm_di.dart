import 'package:home/core/di/home_usecase_di.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';
import 'package:home/ui/form_get_started/children_count_vm.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';
import 'package:home/ui/form_get_started/mother_form_vm.dart';
import 'package:home/ui/form_get_started/mother_hpl_vm.dart';
import 'package:home/ui/home/home_vm.dart';
import 'package:home/ui/home/notif_and_message_vm.dart';
import 'package:home/ui/login/login_vm.dart';
import 'package:home/ui/signup/sign_up_vm.dart';

class HomeVmDi {
  HomeVmDi._();

  static SignUpFormVm get signUpFormVm => SignUpFormVm(HomeUseCaseDi.signUp);
  static LoginFormVm get loginFormVm => LoginFormVm(HomeUseCaseDi.login);
  static MotherFormVm get motherFormVm => MotherFormVm(HomeUseCaseDi.saveMotherData);
  static FatherFormVm get fatherFormVm => FatherFormVm(HomeUseCaseDi.saveFatherData);
  static MotherHplVm get motherHplVm => MotherHplVm();
  static ChildrenCountVm get childrenCountVm => ChildrenCountVm();
  static ChildFormVm get childFormVm => ChildFormVm(HomeUseCaseDi.saveChildData);
  static HomeVm get homeVm => HomeVm(
    getHomeMenuList: HomeUseCaseDi.getHomeMenuList,
    getHomeStatusList: HomeUseCaseDi.getHomeStatusList,
    getHomeTipsList: HomeUseCaseDi.getHomeTipsList,
  );
  static NotifAndMessageVm get notifAndMessageVm => NotifAndMessageVm(
    getMessageList: HomeUseCaseDi.getMessageList,
    getNotifList: HomeUseCaseDi.getNotifList,
  );
}