import 'package:common/data/repo/AuthRepo.dart';
import 'package:common/data/repo/family_repo.dart';

class RepoDi {
  RepoDi._();

  static AuthRepo getAuthRepo() => AuthDummyRepo(); //AuthApiRepo();
  //static FamilyRepo getFamilyRepo() => FamilyDummyRepo(); //AuthApiRepo();
  static MotherRepo getMotherRepo() => MotherRepoDummy.obj; //AuthApiRepo();
  static FatherRepo getFatherRepo() => FatherRepoDummy.obj; //AuthApiRepo();
  static ChildRepo getChildRepo() => ChildRepoDummy.obj; //AuthApiRepo();
}