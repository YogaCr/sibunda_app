import 'package:home/core/domain/usecase/_auth_usecase.dart';
import 'package:common/arch/di/repo_di.dart';
import 'package:home/core/domain/usecase/home_page_use_case.dart';
import 'package:home/core/domain/usecase/notif_and_message_use_case.dart';
import 'package:home/core/domain/usecase/save_child_data_use_case.dart';
import 'package:home/core/domain/usecase/save_father_data_use_case.dart';
import 'package:home/core/domain/usecase/save_mother_data_use_case.dart';

class HomeUseCaseDi {
  HomeUseCaseDi._();
  static final obj = HomeUseCaseDi._();

  static SignUp get signUp => SignUpImpl(RepoDi.authRepo);
  static Login get login => LoginImpl(RepoDi.authRepo);
  static Logout get logout => LogoutImpl(RepoDi.authRepo);
  static SaveMotherData get saveMotherData => SaveMotherDataImpl(RepoDi.motherRepo);
  static SaveFatherData get saveFatherData => SaveFatherDataImpl(RepoDi.fatherRepo);
  static SaveChildData get saveChildData => SaveChildDataImpl(RepoDi.childRepo);

  static GetHomeStatusList get getHomeStatusList => GetHomeStatusListImpl(RepoDi.homeStatusRepo);
  static GetHomeMenuList get getHomeMenuList => GetHomeMenuListImpl(RepoDi.homeMenuRepo);
  static GetHomeTipsList get getHomeTipsList => GetHomeTipsListImpl(RepoDi.tipsRepo);

  static GetNotifList get getNotifList => GetNotifListImpl(RepoDi.notifRepo);
  static GetMessageList get getMessageList => GetMessageListImpl(RepoDi.notifRepo);
}