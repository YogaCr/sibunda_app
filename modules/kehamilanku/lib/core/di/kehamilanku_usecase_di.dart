import 'package:common/arch/di/repo_di.dart';
import 'package:kehamilanku/core/domain/usecase/home_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/mother_chart_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/mother_graph_menu_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/mother_immunization_use_case.dart';
//import 'package:kehamilanku/core/domain/usecase/mother_overall_usecase.dart';
import 'package:kehamilanku/core/domain/usecase/pregnancy_check_use_case.dart';


class KehamilankuUseCaseDi {
  KehamilankuUseCaseDi._();

  static KehamilankuUseCaseDiObj obj = KehamilankuUseCaseDiObjImpl();
  //static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);
/*
  static GetPregnancyAgeOverview get getPregnancyAgeOverview => GetPregnancyAgeOverviewImpl(RepoDi.pregnancyRepo);
  static GetTrimesterList get getTrimesterList => GetTrimesterListImpl(RepoDi.pregnancyRepo);
  static GetMotherFoodRecomList get getMotherFoodRecomList => GetMotherFoodRecomListImpl(RepoDi.pregnancyRepo);

  static GetPregnancyCheckForm get getPregnancyCheckForm => GetPregnancyCheckFormImpl(RepoDi.formFieldRepo);
  static SavePregnancyCheck get savePregnancyCheck => SavePregnancyCheckImpl(RepoDi.pregnancyRepo);
  static SaveUsgImg get saveUsgImg => SaveUsgImgImpl(RepoDi.pregnancyRepo);
  static GetPregnancyCheck get getPregnancyCheck => GetPregnancyCheckImpl(RepoDi.pregnancyRepo);
  static GetMotherFormWarningStatus get getMotherFormWarningStatus => GetMotherFormWarningStatusImpl(RepoDi.pregnancyRepo);
  static GetPregnancyBabySize get getPregnancyBabySize => GetPregnancyBabySizeImpl(RepoDi.pregnancyRepo);

  static GetPregnancyImmunizationConfirmForm get getPregnancyImmunizationConfirmForm => GetPregnancyImmunizationConfirmFormImpl(RepoDi.formFieldRepo);
  static GetMotherImmunizationOverview get getMotherImmunizationOverview => GetMotherImmunizationOverviewImpl(RepoDi.immunizationRepo);
  static GetMotherImmunizationGroupList get getMotherImmunizationGroupList => GetMotherImmunizationGroupListImpl(RepoDi.immunizationRepo);
  static ConfirmMotherImmunization get confirmMotherImmunization => ConfirmMotherImmunizationImpl(RepoDi.immunizationRepo);

  static GetMotherPregEvalGraphMenu get getMotherPregEvalGraphMenu => GetMotherPregEvalGraphMenuImpl(RepoDi.pregnancyRepo);

  static GetMotherTfuChart get getMotherTfuChart => GetMotherTfuChartImpl(RepoDi.motherChartRepo);
  static GetMotherDjjChart get getMotherDjjChart => GetMotherDjjChartImpl(RepoDi.motherChartRepo);
  static GetMotherBmiChart get getMotherBmiChart => GetMotherBmiChartImpl(RepoDi.motherChartRepo);
  static GetMotherMapChart get getMotherMapChart => GetMotherMapChartImpl(RepoDi.motherChartRepo);
  static GetMotherTfuChartWarning get getMotherTfuChartWarning => GetMotherTfuChartWarningImpl(RepoDi.motherChartRepo);
  static GetMotherDjjChartWarning get getMotherDjjChartWarning => GetMotherDjjChartWarningImpl(RepoDi.motherChartRepo);
  static GetMotherBmiChartWarning get getMotherBmiChartWarning => GetMotherBmiChartWarningImpl(RepoDi.motherChartRepo);
  static GetMotherMapChartWarning get getMotherMapChartWarning => GetMotherMapChartWarningImpl(RepoDi.motherChartRepo);
 */
}


abstract class KehamilankuUseCaseDiObj {

  //static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);

  GetPregnancyAgeOverview get getPregnancyAgeOverview;
  GetTrimesterList get getTrimesterList;
  GetMotherFoodRecomList get getMotherFoodRecomList;

  GetPregnancyCheckForm get getPregnancyCheckForm;
  SavePregnancyCheck get savePregnancyCheck;
  SaveUsgImg get saveUsgImg;
  GetPregnancyCheck get getPregnancyCheck;
  GetMotherFormWarningStatus get getMotherFormWarningStatus;
  GetPregnancyBabySize get getPregnancyBabySize;

  GetPregnancyImmunizationConfirmForm get getPregnancyImmunizationConfirmForm;
  GetMotherImmunizationOverview get getMotherImmunizationOverview;
  GetMotherImmunizationGroupList get getMotherImmunizationGroupList;
  ConfirmMotherImmunization get confirmMotherImmunization;

  GetMotherPregEvalGraphMenu get getMotherPregEvalGraphMenu;

  GetMotherTfuChart get getMotherTfuChart;
  GetMotherDjjChart get getMotherDjjChart;
  GetMotherBmiChart get getMotherBmiChart;
  GetMotherMapChart get getMotherMapChart;
  GetMotherTfuChartWarning get getMotherTfuChartWarning;
  GetMotherDjjChartWarning get getMotherDjjChartWarning;
  GetMotherBmiChartWarning get getMotherBmiChartWarning;
  GetMotherMapChartWarning get getMotherMapChartWarning;
}

class KehamilankuUseCaseDiObjImpl extends KehamilankuUseCaseDiObj {

  //static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);
  @override
  GetPregnancyAgeOverview get getPregnancyAgeOverview => GetPregnancyAgeOverviewImpl(RepoDi.obj.pregnancyRepo);
  @override
  GetTrimesterList get getTrimesterList => GetTrimesterListImpl(RepoDi.obj.pregnancyRepo);
  @override
  GetMotherFoodRecomList get getMotherFoodRecomList => GetMotherFoodRecomListImpl(RepoDi.obj.pregnancyRepo);

  @override
  GetPregnancyCheckForm get getPregnancyCheckForm => GetPregnancyCheckFormImpl(RepoDi.obj.formFieldRepo);
  @override
  SavePregnancyCheck get savePregnancyCheck => SavePregnancyCheckImpl(RepoDi.obj.pregnancyRepo);
  @override
  SaveUsgImg get saveUsgImg => SaveUsgImgImpl(RepoDi.obj.pregnancyRepo);
  @override
  GetPregnancyCheck get getPregnancyCheck => GetPregnancyCheckImpl(RepoDi.obj.pregnancyRepo);
  @override
  GetMotherFormWarningStatus get getMotherFormWarningStatus => GetMotherFormWarningStatusImpl(RepoDi.obj.pregnancyRepo);
  @override
  GetPregnancyBabySize get getPregnancyBabySize => GetPregnancyBabySizeImpl(RepoDi.obj.pregnancyRepo);

  @override
  GetPregnancyImmunizationConfirmForm get getPregnancyImmunizationConfirmForm => GetPregnancyImmunizationConfirmFormImpl(RepoDi.obj.formFieldRepo);
  @override
  GetMotherImmunizationOverview get getMotherImmunizationOverview => GetMotherImmunizationOverviewImpl(RepoDi.obj.immunizationRepo);
  @override
  GetMotherImmunizationGroupList get getMotherImmunizationGroupList => GetMotherImmunizationGroupListImpl(RepoDi.obj.immunizationRepo);
  @override
  ConfirmMotherImmunization get confirmMotherImmunization => ConfirmMotherImmunizationImpl(RepoDi.obj.immunizationRepo);

  @override
  GetMotherPregEvalGraphMenu get getMotherPregEvalGraphMenu => GetMotherPregEvalGraphMenuImpl(RepoDi.obj.pregnancyRepo);

  @override
  GetMotherTfuChart get getMotherTfuChart => GetMotherTfuChartImpl(RepoDi.obj.motherChartRepo);
  @override
  GetMotherDjjChart get getMotherDjjChart => GetMotherDjjChartImpl(RepoDi.obj.motherChartRepo);
  @override
  GetMotherBmiChart get getMotherBmiChart => GetMotherBmiChartImpl(RepoDi.obj.motherChartRepo);
  @override
  GetMotherMapChart get getMotherMapChart => GetMotherMapChartImpl(RepoDi.obj.motherChartRepo);
  @override
  GetMotherTfuChartWarning get getMotherTfuChartWarning => GetMotherTfuChartWarningImpl(RepoDi.obj.motherChartRepo);
  @override
  GetMotherDjjChartWarning get getMotherDjjChartWarning => GetMotherDjjChartWarningImpl(RepoDi.obj.motherChartRepo);
  @override
  GetMotherBmiChartWarning get getMotherBmiChartWarning => GetMotherBmiChartWarningImpl(RepoDi.obj.motherChartRepo);
  @override
  GetMotherMapChartWarning get getMotherMapChartWarning => GetMotherMapChartWarningImpl(RepoDi.obj.motherChartRepo);
}