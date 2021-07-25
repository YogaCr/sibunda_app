import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/core/domain/usecase/mother_graph_menu_usecase.dart';

class MotherPregEvalChartMenuVm extends AsyncAuthVm {
  static const getMenuListKey = "getMenuList";

  MotherPregEvalChartMenuVm({
    BuildContext? context,
    required this.pregnancyId,
    required GetMotherPregEvalGraphMenu getMotherPregEvalGraphMenu,
  }):
    _getMotherPregEvalGraphMenu = getMotherPregEvalGraphMenu, super(context: context)
  ;
  final ProfileCredential pregnancyId;
  final GetMotherPregEvalGraphMenu _getMotherPregEvalGraphMenu;

  final MutableLiveData<List<MotherChartMenuData>> _menuList = MutableLiveData();
  LiveData<List<MotherChartMenuData>> get menuList => _menuList;

  @override
  List<LiveData> get liveDatas => [_menuList];

  void getMenuList({ bool forceLoad = false }) {
    if(!forceLoad && _menuList.value != null) return;
    startJob(getMenuListKey, (isActive) async {
      final res = await _getMotherPregEvalGraphMenu();
      if(res is Success<List<MotherChartMenuData>>) {
        final data = res.data;
        _menuList.value = data;
      }
    });
  }
}