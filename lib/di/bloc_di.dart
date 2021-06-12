import 'package:common/di/_di.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';

class BlocDi {
  BlocDi._();

  static PregnancyHomeBloc get pregnancyHomeBloc => PregnancyHomeBloc(
    foodRepo: RepoDi.getFoodRepo(), pregnancyRepo: RepoDi.getPregnancyRepo(),
  );

  static MotherFormBloc get motherFormBloc => MotherFormBloc(RepoDi.getMotherRepo());
  static FatherFormBloc get fatherFormBloc => FatherFormBloc(RepoDi.getFatherRepo());
  static ChildFormBloc get childFormBloc => ChildFormBloc(RepoDi.getChildRepo());
}