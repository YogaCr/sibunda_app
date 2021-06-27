import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:common/arch/domain/repo/form_warning_status_repo.dart';
import 'package:common/arch/domain/repo/immunization_repo.dart';

class RepoDi {
  RepoDi._();

  static AuthRepo get authRepo => AuthDummyRepo(); //AuthApiRepo();

  static ProfileRepo get profileRepo => ProfileRepoDummy.obj;
  static HomeStatusRepo get homeStatusRepo => HomeStatusRepoDummy.obj;
  static HomeMenuRepo get homeMenuRepo => HomeMenuRepoDummy.obj;
  static TipsRepo get tipsRepo => TipsRepoDummy.obj;
  static NotifRepo get notifRepo => NotifRepoDummy.obj;

  static FormFieldRepo get formFieldRepo => FormFieldRepoDummy.obj;

  //static FamilyRepo getFamilyRepo() => FamilyDummyRepo();
  static MotherRepo get motherRepo => MotherRepoDummy.obj;
  static FatherRepo get fatherRepo => FatherRepoDummy.obj;
  static ChildRepo get childRepo => ChildRepoDummy.obj;
  static MotherFoodRecomRepo get foodRepo => MotherFoodRecomRepoDummy.obj;
  static MotherPregnancyRepo get pregnancyRepo => MotherPregnancyRepoDummy.obj;
  static PregnancyCheckRepo get pregnancyCheckRepo => PregnancyCheckRepoDummy.obj;
  static FormWarningStatusRepo get formWarningStatusRepo => FormWarningStatusRepoDummy.obj;
  static ImmunizationRepo get immunizationRepo => ImmunizationRepoDummy.obj;

  static MyBabyRepo get myBabyRepo => MyBabyRepoDummy.obj;

}