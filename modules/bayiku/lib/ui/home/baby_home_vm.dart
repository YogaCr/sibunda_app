import 'package:bayiku/core/domain/usecase/baby_home_usecase.dart';
import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

class BabyHomeVm extends AsyncAuthVm {
  static const getBabyAgeOverviewKey = "getBabyAgeOverview";
  static const getBabyFormMenuListKey = "getBabyFormMenuList";
  static const getBabyOverlayKey = "getBabyOverlay";
  BabyHomeVm({
    BuildContext? context,
    required GetBabyAgeOverview getBabyAgeOverview,
    required GetBabyFormMenuList getBabyFormMenuList,
    required GetBornBabyList getBornBabyList,
    required GetUnbornBabyList getUnbornBabyList,
  }):
      _getBabyAgeOverview = getBabyAgeOverview,
      _getBabyFormMenuList = getBabyFormMenuList,
      _getBornBabyList = getBornBabyList,
      _getUnbornBabyList = getUnbornBabyList, super(context: context) {
    _bornBabyList.observe(this, (list) {
      if(list?.isNotEmpty == true) {
        if(_babyCredential.value == null) {
          final firstBaby = list!.first;
          final cred = ProfileCredential(id: firstBaby.id, nik: firstBaby.nik);
          initHome(babyCredential: cred);
        }
      }
    });
    _ageOverview.observe(this, (data) {
      prind("BabyHomeVm _ageOverview.observe data= $data");
      if(data != null) {
        final babyCred = _babyCredential.value;
        prind("BabyHomeVm _ageOverview.observe babyCred= $babyCred _bornBabyList= $_bornBabyList");
        if(babyCred == null) {
          throw "Something error. `babyCred` is null";
        }
        final bornIndex = _bornBabyList.value!.indexWhere((e) => e.id == babyCred.id);
        prind("BabyHomeVm bornIndex= $bornIndex");
        if(bornIndex < 0) {
          throw "Something error. `ageOverview.value` is not null, but there's no selected baby";
        }
        selectedBabyData = _bornBabyList.value![bornIndex];
        selectedIndex.value = bornIndex +(_unbornBabyList.value?.length ?? 0);

        prind("BabyHomeVm selectedIndex= $selectedIndex");
      }
    }, tag: toString());
  }
  final GetBabyAgeOverview _getBabyAgeOverview;
  final GetBabyFormMenuList _getBabyFormMenuList;
  final GetBornBabyList _getBornBabyList;
  final GetUnbornBabyList _getUnbornBabyList;

  final MutableLiveData<List<BabyFormMenuData>> _formMenuList = MutableLiveData();
  final MutableLiveData<BabyAgeOverview> _ageOverview = MutableLiveData();
  final MutableLiveData<List<BabyOverlayData>> _bornBabyList = MutableLiveData();
  final MutableLiveData<List<BabyOverlayData>> _unbornBabyList = MutableLiveData();
  final MutableLiveData<ProfileCredential> _babyCredential = MutableLiveData();

  LiveData<List<BabyFormMenuData>> get formMenuList => _formMenuList;
  LiveData<BabyAgeOverview> get ageOverview => _ageOverview;
  LiveData<List<BabyOverlayData>> get bornBabyList => _bornBabyList;
  LiveData<List<BabyOverlayData>> get unbornBabyList => _unbornBabyList;
  LiveData<ProfileCredential> get babyCredential => _babyCredential;

  final MutableLiveData<int> selectedIndex = MutableLiveData();
  BabyOverlayData? selectedBabyData;

  @override
  List<LiveData> get liveDatas => [
    _formMenuList, _ageOverview,
    _bornBabyList, _unbornBabyList,
    _babyCredential, selectedIndex,
  ];

  void initHome({
    required ProfileCredential babyCredential,
    bool forceLoad = false,
  }) {
    //prind("BabyHomeVm.initHome() forceLoad= $forceLoad babyCredential= $babyCredential _babyCredential= $_babyCredential");
    if(!forceLoad && babyCredential == _babyCredential.value) return;
    _babyCredential.value = babyCredential;
    _ageOverview.value = null;
    _formMenuList.value = null;
    getBabyAgeOverview(forceLoad: true);
    getBabyFormMenuList(forceLoad: true);
  }

  @protected
  void getBabyAgeOverview({
    bool forceLoad = false
  }) {
    if(!forceLoad && _ageOverview.value != null) return;
    startJob(getBabyAgeOverviewKey, (isActive) async {
      _getBabyAgeOverview(_babyCredential.value!.nik).then((value) {
        if(value is Success<BabyAgeOverview>) {
          final data = value.data;
          _ageOverview.value = data;
        }
      });
    });
  }

  @protected
  void getBabyFormMenuList({
    bool forceLoad = false
  }) {
    if(!forceLoad && _formMenuList.value != null) return;
    startJob(getBabyFormMenuListKey, (isActive) async {
      _getBabyFormMenuList(_babyCredential.value!.id).then((value) {
        if(value is Success<List<BabyFormMenuData>>) {
          final data = value.data;
          _formMenuList.value = data;
        }
      });
    });
  }

  void getBabyOverlay({
    bool forceLoad = false
  }) {
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