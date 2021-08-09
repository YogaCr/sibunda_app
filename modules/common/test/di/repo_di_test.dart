import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/repo/auth_repo.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:common/arch/domain/repo/chart_baby_repo.dart';
import 'package:common/arch/domain/repo/chart_mother_repo.dart';
import 'package:common/arch/domain/repo/child_repo.dart';
import 'package:common/arch/domain/repo/covid_repo.dart';
import 'package:common/arch/domain/repo/data_repo.dart';
import 'package:common/arch/domain/repo/education_repo.dart';
import 'package:common/arch/domain/repo/father_repo.dart';
import 'package:common/arch/domain/repo/firebase_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:common/arch/domain/repo/home_repo.dart';
import 'package:common/arch/domain/repo/immunization_repo.dart';
import 'package:common/arch/domain/repo/kehamilanku_repo.dart';
import 'package:common/arch/domain/repo/mother_repo.dart';
import 'package:common/arch/domain/repo/notif_repo.dart';
import 'package:common/arch/domain/repo/profile_repo.dart';


class RepoDiObjDummy extends RepoDiObj {
  @override
  AuthRepo get authRepo => AuthDummyRepo.obj;

  @override
  BabyChartRepo get babyChartRepo => BabyChartRepoDummy.obj;

  @override
  ChildRepo get childRepo => ChildRepoDummy.obj;

  @override
  CovidRepo get covidRepo => CovidRepoDummy.obj;

  @override
  DataRepo get dataRepo => DataRepoDummy.obj;

  @override
  EducationRepo get educationRepo => EducationRepoDummy.obj;

  @override
  FatherRepo get fatherRepo => FatherRepoDummy.obj;

  @override
  FirebaseRepo get firebaseRepo => FirebaseRepoDummy.obj;

  @override
  FormFieldRepo get formFieldRepo => FormFieldRepoDummy.obj;

  @override
  HomeMenuRepo get homeMenuRepo => HomeMenuRepoDummy.obj;

  @override
  HomeStatusRepo get homeStatusRepo => HomeStatusRepoDummy.obj;

  @override
  ImmunizationRepo get immunizationRepo => ImmunizationRepoDummy.obj;

  @override
  MotherChartRepo get motherChartRepo => MotherChartRepoDummy.obj;

  @override
  MotherRepo get motherRepo => MotherRepoDummy.obj;

  @override
  MyBabyRepo get myBabyRepo => MyBabyRepoDummy.obj;

  @override
  NotifRepo get notifRepo => NotifRepoDummy.obj;

  @override
  PregnancyRepo get pregnancyRepo => PregnancyRepoDummy.obj;

  @override
  ProfileRepo get profileRepo => ProfileRepoDummy.obj;
}