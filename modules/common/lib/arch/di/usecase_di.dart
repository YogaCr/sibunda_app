import 'package:common/arch/di/data_source_di.dart';
import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:common/arch/domain/usecase/family_usecase.dart';
import 'package:common/arch/domain/usecase/firebase_usecase.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';


class UseCaseDi {
  UseCaseDi._();

  static UseCaseDiObj obj = UseCaseDiObjImpl();
}


abstract class UseCaseDiObj {
  GetFcmToken get getFcmToken;
  SaveFcmToken get saveFcmToken;

  GetCityList get getCityList;
  GetCityById get getCityById;
  IsLoggedIn get isLoggedIn;
  CheckEmailAvailability get checkEmailAvailability;
  Logout get logout;
  ClearUserData get clearUserData;
  InitConfig get initConfig;

  ToLoginPage get toLoginPage;

  GetMotherNik get getMotherNik;
  GetBabyNik get getBabyNik;
  GetProfile get getProfile;
  GetFamilyProfile get getFamilyProfile;
  GetMotherData get getMotherData;
  GetFatherData get getFatherData;
  GetChildData get getChildData;
  GetCurrentEmail get getCurrentEmail;
  GetPregnancyCheckUpId get getPregnancyCheckUpId;
  /*
  static GetCurrentMotherHpl get getCurrentMotherHpl => GetMotherHplImpl(RepoDi.motherRepo);
  static DeleteCurrentMotherHpl get deleteCurrentMotherHpl => DeleteCurrentMotherHplImpl(RepoDi.motherRepo);
  static GetCurrentMotherHpht get getCurrentMotherHpht => GetCurrentMotherHphtImpl(RepoDi.motherRepo);

  static GetCurrentMotherPregnancyId get getCurrentMotherPregnancyId => GetCurrentMotherPregnancyIdImpl(RepoDi.motherRepo);
   */
  GetMotherHpl get getMotherHpl;
  GetMotherPregnancy get getMotherPregnancy;
  SaveMotherPregnancy get saveMotherPregnancy;

  GetBornBabyList get getBornBabyList;
  GetUnbornBabyList get getUnbornBabyList;
  IsBabyBorn get isBabyBorn;
}

class UseCaseDiObjImpl extends UseCaseDiObj {
  @override
  GetFcmToken get getFcmToken => GetFcmTokenImpl(RepoDi.obj.firebaseRepo);
  @override
  SaveFcmToken get saveFcmToken => SaveFcmTokenImpl(RepoDi.obj.firebaseRepo);

  @override
  GetCityList get getCityList => GetCityListImpl(RepoDi.obj.dataRepo);
  @override
  GetCityById get getCityById => GetCityByIdImpl(RepoDi.obj.dataRepo);
  @override
  IsLoggedIn get isLoggedIn => IsLoggedInImpl(RepoDi.obj.authRepo);
  @override
  CheckEmailAvailability get checkEmailAvailability => CheckEmailAvailabilityImpl(RepoDi.obj.authRepo);
  @override
  Logout get logout => LogoutImpl(RepoDi.obj.authRepo);
  @override
  ClearUserData get clearUserData => ClearUserDataImpl(RepoDi.obj.authRepo);
  @override
  InitConfig get initConfig => InitConfigImpl(LocalSrcDi.obj.accountSrc);

  @override
  ToLoginPage get toLoginPage => ToLoginPageImpl();

  @override
  GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.obj.motherRepo);
  @override
  GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.obj.myBabyRepo);
  @override
  GetProfile get getProfile => GetProfileImpl(RepoDi.obj.profileRepo);
  @override
  GetFamilyProfile get getFamilyProfile => GetFamilyProfileImpl(RepoDi.obj.profileRepo);
  @override
  GetMotherData get getMotherData => GetMotherDataImpl(RepoDi.obj.motherRepo);
  @override
  GetFatherData get getFatherData => GetFatherDataImpl(RepoDi.obj.fatherRepo);
  @override
  GetChildData get getChildData => GetChildDataImpl(RepoDi.obj.childRepo);
  @override
  GetCurrentEmail get getCurrentEmail => GetCurrentEmailImpl(RepoDi.obj.profileRepo);
  @override
  GetPregnancyCheckUpId get getPregnancyCheckUpId => GetPregnancyCheckUpIdImpl(RepoDi.obj.pregnancyRepo);
  /*
  static GetCurrentMotherHpl get getCurrentMotherHpl => GetMotherHplImpl(RepoDi.motherRepo);
  static DeleteCurrentMotherHpl get deleteCurrentMotherHpl => DeleteCurrentMotherHplImpl(RepoDi.motherRepo);
  static GetCurrentMotherHpht get getCurrentMotherHpht => GetCurrentMotherHphtImpl(RepoDi.motherRepo);

  static GetCurrentMotherPregnancyId get getCurrentMotherPregnancyId => GetCurrentMotherPregnancyIdImpl(RepoDi.motherRepo);
   */
  @override
  GetMotherHpl get getMotherHpl => GetMotherHplImpl(RepoDi.obj.motherRepo);
  @override
  GetMotherPregnancy get getMotherPregnancy => GetMotherPregnancyImpl(RepoDi.obj.motherRepo);
  @override
  SaveMotherPregnancy get saveMotherPregnancy => SaveMotherPregnancyImpl(RepoDi.obj.motherRepo);

  @override
  GetBornBabyList get getBornBabyList => GetBornBabyListImpl(RepoDi.obj.myBabyRepo);
  @override
  GetUnbornBabyList get getUnbornBabyList => GetUnbornBabyListImpl(RepoDi.obj.myBabyRepo);
  @override
  IsBabyBorn get isBabyBorn => IsBabyBornImpl(RepoDi.obj.childRepo);
}