import 'package:bayiku/core/domain/usecase/baby_chart_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_check_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_graph_menu_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_home_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_immunization_use_case.dart';
import 'package:bayiku/core/domain/usecase/baby_neonatal_usecase.dart';
import 'package:common/arch/di/repo_di.dart';


class BabyUseCaseDi {
  BabyUseCaseDi._();
  static BabyUseCaseDiObj obj = BabyUseCaseDiObjImpl();

  //static GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.myBabyRepo);
/*
  static GetBabyAgeOverview get getBabyAgeOverview => GetBabyAgeOverviewImpl(RepoDi.myBabyRepo);
  static GetBabyFormMenuList get getBabyFormMenuList => GetBabyFormMenuListImpl(RepoDi.myBabyRepo);
  static GetBabyCheckForm get getBabyCheckForm => GetBabyCheckFormImpl(RepoDi.formFieldRepo);
  static SaveBabyCheckForm get saveBabyCheckForm => SaveBabyCheckFormImpl(RepoDi.myBabyRepo);
  static GetBabyCheckFormAnswer get getBabyCheckFormAnswer => GetBabyCheckFormAnswerImpl(RepoDi.myBabyRepo);
  static GetBabyGrowthFormWarningStatus get getBabyFormWarningStatus => GetBabyFormWarningStatusImpl(RepoDi.myBabyRepo);
  static GetBabyDevFormWarningStatus get getBabyDevFormWarningStatus => GetBabyDevFormWarningStatusImpl(RepoDi.myBabyRepo);

  static SaveBabyCheckUpId get saveBabyCheckUpId => SaveBabyCheckUpIdImpl(RepoDi.myBabyRepo);
  static GetBabyCheckUpId get getBabyCheckUpId => GetBabyCheckUpIdImpl(RepoDi.myBabyRepo);

  static GetNeonatalFormData get getNeonatalFormData => GetNeonatalFormDataImpl(RepoDi.formFieldRepo);
  static SaveNeonatalForm get saveNeonatalForm => SaveNeonatalFormImpl(RepoDi.myBabyRepo);
  static GetNeonatalFormAnswer get getNeonatalFormAnswer => GetNeonatalFormAnswerImpl(RepoDi.myBabyRepo);

  static GetBabyImmunizationConfirmForm get getBabyImmunizationConfirmForm => GetBabyImmunizationConfirmFormImpl(RepoDi.formFieldRepo);
  static GetBabyImmunizationOverview get getBabyImmunizationOverview => GetBabyImmunizationOverviewImpl(RepoDi.immunizationRepo);
  static GetBabyImmunizationGroupList get getBabyImmunizationGroupList => GetBabyImmunizationGroupListImpl(RepoDi.immunizationRepo);
  static ConfirmBabyImmunization get confirmBabyImmunization => ConfirmBabyImmunizationImpl(RepoDi.immunizationRepo);

  static GetBabyGrowthGraphMenu get getBabyGrowthGraphMenu => GetBabyGrowthGraphMenuImpl(RepoDi.myBabyRepo);

  static GetBabyWeightChart get getBabyWeightChart => GetBabyWeightChartImpl(RepoDi.babyChartRepo);
  static GetBabyKmsChart get getBabyKmsChart => GetBabyKmsChartImpl(RepoDi.babyChartRepo);
  static GetBabyLenChart get getBabyLenChart => GetBabyLenChartImpl(RepoDi.babyChartRepo);
  static GetBabyWeightToLenChart get getBabyWeightToLenChart => GetBabyWeightToLenChartImpl(RepoDi.babyChartRepo);
  static GetBabyHeadCircumChart get getBabyHeadCircumChart => GetBabyHeadCircumChartImpl(RepoDi.babyChartRepo);
  static GetBabyBmiChart get getBabyBmiChart => GetBabyBmiChartImpl(RepoDi.babyChartRepo);
  static GetBabyDevChart get getBabyDevChart => GetBabyDevChartImpl(RepoDi.babyChartRepo);

  static GetBabyWeightChartWarning get getBabyWeightChartWarning => GetBabyWeightChartWarningImpl(RepoDi.babyChartRepo);
  static GetBabyKmsChartWarning get getBabyKmsChartWarning => GetBabyKmsChartWarningImpl(RepoDi.babyChartRepo);
  static GetBabyLenChartWarning get getBabyLenChartWarning => GetBabyLenChartWarningImpl(RepoDi.babyChartRepo);
  static GetBabyWeightToLenChartWarning get getBabyWeightToLenChartWarning => GetBabyWeightToLenChartWarningImpl(RepoDi.babyChartRepo);
  static GetBabyHeadCircumChartWarning get getBabyHeadCircumChartWarning => GetBabyHeadCircumChartWarningImpl(RepoDi.babyChartRepo);
  static GetBabyBmiChartWarning get getBabyBmiChartWarning => GetBabyBmiChartWarningImpl(RepoDi.babyChartRepo);
  static GetBabyDevChartWarning get getBabyDevChartWarning => GetBabyDevChartWarningImpl(RepoDi.babyChartRepo);
 */
}


abstract class BabyUseCaseDiObj {

  //static GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.myBabyRepo);

  GetBabyAgeOverview get getBabyAgeOverview;
  GetBabyFormMenuList get getBabyFormMenuList;
  GetBabyCheckForm get getBabyCheckForm;
  SaveBabyCheckForm get saveBabyCheckForm;
  GetBabyCheckFormAnswer get getBabyCheckFormAnswer;
  GetBabyGrowthFormWarningStatus get getBabyFormWarningStatus;
  GetBabyDevFormWarningStatus get getBabyDevFormWarningStatus;

  SaveBabyCheckUpId get saveBabyCheckUpId;
  GetBabyCheckUpId get getBabyCheckUpId;

  GetNeonatalFormData get getNeonatalFormData;
  SaveNeonatalForm get saveNeonatalForm;
  GetNeonatalFormAnswer get getNeonatalFormAnswer;

  GetBabyImmunizationConfirmForm get getBabyImmunizationConfirmForm;
  GetBabyImmunizationOverview get getBabyImmunizationOverview;
  GetBabyImmunizationGroupList get getBabyImmunizationGroupList;
  ConfirmBabyImmunization get confirmBabyImmunization;

  GetBabyGrowthGraphMenu get getBabyGrowthGraphMenu;

  GetBabyWeightChart get getBabyWeightChart;
  GetBabyKmsChart get getBabyKmsChart;
  GetBabyLenChart get getBabyLenChart;
  GetBabyWeightToLenChart get getBabyWeightToLenChart;
  GetBabyHeadCircumChart get getBabyHeadCircumChart;
  GetBabyBmiChart get getBabyBmiChart;
  GetBabyDevChart get getBabyDevChart;

  GetBabyWeightChartWarning get getBabyWeightChartWarning;
  GetBabyKmsChartWarning get getBabyKmsChartWarning;
  GetBabyLenChartWarning get getBabyLenChartWarning;
  GetBabyWeightToLenChartWarning get getBabyWeightToLenChartWarning;
  GetBabyHeadCircumChartWarning get getBabyHeadCircumChartWarning;
  GetBabyBmiChartWarning get getBabyBmiChartWarning;
  GetBabyDevChartWarning get getBabyDevChartWarning;
}

class BabyUseCaseDiObjImpl extends BabyUseCaseDiObj {

  //static GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.myBabyRepo);

  @override
  GetBabyAgeOverview get getBabyAgeOverview => GetBabyAgeOverviewImpl(RepoDi.obj.myBabyRepo);
  @override
  GetBabyFormMenuList get getBabyFormMenuList => GetBabyFormMenuListImpl(RepoDi.obj.myBabyRepo);
  @override
  GetBabyCheckForm get getBabyCheckForm => GetBabyCheckFormImpl(RepoDi.obj.formFieldRepo);
  @override
  SaveBabyCheckForm get saveBabyCheckForm => SaveBabyCheckFormImpl(RepoDi.obj.myBabyRepo);
  @override
  GetBabyCheckFormAnswer get getBabyCheckFormAnswer => GetBabyCheckFormAnswerImpl(RepoDi.obj.myBabyRepo);
  @override
  GetBabyGrowthFormWarningStatus get getBabyFormWarningStatus => GetBabyFormWarningStatusImpl(RepoDi.obj.myBabyRepo);
  @override
  GetBabyDevFormWarningStatus get getBabyDevFormWarningStatus => GetBabyDevFormWarningStatusImpl(RepoDi.obj.myBabyRepo);

  @override
  SaveBabyCheckUpId get saveBabyCheckUpId => SaveBabyCheckUpIdImpl(RepoDi.obj.myBabyRepo);
  @override
  GetBabyCheckUpId get getBabyCheckUpId => GetBabyCheckUpIdImpl(RepoDi.obj.myBabyRepo);

  @override
  GetNeonatalFormData get getNeonatalFormData => GetNeonatalFormDataImpl(RepoDi.obj.formFieldRepo);
  @override
  SaveNeonatalForm get saveNeonatalForm => SaveNeonatalFormImpl(RepoDi.obj.myBabyRepo);
  @override
  GetNeonatalFormAnswer get getNeonatalFormAnswer => GetNeonatalFormAnswerImpl(RepoDi.obj.myBabyRepo);

  @override
  GetBabyImmunizationConfirmForm get getBabyImmunizationConfirmForm => GetBabyImmunizationConfirmFormImpl(RepoDi.obj.formFieldRepo);
  @override
  GetBabyImmunizationOverview get getBabyImmunizationOverview => GetBabyImmunizationOverviewImpl(RepoDi.obj.immunizationRepo);
  @override
  GetBabyImmunizationGroupList get getBabyImmunizationGroupList => GetBabyImmunizationGroupListImpl(RepoDi.obj.immunizationRepo);
  @override
  ConfirmBabyImmunization get confirmBabyImmunization => ConfirmBabyImmunizationImpl(RepoDi.obj.immunizationRepo);

  @override
  GetBabyGrowthGraphMenu get getBabyGrowthGraphMenu => GetBabyGrowthGraphMenuImpl(RepoDi.obj.myBabyRepo);

  @override
  GetBabyWeightChart get getBabyWeightChart => GetBabyWeightChartImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyKmsChart get getBabyKmsChart => GetBabyKmsChartImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyLenChart get getBabyLenChart => GetBabyLenChartImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyWeightToLenChart get getBabyWeightToLenChart => GetBabyWeightToLenChartImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyHeadCircumChart get getBabyHeadCircumChart => GetBabyHeadCircumChartImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyBmiChart get getBabyBmiChart => GetBabyBmiChartImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyDevChart get getBabyDevChart => GetBabyDevChartImpl(RepoDi.obj.babyChartRepo);

  @override
  GetBabyWeightChartWarning get getBabyWeightChartWarning => GetBabyWeightChartWarningImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyKmsChartWarning get getBabyKmsChartWarning => GetBabyKmsChartWarningImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyLenChartWarning get getBabyLenChartWarning => GetBabyLenChartWarningImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyWeightToLenChartWarning get getBabyWeightToLenChartWarning => GetBabyWeightToLenChartWarningImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyHeadCircumChartWarning get getBabyHeadCircumChartWarning => GetBabyHeadCircumChartWarningImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyBmiChartWarning get getBabyBmiChartWarning => GetBabyBmiChartWarningImpl(RepoDi.obj.babyChartRepo);
  @override
  GetBabyDevChartWarning get getBabyDevChartWarning => GetBabyDevChartWarningImpl(RepoDi.obj.babyChartRepo);
}