import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';

class UseCaseDi {
  UseCaseDi._();

  static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);
  static GetProfile get getProfile => GetProfileImpl(RepoDi.profileRepo);
  static GetCurrentEmail get getCurrentEmail => GetCurrentEmailImpl(RepoDi.profileRepo);
  static GetPregnancyCheckUpId get getPregnancyCheckUpId => GetPregnancyCheckUpIdImpl(RepoDi.pregnancyRepo);
}