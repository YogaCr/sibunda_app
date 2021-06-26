import 'package:bayiku/core/domain/usecase/baby_home_usecase.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';

class BabyHomeVm extends AsyncVm {
  static const getBabyAgeOverviewKey = "getBabyAgeOverview";
  static const getBabyFormMenuListKey = "getBabyFormMenuList";
  BabyHomeVm({
    required GetBabyAgeOverview getBabyAgeOverview,
    required GetBabyFormMenuList getBabyFormMenuList,
  }):
      _getBabyAgeOverview = getBabyAgeOverview,
      _getBabyFormMenuList = getBabyFormMenuList
  ;
  final GetBabyAgeOverview _getBabyAgeOverview;
  final GetBabyFormMenuList _getBabyFormMenuList;

  final MutableLiveData<List<BabyFormMenuData>> _formMenuList = MutableLiveData();
  final MutableLiveData<BabyAgeOverview> _ageOverview = MutableLiveData();

  LiveData<List<BabyFormMenuData>> get formMenuList => _formMenuList;
  LiveData<BabyAgeOverview> get ageOverview => _ageOverview;

  @override
  List<LiveData> get liveDatas => [_formMenuList, _ageOverview];

  void getBabyAgeOverview({
    required String babyNik,
    bool forceLoad = false
  }) {
    if(!forceLoad && _ageOverview.value != null) return;
    startJob(getBabyAgeOverviewKey, (isActive) async {
      _getBabyAgeOverview(babyNik).then((value) {
        if(value is Success<BabyAgeOverview>) {
          final data = value.data;
          _ageOverview.value = data;
        }
      });
    });
  }

  void getBabyFormMenuList({
    bool forceLoad = false
  }) {
    if(!forceLoad && _formMenuList.value != null) return;
    startJob(getBabyFormMenuListKey, (isActive) async {
      _getBabyFormMenuList().then((value) {
        if(value is Success<List<BabyFormMenuData>>) {
          final data = value.data;
          _formMenuList.value = data;
        }
      });
    });
  }
}