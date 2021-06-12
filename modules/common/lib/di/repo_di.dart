import 'package:common/data/repo/AuthRepo.dart';
import 'package:common/data/repo/family_repo.dart';
import 'package:common/data/repo/kehamilanku_repo.dart';

class RepoDi {
  RepoDi._();

  static AuthRepo getAuthRepo() => AuthDummyRepo(); //AuthApiRepo();
  //static FamilyRepo getFamilyRepo() => FamilyDummyRepo(); //AuthApiRepo();
  static MotherRepo getMotherRepo() => MotherRepoDummy.obj; //AuthApiRepo();
  static FatherRepo getFatherRepo() => FatherRepoDummy.obj; //AuthApiRepo();
  static ChildRepo getChildRepo() => ChildRepoDummy.obj; //AuthApiRepo();
  static MotherFoodRecomRepo getFoodRepo() => MotherFoodRecomRepoDummy.obj; //AuthApiRepo();
  static MotherPregnancyRepo getPregnancyRepo() => MotherPregnancyRepoDummy.obj; //AuthApiRepo();
}