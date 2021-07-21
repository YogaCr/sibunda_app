import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';

class UseCaseDi {
  UseCaseDi._();

  static GetCityList get getCityList => GetCityListImpl(RepoDi.dataRepo);
  static IsLoggedIn get isLoggedIn => IsLoggedInImpl(RepoDi.authRepo);

  static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);
  static GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.myBabyRepo);
  static GetProfile get getProfile => GetProfileImpl(RepoDi.profileRepo);
  static GetCurrentEmail get getCurrentEmail => GetCurrentEmailImpl(RepoDi.profileRepo);
  static GetPregnancyCheckUpId get getPregnancyCheckUpId => GetPregnancyCheckUpIdImpl(RepoDi.pregnancyRepo);
  static GetMotherHpl get getMotherHpl => GetMotherHplImpl(RepoDi.motherRepo);
  static DeleteCurrentMotherHpl get deleteCurrentMotherHpl => DeleteCurrentMotherHplImpl(RepoDi.motherRepo);
  static GetMotherHpht get getMotherHpht => GetMotherHphtImpl(RepoDi.motherRepo);

  static GetBornBabyList get getBornBabyList => GetBornBabyListImpl(RepoDi.myBabyRepo);
  static GetUnbornBabyList get getUnbornBabyList => GetUnbornBabyListImpl(RepoDi.myBabyRepo);
}