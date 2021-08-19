import 'package:common/arch/di/usecase_di.dart';
import 'package:covid19/core/di/covid_usecase_di.dart';
import 'package:covid19/ui/check/covid_check_vm.dart';
import 'package:covid19/ui/home/covid_home_vm.dart';
import 'package:flutter/cupertino.dart';


class CovidVmDi {
  CovidVmDi._();

  static CovidVmDiObj obj = CovidVmDiObjImpl();
}

abstract class CovidVmDiObj {
  CovidHomeVm covidHomeVm({BuildContext? context,});
  CovidCheckVm checkVm({BuildContext? context,});
}

class CovidVmDiObjImpl extends CovidVmDiObj {
  @override
  CovidHomeVm covidHomeVm({BuildContext? context,}) => CovidHomeVm(
    context: context,
    getMotherNik: UseCaseDi.obj.getMotherNik,
    getCovidHomeCheckHistory: CovidUseCaseDi.obj.getCovidHomeCheckHistory,
    getCovidHomeMenu: CovidUseCaseDi.obj.getCovidHomeMenu,
    getCovidHomeOverview: CovidUseCaseDi.obj.getCovidHomeOverview,
  );
  @override
  CovidCheckVm checkVm({BuildContext? context,}) => CovidCheckVm(
    context: context,
    getMotherNik: UseCaseDi.obj.getMotherNik,
    getBornBabyList: UseCaseDi.obj.getBornBabyList,
    //getBabyNik: UseCaseDi.getBabyNik,
    getCovidMotherCheckFormData: CovidUseCaseDi.obj.getCovidMotherCheckFormData,
    getCovidBabyCheckFormData: CovidUseCaseDi.obj.getCovidBabyCheckFormData,
    submitCovidMotherCheckForm: CovidUseCaseDi.obj.submitCovidMotherCheckForm,
    submitCovidBabyCheckForm: CovidUseCaseDi.obj.submitCovidBabyCheckForm,
  );
}