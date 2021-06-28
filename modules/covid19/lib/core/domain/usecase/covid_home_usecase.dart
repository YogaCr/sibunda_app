import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/repo/covid_repo.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:core/domain/model/result.dart';

mixin GetCovidHomeOverview {
  Future<Result<CovidHomeOverview>> call(String motherNik);
}

mixin GetCovidHomeMenu {
  Future<Result<List<HomeGraphMenu>>> call();
}

mixin GetCovidHomeCheckHistory {
  Future<Result<List<CovidCheckHistory>>> call(String motherNik);
}



class GetCovidHomeOverviewImpl with GetCovidHomeOverview {
  final CovidRepo _repo;
  GetCovidHomeOverviewImpl(this._repo);
  @override
  Future<Result<CovidHomeOverview>> call(String motherNik) => _repo.getCovidHomeOverview(motherNik);
}

class GetCovidHomeMenuImpl with GetCovidHomeMenu {
  final CovidRepo _repo;
  GetCovidHomeMenuImpl(this._repo);
  @override
  Future<Result<List<HomeGraphMenu>>> call() => _repo.getCovidFormMenu();
}

class GetCovidHomeCheckHistoryImpl with GetCovidHomeCheckHistory {
  final CovidRepo _repo;
  GetCovidHomeCheckHistoryImpl(this._repo);
  @override
  Future<Result<List<CovidCheckHistory>>> call(String motherNik) => _repo.getCovidHomeHistory(motherNik);
}