import 'package:bayiku/core/domain/usecase/baby_home_usecase.dart';
import 'package:common/arch/di/repo_di.dart';

class BabyUseCaseDi {
  BabyUseCaseDi._();
  static final obj = BabyUseCaseDi._();

  static GetBabyAgeOverview get getBabyAgeOverview => GetBabyAgeOverviewImpl(RepoDi.myBabyRepo);
  static GetBabyFormMenuList get getBabyFormMenuList => GetBabyFormMenuListImpl(RepoDi.myBabyRepo);
}