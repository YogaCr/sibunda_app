import 'package:bayiku/core/di/baby_usecase_di.dart';
import 'package:bayiku/ui/home/baby_home_vm.dart';

class BabyVmDi {
  BabyVmDi._();
  static final obj = BabyVmDi._();

  static BabyHomeVm get babyHomeVm => BabyHomeVm(
    getBabyAgeOverview: BabyUseCaseDi.getBabyAgeOverview,
    getBabyFormMenuList: BabyUseCaseDi.getBabyFormMenuList,
  );
}