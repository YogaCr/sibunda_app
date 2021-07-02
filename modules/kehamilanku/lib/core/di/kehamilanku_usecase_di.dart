import 'package:common/arch/di/repo_di.dart';
import 'package:kehamilanku/core/domain/usecase/home_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/mother_chart_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/mother_graph_menu_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/mother_immunization_use_case.dart';
//import 'package:kehamilanku/core/domain/usecase/mother_overall_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/pregnancy_check_use_case.dart';

class KehamilankuUseCaseDi {
  KehamilankuUseCaseDi._();

  //static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);

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

  static GetMotherPregEvalGraphMenu get getMotherPregEvalGraphMenu => GetMotherPregEvalGraphMenuImpl(RepoDi.motherRepo);

  static GetMotherTfuChart get getMotherTfuChart => GetMotherTfuChartImpl(RepoDi.motherChartRepo);
  static GetMotherDjjChart get getMotherDjjChart => GetMotherDjjChartImpl(RepoDi.motherChartRepo);
  static GetMotherBmiChart get getMotherBmiChart => GetMotherBmiChartImpl(RepoDi.motherChartRepo);
  static GetMotherMapChart get getMotherMapChart => GetMotherMapChartImpl(RepoDi.motherChartRepo);
  static GetMotherTfuChartWarning get getMotherTfuChartWarning => GetMotherTfuChartWarningImpl(RepoDi.motherChartRepo);
  static GetMotherDjjChartWarning get getMotherDjjChartWarning => GetMotherDjjChartWarningImpl(RepoDi.motherChartRepo);
  static GetMotherBmiChartWarning get getMotherBmiChartWarning => GetMotherBmiChartWarningImpl(RepoDi.motherChartRepo);
  static GetMotherMapChartWarning get getMotherMapChartWarning => GetMotherMapChartWarningImpl(RepoDi.motherChartRepo);
}