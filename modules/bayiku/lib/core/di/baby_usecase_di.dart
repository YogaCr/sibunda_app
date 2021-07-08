import 'package:bayiku/core/domain/usecase/baby_chart_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_check_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_graph_menu_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_home_usecase.dart';
import 'package:bayiku/core/domain/usecase/baby_immunization_use_case.dart';
import 'package:bayiku/core/domain/usecase/baby_neonatal_usecase.dart';
import 'package:common/arch/di/repo_di.dart';

class BabyUseCaseDi {
  BabyUseCaseDi._();
  static final obj = BabyUseCaseDi._();

  //static GetBabyNik get getBabyNik => GetBabyNikImpl(RepoDi.myBabyRepo);

  static GetBabyAgeOverview get getBabyAgeOverview => GetBabyAgeOverviewImpl(RepoDi.myBabyRepo);
  static GetBabyFormMenuList get getBabyFormMenuList => GetBabyFormMenuListImpl(RepoDi.myBabyRepo);
  static GetBabyCheckForm get getBabyCheckForm => GetBabyCheckFormImpl(RepoDi.formFieldRepo);
  static SaveBabyCheckForm get saveBabyCheckForm => SaveBabyCheckFormImpl(RepoDi.myBabyRepo);
  static GetBabyCheckFormAnswer get getBabyCheckFormAnswer => GetBabyCheckFormAnswerImpl(RepoDi.myBabyRepo);
  static GetBabyFormWarningStatus get getBabyFormWarningStatus => GetBabyFormWarningStatusImpl(RepoDi.myBabyRepo);

  static SaveBabyCheckUpId get saveBabyCheckUpId => SaveBabyCheckUpIdImpl(RepoDi.myBabyRepo);
  static GetBabyCheckUpId get getBabyCheckUpId => GetBabyCheckUpIdImpl(RepoDi.myBabyRepo);

  static GetNeonatalFormData get getNeonatalFormData => GetNeonatalFormDataImpl(RepoDi.formFieldRepo);
  static SaveNeonatalForm get saveNeonatalForm => SaveNeonatalFormImpl(RepoDi.myBabyRepo);

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
}