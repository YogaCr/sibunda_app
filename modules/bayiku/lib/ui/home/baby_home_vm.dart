import 'package:bayiku/core/domain/usecase/baby_home_usecase.dart';
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';

class BabyHomeVm extends AsyncVm {
  static const getBabyAgeOverviewKey = "getBabyAgeOverview";
  static const getBabyFormMenuListKey = "getBabyFormMenuList";
  static const getBabyOverlayKey = "getBabyOverlay";
  BabyHomeVm({
    required GetBabyAgeOverview getBabyAgeOverview,
    required GetBabyFormMenuList getBabyFormMenuList,
    required GetBornBabyList getBornBabyList,
    required GetUnbornBabyList getUnbornBabyList,
  }):
      _getBabyAgeOverview = getBabyAgeOverview,
      _getBabyFormMenuList = getBabyFormMenuList,
      _getBornBabyList = getBornBabyList,
      _getUnbornBabyList = getUnbornBabyList
  ;
  final GetBabyAgeOverview _getBabyAgeOverview;
  final GetBabyFormMenuList _getBabyFormMenuList;
  final GetBornBabyList _getBornBabyList;
  final GetUnbornBabyList _getUnbornBabyList;

  final MutableLiveData<List<BabyFormMenuData>> _formMenuList = MutableLiveData();
  final MutableLiveData<BabyAgeOverview> _ageOverview = MutableLiveData();
  final MutableLiveData<List<BabyOverlayData>> _bornBabyList = MutableLiveData();
  final MutableLiveData<List<BabyOverlayData>> _unbornBabyList = MutableLiveData();

  LiveData<List<BabyFormMenuData>> get formMenuList => _formMenuList;
  LiveData<BabyAgeOverview> get ageOverview => _ageOverview;
  LiveData<List<BabyOverlayData>> get bornBabyList => _bornBabyList;
  LiveData<List<BabyOverlayData>> get unbornBabyList => _unbornBabyList;

  String get babyNik => dummyProfileChild.nik; //TODO: babyNik: tuk smtr ini kyk gini.

  @override
  List<LiveData> get liveDatas => [_formMenuList, _ageOverview];

  void getBabyAgeOverview({
    //required String babyNik,
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

  void getBabyOverlay([bool forceLoad = false]) {
    if(!forceLoad
        && _bornBabyList.value != null
        && _unbornBabyList.value != null) return;
    startJob(getBabyOverlayKey, (isActive) async {
      final motherNik = VarDi.motherNik.getOrElse();
      final res1 = await _getBornBabyList(motherNik);
      final res2 = await _getUnbornBabyList(motherNik);

      if(res1 is Success<List<BabyOverlayData>>
          && res2 is Success<List<BabyOverlayData>>) {
        final born = res1.data;
        final unborn = res2.data;

        _bornBabyList.value = born;
        _unbornBabyList.value = unborn;
        return null;
      }
      if(res1 is Fail<List<BabyOverlayData>>) {
        return res1;
      }
      if(res2 is Fail<List<BabyOverlayData>>) {
        return res2;
      }
    });
  }
}