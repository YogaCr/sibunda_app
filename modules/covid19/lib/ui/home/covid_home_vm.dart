import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:covid19/core/domain/usecase/covid_home_usecase.dart';
import 'package:flutter/material.dart';

class CovidHomeVm extends AsyncAuthVm {
  static const getOverviewKey = "getOverview";
  static const getMenuKey = "getMenu";
  static const getCheckHistoryKey = "getCheckHistory";

  CovidHomeVm({
    BuildContext? context,
    required GetCovidHomeOverview getCovidHomeOverview,
    required GetCovidHomeMenu getCovidHomeMenu,
    required GetCovidHomeCheckHistory getCovidHomeCheckHistory,
    required GetMotherNik getMotherNik,
  }):
    _getCovidHomeOverview = getCovidHomeOverview,
    _getCovidHomeMenu = getCovidHomeMenu,
    _getCovidHomeCheckHistory = getCovidHomeCheckHistory,
    _getMotherNik = getMotherNik, super(context: context)
  ;

  final GetMotherNik _getMotherNik;
  final GetCovidHomeOverview _getCovidHomeOverview;
  final GetCovidHomeMenu _getCovidHomeMenu;
  final GetCovidHomeCheckHistory _getCovidHomeCheckHistory;

  final MutableLiveData<CovidHomeOverview> _overview = MutableLiveData();
  final MutableLiveData<List<HomeGraphMenu>> _menuList = MutableLiveData();
  final MutableLiveData<List<CovidCheckHistory>> _historyList = MutableLiveData();

  LiveData<CovidHomeOverview> get overview => _overview;
  LiveData<List<HomeGraphMenu>> get menuList => _menuList;
  LiveData<List<CovidCheckHistory>> get historyList => _historyList;

  @override
  List<LiveData> get liveDatas => [_overview, _menuList, _historyList];

  void getOverview({ bool forceLoad = false }) {
    if(!forceLoad && _overview.value != null) return;
    startJob(getOverviewKey, (isActive) async {
      final res1 = await _getMotherNik();
      if(res1 is Success<String>) {
        final motherNik = res1.data;
        final res2 = await _getCovidHomeOverview(motherNik);
        if(res2 is Success<CovidHomeOverview>) {
          final data = res2.data;
          _overview.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
  void getMenu({ bool forceLoad = false }) {
    if(!forceLoad && _menuList.value != null) return;
    startJob(getMenuKey, (isActive) async {
      final res = await _getCovidHomeMenu();
      if(res is Success<List<HomeGraphMenu>>) {
        final data = res.data;
        _menuList.value = data;
        return null;
      }
      return res as Fail;
    });
  }
  void getCheckHistory({ bool forceLoad = false }) {
    if(!forceLoad && _historyList.value != null) return;
    startJob(getCheckHistoryKey, (isActive) async {
      final res1 = await _getMotherNik();
      if(res1 is Success<String>) {
        final motherNik = res1.data;
        final res2 = await _getCovidHomeCheckHistory(motherNik);
        if(res2 is Success<List<CovidCheckHistory>>) {
          final data = res2.data;
          _historyList.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
}