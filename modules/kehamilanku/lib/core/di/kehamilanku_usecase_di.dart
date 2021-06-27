import 'package:common/arch/di/repo_di.dart';
import 'package:kehamilanku/core/domain/usecase/home_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/mother_immunization_use_case.dart';
import 'package:kehamilanku/core/domain/usecase/mother_overall_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/pregnancy_check_use_case.dart';

class KehamilankuUseCaseDi {
  KehamilankuUseCaseDi._();

  static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);

  static GetPregnancyAgeOverview get getPregnancyAgeOverview => GetPregnancyAgeOverviewImpl(RepoDi.pregnancyRepo);
  static GetTrimesterList get getTrimesterList => GetTrimesterListImpl(RepoDi.pregnancyRepo);
  static GetMotherFoodRecomList get getMotherFoodRecomList => GetMotherFoodRecomListImpl(RepoDi.foodRepo);

  static GetPregnancyCheckForm get getPregnancyCheckForm => GetPregnancyCheckFormImpl(RepoDi.formFieldRepo);
  static SavePregnancyCheck get savePregnancyCheck => SavePregnancyCheckImpl(RepoDi.pregnancyCheckRepo);
  static GetPregnancyCheck get getPregnancyCheck => GetPregnancyCheckImpl(RepoDi.pregnancyCheckRepo);
  static GetMotherFormWarningStatus get getMotherFormWarningStatus => GetMotherFormWarningStatusImpl(RepoDi.formWarningStatusRepo);
  static GetPregnancyBabySize get getPregnancyBabySize => GetPregnancyBabySizeImpl(RepoDi.pregnancyRepo);

  static GetPregnancyImmunizationConfirmForm get getPregnancyImmunizationConfirmForm => GetPregnancyImmunizationConfirmFormImpl(RepoDi.formFieldRepo);
  static GetMotherImmunizationOverview get getMotherImmunizationOverview => GetMotherImmunizationOverviewImpl(RepoDi.immunizationRepo);
  static GetMotherImmunizationGroupList get getMotherImmunizationGroupList => GetMotherImmunizationGroupListImpl(RepoDi.immunizationRepo);
  static ConfirmMotherImmunization get confirmMotherImmunization => ConfirmMotherImmunizationImpl(RepoDi.immunizationRepo);
}