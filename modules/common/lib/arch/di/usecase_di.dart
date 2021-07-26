import 'package:common/arch/di/data_source_di.dart';
import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:common/arch/domain/usecase/firebase_usecase.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';

class UseCaseDi {
  UseCaseDi._();

  static GetFcmToken get getFcmToken => GetFcmTokenImpl(RepoDi.firebaseRepo);
  static SaveFcmToken get saveFcmToken => SaveFcmTokenImpl(RepoDi.firebaseRepo);

  static GetCityList get getCityList => GetCityListImpl(RepoDi.dataRepo);
  static IsLoggedIn get isLoggedIn => IsLoggedInImpl(RepoDi.authRepo);
  static Logout get logout => LogoutImpl(RepoDi.authRepo);
  static ClearUserData get clearUserData => ClearUserDataImpl(RepoDi.authRepo);
  static InitConfig get initConfig => InitConfigImpl(LocalSrcDi.accountSrc);

  static ToLoginPage get toLoginPage => ToLoginPageImpl();

  static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);
  static GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.myBabyRepo);
  static GetProfile get getProfile => GetProfileImpl(RepoDi.profileRepo);
  static GetCurrentEmail get getCurrentEmail => GetCurrentEmailImpl(RepoDi.profileRepo);
  static GetPregnancyCheckUpId get getPregnancyCheckUpId => GetPregnancyCheckUpIdImpl(RepoDi.pregnancyRepo);
  /*
  static GetCurrentMotherHpl get getCurrentMotherHpl => GetMotherHplImpl(RepoDi.motherRepo);
  static DeleteCurrentMotherHpl get deleteCurrentMotherHpl => DeleteCurrentMotherHplImpl(RepoDi.motherRepo);
  static GetCurrentMotherHpht get getCurrentMotherHpht => GetCurrentMotherHphtImpl(RepoDi.motherRepo);

  static GetCurrentMotherPregnancyId get getCurrentMotherPregnancyId => GetCurrentMotherPregnancyIdImpl(RepoDi.motherRepo);
   */
  static GetMotherHpl get getMotherHpl => GetMotherHplImpl(RepoDi.motherRepo);
  static GetMotherPregnancy get getMotherPregnancy => GetMotherPregnancyImpl(RepoDi.motherRepo);
  static SaveMotherPregnancy get saveMotherPregnancy => SaveMotherPregnancyImpl(RepoDi.motherRepo);

  static GetBornBabyList get getBornBabyList => GetBornBabyListImpl(RepoDi.myBabyRepo);
  static GetUnbornBabyList get getUnbornBabyList => GetUnbornBabyListImpl(RepoDi.myBabyRepo);
  static IsBabyBorn get isBabyBorn => IsBabyBornImpl(RepoDi.childRepo);
}