import 'package:common/arch/di/usecase_di.dart';
import 'package:covid19/core/di/covid_usecase_di.dart';
import 'package:covid19/ui/check/covid_check_vm.dart';
import 'package:covid19/ui/home/covid_home_vm.dart';
import 'package:flutter/cupertino.dart';

class CovidVmDi {
  CovidVmDi._();

  static CovidHomeVm covidHomeVm({BuildContext? context,}) => CovidHomeVm(
    context: context,
    getMotherNik: UseCaseDi.getMotherNik,
    getCovidHomeCheckHistory: CovidUseCaseDi.getCovidHomeCheckHistory,
    getCovidHomeMenu: CovidUseCaseDi.getCovidHomeMenu,
    getCovidHomeOverview: CovidUseCaseDi.getCovidHomeOverview,
  );
  static CovidCheckVm checkVm({BuildContext? context,}) => CovidCheckVm(
    context: context,
    getMotherNik: UseCaseDi.getMotherNik,
    getBornBabyList: UseCaseDi.getBornBabyList,
    //getBabyNik: UseCaseDi.getBabyNik,
    getCovidMotherCheckFormData: CovidUseCaseDi.getCovidMotherCheckFormData,
    getCovidBabyCheckFormData: CovidUseCaseDi.getCovidBabyCheckFormData,
    submitCovidMotherCheckForm: CovidUseCaseDi.submitCovidMotherCheckForm,
    submitCovidBabyCheckForm: CovidUseCaseDi.submitCovidBabyCheckForm,
  );
}