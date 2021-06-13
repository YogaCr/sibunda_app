import 'package:common/di/_di.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';

class BlocDi {
  BlocDi._();

  static LoginFormBloc get loginFormBloc => LoginFormBloc(RepoDi.authRepo);
  static SignUpFormBloc get signUpFormBloc => SignUpFormBloc(RepoDi.authRepo);
  static LogoutFormBloc get logoutFormBloc => LogoutFormBloc(RepoDi.authRepo);

  static PregnancyHomeBloc get pregnancyHomeBloc => PregnancyHomeBloc(
    foodRepo: RepoDi.foodRepo, pregnancyRepo: RepoDi.pregnancyRepo,
  );

  static PregnancyCheckBloc get pregnancyCheckFormBloc => PregnancyCheckBloc(RepoDi.pregnancyCheckRepo);

  static MotherFormBloc get motherFormBloc => MotherFormBloc(RepoDi.motherRepo);
  static FatherFormBloc get fatherFormBloc => FatherFormBloc(RepoDi.fatherRepo);
  static ChildFormBloc get childFormBloc => ChildFormBloc(RepoDi.childRepo);
}