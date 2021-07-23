import 'package:bayiku/core/domain/usecase/baby_graph_menu_usecase.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';

class BabyGrowthChartMenuVm extends AsyncAuthVm {
  static const getMenuListKey = "getMenuList";

  BabyGrowthChartMenuVm({
    BuildContext? context,
    required this.credential,
    required GetBabyGrowthGraphMenu getBabyGrowthGraphMenu,
  }):
    _getBabyGrowthGraphMenu = getBabyGrowthGraphMenu, super(context: context)
  ;
  final GetBabyGrowthGraphMenu _getBabyGrowthGraphMenu;
  final ProfileCredential credential;

  final MutableLiveData<List<BabyChartMenuData>> _menuList = MutableLiveData();
  LiveData<List<BabyChartMenuData>> get menuList => _menuList;

  @override
  List<LiveData> get liveDatas => [_menuList];

  void getMenuList({ bool forceLoad = false }) {
    if(!forceLoad && _menuList.value != null) return;
    startJob(getMenuListKey, (isActive) async {
      final res = await _getBabyGrowthGraphMenu();
      if(res is Success<List<BabyChartMenuData>>) {
        final data = res.data;
        _menuList.value = data;
      }
    });
  }
}