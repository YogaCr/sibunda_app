import 'package:common/arch/di/repo_di.dart';
import 'package:covid19/core/domain/usecase/covid_check_usecase.dart';
import 'package:covid19/core/domain/usecase/covid_home_usecase.dart';


class CovidUseCaseDi {
  CovidUseCaseDi._();
  static CovidUseCaseDiObj obj = CovidUseCaseDiObjImpl();
}

abstract class CovidUseCaseDiObj {
  GetCovidHomeOverview get getCovidHomeOverview;
  GetCovidHomeMenu get getCovidHomeMenu;
  GetCovidHomeCheckHistory get getCovidHomeCheckHistory;

  GetCovidMotherCheckFormData get getCovidMotherCheckFormData;
  GetCovidBabyCheckFormData get getCovidBabyCheckFormData;
  SubmitCovidMotherCheckForm get submitCovidMotherCheckForm;
  SubmitCovidBabyCheckForm get submitCovidBabyCheckForm;
}
class CovidUseCaseDiObjImpl extends CovidUseCaseDiObj {
  @override
  GetCovidHomeOverview get getCovidHomeOverview => GetCovidHomeOverviewImpl(RepoDi.obj.covidRepo);
  @override
  GetCovidHomeMenu get getCovidHomeMenu => GetCovidHomeMenuImpl(RepoDi.obj.covidRepo);
  @override
  GetCovidHomeCheckHistory get getCovidHomeCheckHistory => GetCovidHomeCheckHistoryImpl(RepoDi.obj.covidRepo);

  @override
  GetCovidMotherCheckFormData get getCovidMotherCheckFormData => GetCovidMotherCheckFormDataImpl(RepoDi.obj.formFieldRepo);
  @override
  GetCovidBabyCheckFormData get getCovidBabyCheckFormData => GetCovidBabyCheckFormDataImpl(RepoDi.obj.formFieldRepo);
  @override
  SubmitCovidMotherCheckForm get submitCovidMotherCheckForm => SubmitCovidMotherCheckFormImpl(RepoDi.obj.covidRepo);
  @override
  SubmitCovidBabyCheckForm get submitCovidBabyCheckForm => SubmitCovidBabyCheckFormImpl(RepoDi.obj.covidRepo);
}