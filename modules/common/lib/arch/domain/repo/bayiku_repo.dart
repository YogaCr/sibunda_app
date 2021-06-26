import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:core/domain/model/result.dart';

mixin MyBabyRepo {
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik);
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu();
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu();
}


class MyBabyRepoDummy with MyBabyRepo {
  MyBabyRepoDummy._();
  static final obj = MyBabyRepoDummy._();

  @override
  Future<Result<BabyAgeOverview>> getBabyAgeOverview(String babyNik) async => Success(dummyBabyAgeOverview);
  @override
  Future<Result<List<HomeGraphMenu>>> getBabyGraphMenu() async => Success(babyHomeGraph_ui);
  @override
  Future<Result<List<BabyFormMenuData>>> getBabyFormMenu() async => Success(babyFormMenuList_ui);
}



