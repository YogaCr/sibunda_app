import 'package:common/arch/di/api_di.dart';
import 'package:common/arch/di/data_source_di.dart';
import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/domain/repo/_repos.dart';
import 'package:common/arch/domain/repo/bayiku_repo.dart';
import 'package:common/arch/domain/repo/chart_baby_repo.dart';
import 'package:common/arch/domain/repo/chart_mother_repo.dart';
import 'package:common/arch/domain/repo/covid_repo.dart';
import 'package:common/arch/domain/repo/data_repo.dart';
import 'package:common/arch/domain/repo/education_repo.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:common/arch/domain/repo/form_warning_status_repo.dart';
import 'package:common/arch/domain/repo/immunization_repo.dart';
import 'package:common/arch/domain/repo/profile_repo.dart';

class RepoDi {
  RepoDi._();

  static DataRepo get dataRepo => DataRepoImpl(
    localSrc: LocalSrcDi.dataSrc,
    api: ApiDi.dataApi,
  );

  static AuthRepo get authRepo => AuthRepoImpl(
    api: ApiDi.authApi,
    //dataApi: ApiDi.dataApi,
    localSrc: LocalSrcDi.accountSrc,
    pregnancyLocalSrc: LocalSrcDi.pregnancySrc,
    checkUpLocalSrc: LocalSrcDi.checkUpSrc,
  ); //AuthDummyRepo.obj; //

  static ProfileRepo get profileRepo => ProfileRepoImpl(localSrc: LocalSrcDi.accountSrc); //ProfileRepoDummy.obj; //ProfileRepoImpl(localSrc: LocalSrcDi.accountSrc); //
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
  static MotherRepo get motherRepo => /*MotherRepoImpl(
    accountLocalSrc: LocalSrcDi.accountSrc,
    pregnancyLocalSrc: LocalSrcDi.pregnancySrc,
  );*/ MotherRepoDummy.obj;
  static FatherRepo get fatherRepo => FatherRepoDummy.obj;
  static ChildRepo get childRepo => ChildRepoDummy.obj;
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
}