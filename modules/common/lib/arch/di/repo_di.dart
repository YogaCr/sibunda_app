import 'package:common/arch/di/api_di.dart';
import 'package:common/arch/di/data_source_di.dart';
import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:common/arch/domain/repo/chart_baby_repo.dart';
import 'package:common/arch/domain/repo/chart_mother_repo.dart';
import 'package:common/arch/domain/repo/covid_repo.dart';
import 'package:common/arch/domain/repo/data_repo.dart';
import 'package:common/arch/domain/repo/education_repo.dart';
import 'package:common/arch/domain/repo/firebase_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:common/arch/domain/repo/form_warning_status_repo.dart';
import 'package:common/arch/domain/repo/immunization_repo.dart';
import 'package:common/arch/domain/repo/profile_repo.dart';
import 'package:common/util/_storage.dart';


class RepoDi {
  RepoDi._();

  static RepoDiObj obj = RepoDiObjImpl();
/*
  static FirebaseRepo get firebaseRepo => FirebaseRepoImpl(
    sharedPref: Prefs.prefs,
  );

  static DataRepo get dataRepo => DataRepoImpl(
    localSrc: LocalSrcDi.dataSrc,
    api: ApiDi.dataApi,
  );

  static AuthRepo get authRepo => AuthRepoImpl(
    api: ApiDi.authApi,
    //dataApi: ApiDi.dataApi,
    accountLocalSrc: LocalSrcDi.accountSrc,
    pregnancyLocalSrc: LocalSrcDi.pregnancySrc,
    checkUpLocalSrc: LocalSrcDi.checkUpSrc,
  ); //AuthDummyRepo.obj; //

  static ProfileRepo get profileRepo => ProfileRepoImpl(
    localSrc: LocalSrcDi.accountSrc,
    dataApi: ApiDi.dataApi,
  ); //ProfileRepoDummy.obj; //ProfileRepoImpl(localSrc: LocalSrcDi.accountSrc); //
  static HomeStatusRepo get homeStatusRepo => HomeStatusRepoImpl(homeApi: ApiDi.homeApi); //HomeStatusRepoDummy.obj;
  static HomeMenuRepo get homeMenuRepo => HomeMenuRepoDummy.obj;
  //static TipsRepo get tipsRepo => TipsRepoDummy.obj;
  static EducationRepo get educationRepo => EducationRepoImpl(homeApi: ApiDi.homeApi); //EducationRepoDummy.obj;
  static NotifRepo get notifRepo => NotifRepoImpl(api: ApiDi.homeApi); //NotifRepoDummy.obj;

  static FormFieldRepo get formFieldRepo => FormFieldRepoImpl(
    babyApi: ApiDi.babyApi,
    covidApi: ApiDi.covidApi,
  ); //FormFieldRepoDummy.obj;

  //static FamilyRepo getFamilyRepo() => FamilyDummyRepo();
  static MotherRepo get motherRepo => MotherRepoImpl(
    dataApi: ApiDi.dataApi,
    accountLocalSrc: LocalSrcDi.accountSrc,
    pregnancyLocalSrc: LocalSrcDi.pregnancySrc,
  ); //MotherRepoDummy.obj;
  static FatherRepo get fatherRepo => FatherRepoDummy.obj;
  static ChildRepo get childRepo => ChildRepoImpl(
    accountLocalSrc: LocalSrcDi.accountSrc,
    profileDao: DbDi.profileDao,
    pregnancyDao: DbDi.pregnancyDao,
    dataApi: ApiDi.dataApi,
  ); //ChildRepoDummy.obj;
  static PregnancyRepo get pregnancyRepo => PregnancyRepoImpl(
    api: ApiDi.kehamilankuApi,
    checkUpLocalSrc: LocalSrcDi.checkUpSrc,
  ); //PregnancyRepoDummy.obj; //
  //static MotherFoodRecomRepo get foodRepo => MotherFoodRecomRepoDummy.obj;
  //static MotherHomeRepo get pregnancyRepo => MotherPregnancyRepoDummy.obj;
  //static PregnancyCheckRepo get pregnancyCheckRepo => PregnancyCheckRepoDummy.obj;
  //static FormWarningStatusRepo get formWarningStatusRepo => FormWarningStatusRepoDummy.obj;
  static ImmunizationRepo get immunizationRepo => ImmunizationRepoImpl(
    pregnancyApi: ApiDi.kehamilankuApi,
    babyApi: ApiDi.babyApi,
    accountLocalSrc: LocalSrcDi.accountSrc,
  ); //ImmunizationRepoDummy.obj;

  static MyBabyRepo get myBabyRepo => MyBabyRepoImpl(
    api: ApiDi.babyApi,
    accountLocalSrc: LocalSrcDi.accountSrc,
    checkUpLocalSrc: LocalSrcDi.checkUpSrc,
    pregnancyLocalSrc: LocalSrcDi.pregnancySrc,
  ); //MyBabyRepoDummy.obj;

  static CovidRepo get covidRepo => CovidRepoImpl(
    api: ApiDi.covidApi,
    accountLocalSrc: LocalSrcDi.accountSrc,
  ); //CovidRepoDummy.obj;

  static BabyChartRepo get babyChartRepo => BabyChartRepoImpl(
    api: ApiDi.babyApi,
    accountLocalSrc: LocalSrcDi.accountSrc,
  ); //BabyChartRepoDummy.obj;
  static MotherChartRepo get motherChartRepo => MotherChartRepoImpl(
    api: ApiDi.kehamilankuApi,
  ); //MotherChartRepoDummy.obj;
 */
}


abstract class RepoDiObj {

  FirebaseRepo get firebaseRepo;

  DataRepo get dataRepo;

  AuthRepo get authRepo; //AuthDummyRepo.obj; //

  ProfileRepo get profileRepo; //ProfileRepoDummy.obj; //ProfileRepoImpl(localSrc: LocalSrcDi.accountSrc); //
  HomeStatusRepo get homeStatusRepo; //HomeStatusRepoDummy.obj;
  HomeMenuRepo get homeMenuRepo;
  //static TipsRepo get tipsRepo => TipsRepoDummy.obj;
  EducationRepo get educationRepo; //EducationRepoDummy.obj;
  NotifRepo get notifRepo; //NotifRepoDummy.obj;

  FormFieldRepo get formFieldRepo; //FormFieldRepoDummy.obj;

  //static FamilyRepo getFamilyRepo() => FamilyDummyRepo();
  MotherRepo get motherRepo; //MotherRepoDummy.obj;
  FatherRepo get fatherRepo;
  ChildRepo get childRepo; //ChildRepoDummy.obj;
  PregnancyRepo get pregnancyRepo; //PregnancyRepoDummy.obj; //
  //static MotherFoodRecomRepo get foodRepo => MotherFoodRecomRepoDummy.obj;
  //static MotherHomeRepo get pregnancyRepo => MotherPregnancyRepoDummy.obj;
  //static PregnancyCheckRepo get pregnancyCheckRepo => PregnancyCheckRepoDummy.obj;
  //static FormWarningStatusRepo get formWarningStatusRepo => FormWarningStatusRepoDummy.obj;
  ImmunizationRepo get immunizationRepo; //ImmunizationRepoDummy.obj;

  MyBabyRepo get myBabyRepo; //MyBabyRepoDummy.obj;

  CovidRepo get covidRepo; //CovidRepoDummy.obj;

  BabyChartRepo get babyChartRepo; //BabyChartRepoDummy.obj;
  MotherChartRepo get motherChartRepo; //MotherChartRepoDummy.obj;
}


class RepoDiObjImpl extends RepoDiObj {
  @override
  FirebaseRepo get firebaseRepo => FirebaseRepoImpl(
    sharedPref: Prefs.prefs,
  );

  @override
  DataRepo get dataRepo => DataRepoImpl(
    localSrc: LocalSrcDi.obj.dataSrc,
    api: ApiDi.obj.dataApi,
  );

  @override
  AuthRepo get authRepo => AuthRepoImpl(
    api: ApiDi.obj.authApi,
    dataApi: ApiDi.obj.dataApi,
    accountLocalSrc: LocalSrcDi.obj.accountSrc,
    pregnancyLocalSrc: LocalSrcDi.obj.pregnancySrc,
    checkUpLocalSrc: LocalSrcDi.obj.checkUpSrc,
  ); //AuthDummyRepo.obj; //

  @override
  ProfileRepo get profileRepo => ProfileRepoImpl(
    localSrc: LocalSrcDi.obj.accountSrc,
    dataApi: ApiDi.obj.dataApi,
  ); //ProfileRepoDummy.obj; //ProfileRepoImpl(localSrc: LocalSrcDi.accountSrc); //
  @override
  HomeStatusRepo get homeStatusRepo => HomeStatusRepoImpl(homeApi: ApiDi.obj.homeApi); //HomeStatusRepoDummy.obj;
  @override
  HomeMenuRepo get homeMenuRepo => HomeMenuRepoDummy.obj;
  //static TipsRepo get tipsRepo => TipsRepoDummy.obj;
  @override
  EducationRepo get educationRepo => EducationRepoImpl(homeApi: ApiDi.obj.homeApi); //EducationRepoDummy.obj;
  @override
  NotifRepo get notifRepo => NotifRepoImpl(api: ApiDi.obj.homeApi); //NotifRepoDummy.obj;

  @override
  FormFieldRepo get formFieldRepo => FormFieldRepoImpl(
    babyApi: ApiDi.obj.babyApi,
    covidApi: ApiDi.obj.covidApi,
  ); //FormFieldRepoDummy.obj;

  //@override
  //FamilyRepo getFamilyRepo() => FamilyDummyRepo();
  @override
  MotherRepo get motherRepo => MotherRepoImpl(
    dataApi: ApiDi.obj.dataApi,
    accountLocalSrc: LocalSrcDi.obj.accountSrc,
    pregnancyLocalSrc: LocalSrcDi.obj.pregnancySrc,
  ); //MotherRepoDummy.obj;
  @override
  FatherRepo get fatherRepo => FatherRepoDummy.obj;
  @override
  ChildRepo get childRepo => ChildRepoImpl(
    accountLocalSrc: LocalSrcDi.obj.accountSrc,
    profileDao: DbDi.obj.profileDao,
    pregnancyDao: DbDi.obj.pregnancyDao,
    dataApi: ApiDi.obj.dataApi,
  ); //ChildRepoDummy.obj;
  @override
  PregnancyRepo get pregnancyRepo => PregnancyRepoImpl(
    api: ApiDi.obj.kehamilankuApi,
    checkUpLocalSrc: LocalSrcDi.obj.checkUpSrc,
  ); //PregnancyRepoDummy.obj; //
  //static MotherFoodRecomRepo get foodRepo => MotherFoodRecomRepoDummy.obj;
  //static MotherHomeRepo get pregnancyRepo => MotherPregnancyRepoDummy.obj;
  //static PregnancyCheckRepo get pregnancyCheckRepo => PregnancyCheckRepoDummy.obj;
  //static FormWarningStatusRepo get formWarningStatusRepo => FormWarningStatusRepoDummy.obj;
  @override
  ImmunizationRepo get immunizationRepo => ImmunizationRepoImpl(
    pregnancyApi: ApiDi.obj.kehamilankuApi,
    babyApi: ApiDi.obj.babyApi,
    accountLocalSrc: LocalSrcDi.obj.accountSrc,
  ); //ImmunizationRepoDummy.obj;

  @override
  MyBabyRepo get myBabyRepo => MyBabyRepoImpl(
    api: ApiDi.obj.babyApi,
    accountLocalSrc: LocalSrcDi.obj.accountSrc,
    checkUpLocalSrc: LocalSrcDi.obj.checkUpSrc,
    pregnancyLocalSrc: LocalSrcDi.obj.pregnancySrc,
  ); //MyBabyRepoDummy.obj;

  @override
  CovidRepo get covidRepo => CovidRepoImpl(
    api: ApiDi.obj.covidApi,
    accountLocalSrc: LocalSrcDi.obj.accountSrc,
  ); //CovidRepoDummy.obj;

  @override
  BabyChartRepo get babyChartRepo => BabyChartRepoImpl(
    api: ApiDi.obj.babyApi,
    accountLocalSrc: LocalSrcDi.obj.accountSrc,
  ); //BabyChartRepoDummy.obj;
  @override
  MotherChartRepo get motherChartRepo => MotherChartRepoImpl(
    api: ApiDi.obj.kehamilankuApi,
  ); //MotherChartRepoDummy.obj;
}