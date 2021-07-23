import 'package:common/arch/di/repo_di.dart';
import 'package:covid19/core/domain/usecase/covid_check_usecase.dart';
import 'package:covid19/core/domain/usecase/covid_home_usecase.dart';

class CovidUseCaseDi {
  CovidUseCaseDi._();
  static final obj = CovidUseCaseDi._();

  static GetCovidHomeOverview get getCovidHomeOverview => GetCovidHomeOverviewImpl(RepoDi.covidRepo);
  static GetCovidHomeMenu get getCovidHomeMenu => GetCovidHomeMenuImpl(RepoDi.covidRepo);
  static GetCovidHomeCheckHistory get getCovidHomeCheckHistory => GetCovidHomeCheckHistoryImpl(RepoDi.covidRepo);

  static GetCovidMotherCheckFormData get getCovidMotherCheckFormData => GetCovidMotherCheckFormDataImpl(RepoDi.formFieldRepo);
  static GetCovidBabyCheckFormData get getCovidBabyCheckFormData => GetCovidBabyCheckFormDataImpl(RepoDi.formFieldRepo);
  static SubmitCovidMotherCheckForm get submitCovidMotherCheckForm => SubmitCovidMotherCheckFormImpl(RepoDi.covidRepo);
  static SubmitCovidBabyCheckForm get submitCovidBabyCheckForm => SubmitCovidBabyCheckFormImpl(RepoDi.covidRepo);
}