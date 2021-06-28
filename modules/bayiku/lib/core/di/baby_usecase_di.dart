import 'package:bayiku/core/domain/usecase/baby_check_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_home_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_immunization_use_case.dart';
import 'package:bayiku/core/domain/usecase/baby_overall_usecase.dart';
import 'package:common/arch/di/repo_di.dart';

class BabyUseCaseDi {
  BabyUseCaseDi._();
  static final obj = BabyUseCaseDi._();

  static GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.myBabyRepo);

  static GetBabyAgeOverview get getBabyAgeOverview => GetBabyAgeOverviewImpl(RepoDi.myBabyRepo);
  static GetBabyFormMenuList get getBabyFormMenuList => GetBabyFormMenuListImpl(RepoDi.myBabyRepo);
  static GetBabyCheckForm get getBabyCheckForm => GetBabyCheckFormImpl(RepoDi.formFieldRepo);

  static GetBabyImmunizationConfirmForm get getBabyImmunizationConfirmForm => GetBabyImmunizationConfirmFormImpl(RepoDi.formFieldRepo);
  static GetBabyImmunizationOverview get getBabyImmunizationOverview => GetBabyImmunizationOverviewImpl(RepoDi.immunizationRepo);
  static GetBabyImmunizationGroupList get getBabyImmunizationGroupList => GetBabyImmunizationGroupListImpl(RepoDi.immunizationRepo);
  static ConfirmBabyImmunization get confirmBabyImmunization => ConfirmBabyImmunizationImpl(RepoDi.immunizationRepo);
}