import 'package:common/data/repo/AuthRepo.dart';
import 'package:common/data/repo/family_repo.dart';
import 'package:common/data/repo/home_repo.dart';
import 'package:common/data/repo/kehamilanku_repo.dart';
import 'package:common/data/repo/notif_repo.dart';

class RepoDi {
  RepoDi._();

  static AuthRepo get authRepo => AuthDummyRepo(); //AuthApiRepo();

  static ProfileRepo get profileRepo => ProfileRepoDummy.obj; //AuthApiRepo();
  static HomeStatusRepo get homeStatusRepo => HomeStatusRepoDummy.obj; //AuthApiRepo();
  static HomeMenuRepo get homeMenuRepo => HomeMenuRepoDummy.obj; //AuthApiRepo();
  static TipsRepo get tipsRepo => TipsRepoDummy.obj; //AuthApiRepo();
  static NotifRepo get notifRepo => NotifRepoDummy.obj; //AuthApiRepo();

  //static FamilyRepo getFamilyRepo() => FamilyDummyRepo(); //AuthApiRepo();
  static MotherRepo get motherRepo => MotherRepoDummy.obj; //AuthApiRepo();
  static FatherRepo get fatherRepo => FatherRepoDummy.obj; //AuthApiRepo();
  static ChildRepo get childRepo => ChildRepoDummy.obj; //AuthApiRepo();
  static MotherFoodRecomRepo get foodRepo => MotherFoodRecomRepoDummy.obj; //AuthApiRepo();
  static MotherPregnancyRepo get pregnancyRepo => MotherPregnancyRepoDummy.obj; //AuthApiRepo();
  static PregnancyCheckRepo get pregnancyCheckRepo => PregnancyCheckRepoDummy.obj; //AuthApiRepo();
}