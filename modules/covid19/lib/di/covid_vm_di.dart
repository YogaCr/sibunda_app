import 'package:common/arch/di/usecase_di.dart';
import 'package:covid19/core/di/covid_usecase_di.dart';
import 'package:covid19/ui/check_baby/covid_check_baby_vm.dart';
import 'package:covid19/ui/home/covid_home_vm.dart';

class CovidVmDi {
  CovidVmDi._();

  static CovidHomeVm get covidHomeVm => CovidHomeVm(
    getMotherNik: UseCaseDi.getMotherNik,
    getCovidHomeCheckHistory: CovidUseCaseDi.getCovidHomeCheckHistory,
    getCovidHomeMenu: CovidUseCaseDi.getCovidHomeMenu,
    getCovidHomeOverview: CovidUseCaseDi.getCovidHomeOverview,
  );
  static CovidCheckBabyVm get checkBabyVm => CovidCheckBabyVm(
    getMotherNik: UseCaseDi.getMotherNik,
    getCovidMotherCheckFormData: CovidUseCaseDi.getCovidMotherCheckFormData,
    submitCovidMotherCheckForm: CovidUseCaseDi.submitCovidMotherCheckForm,
  );
}