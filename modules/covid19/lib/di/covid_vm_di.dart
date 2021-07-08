import 'package:common/arch/di/usecase_di.dart';
import 'package:covid19/core/di/covid_usecase_di.dart';
import 'package:covid19/ui/check/covid_check_vm.dart';
import 'package:covid19/ui/home/covid_home_vm.dart';

class CovidVmDi {
  CovidVmDi._();

  static CovidHomeVm get covidHomeVm => CovidHomeVm(
    getMotherNik: UseCaseDi.getMotherNik,
    getCovidHomeCheckHistory: CovidUseCaseDi.getCovidHomeCheckHistory,
    getCovidHomeMenu: CovidUseCaseDi.getCovidHomeMenu,
    getCovidHomeOverview: CovidUseCaseDi.getCovidHomeOverview,
  );
  static CovidCheckVm get checkVm => CovidCheckVm(
    getMotherNik: UseCaseDi.getMotherNik,
    getBabyNik: UseCaseDi.getBabyNik,
    getCovidMotherCheckFormData: CovidUseCaseDi.getCovidMotherCheckFormData,
    submitCovidMotherCheckForm: CovidUseCaseDi.submitCovidMotherCheckForm,
    submitCovidBabyCheckForm: CovidUseCaseDi.submitCovidBabyCheckForm,
  );
}