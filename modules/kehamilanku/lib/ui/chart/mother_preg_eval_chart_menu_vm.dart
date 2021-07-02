import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:kehamilanku/core/domain/usecase/mother_graph_menu_usecase.dart';

class MotherPregEvalChartMenuVm extends AsyncVm {
  static const getMenuListKey = "getMenuList";

  MotherPregEvalChartMenuVm({
    required GetMotherPregEvalGraphMenu getMotherPregEvalGraphMenu,
  }):
    _getMotherPregEvalGraphMenu = getMotherPregEvalGraphMenu
  ;
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