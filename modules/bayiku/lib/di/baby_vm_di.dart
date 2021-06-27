import 'package:bayiku/core/di/baby_usecase_di.dart';
import 'package:bayiku/ui/check_form/baby_check_form_vm.dart';
import 'package:bayiku/ui/home/baby_home_vm.dart';

class BabyVmDi {
  BabyVmDi._();
  static final obj = BabyVmDi._();

  static BabyHomeVm get babyHomeVm => BabyHomeVm(
    getBabyAgeOverview: BabyUseCaseDi.getBabyAgeOverview,
    getBabyFormMenuList: BabyUseCaseDi.getBabyFormMenuList,
  );
  static BabyCheckFormVm get babyCheckFormVm => BabyCheckFormVm(
    getBabyCheckForm: BabyUseCaseDi.getBabyCheckForm,
  );
}