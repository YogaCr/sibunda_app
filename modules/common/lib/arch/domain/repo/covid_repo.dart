import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:core/domain/model/result.dart';

mixin CovidRepo {
  Future<Result<CovidHomeOverview>> getCovidHomeOverview(String motherNik);
  /// Although the type is [HomeGraphMenu], this is for form menu.
  /// It's cuz the view is the same as [ItemBabyGraphMenu].
  Future<Result<List<HomeGraphMenu>>> getCovidFormMenu();
  Future<Result<List<CovidCheckHistory>>> getCovidHomeHistory(String motherNik);
}


class CovidRepoDummy with CovidRepo {
  CovidRepoDummy._();
  static final obj = CovidRepoDummy._();

  @override
  Future<Result<CovidHomeOverview>> getCovidHomeOverview(String motherNik) async => Success(covidHomeOverview);

  /// Although the type is [HomeGraphMenu], this is for form menu.
  /// It's cuz the view is the same as [ItemBabyGraphMenu].
  @override
  Future<Result<List<HomeGraphMenu>>> getCovidFormMenu() async => Success(covidHomeMenu);

  @override
  Future<Result<List<CovidCheckHistory>>> getCovidHomeHistory(String motherNik) async => Success(covidHomeCheckHistory);
}

