import 'package:common/di/_di.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:sibunda_app/bloc/home_bloc.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';
import 'package:sibunda_app/bloc/notif_bloc.dart';

class BlocDi {
  BlocDi._();

  static LoginFormBloc get loginFormBloc => LoginFormBloc(RepoDi.authRepo);
  static SignUpFormBloc get signUpFormBloc => SignUpFormBloc(RepoDi.authRepo);
  static LogoutFormBloc get logoutFormBloc => LogoutFormBloc(RepoDi.authRepo);
  static HomeBloc get homeBloc => HomeBloc(
    profileRepo: RepoDi.profileRepo,
    statusRepo: RepoDi.homeStatusRepo,
    menuRepo: RepoDi.homeMenuRepo,
    tipsRepo: RepoDi.tipsRepo,
  );

  static PregnancyHomeBloc get pregnancyHomeBloc => PregnancyHomeBloc(
    foodRepo: RepoDi.foodRepo, pregnancyRepo: RepoDi.pregnancyRepo,
  );

  static NotifBloc get notifBloc => NotifBloc(RepoDi.notifRepo);

  static PregnancyCheckBloc get pregnancyCheckFormBloc => PregnancyCheckBloc(RepoDi.pregnancyCheckRepo);

  static MotherFormBloc get motherFormBloc => MotherFormBloc(RepoDi.motherRepo);
  static FatherFormBloc get fatherFormBloc => FatherFormBloc(RepoDi.fatherRepo);
  static ChildFormBloc get childFormBloc => ChildFormBloc(RepoDi.childRepo);
}