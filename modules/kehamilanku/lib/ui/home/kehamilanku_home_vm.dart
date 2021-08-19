import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:core/util/val_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:kehamilanku/core/domain/usecase/home_usecase.dart';

class KehamilankuHomeVm extends AsyncAuthVm {
  static const getAgeOverviewKey = "getAgeOverview";
  static const getTrimesterListKey = "getTrimesterList";
  static const getFoodRecomListKey = "getFoodRecomList";
  static const getBabyOverlayKey = "getBabyOverlay";

  KehamilankuHomeVm({
    BuildContext? context,
    //required GetMotherNik getMotherNik,
    required GetPregnancyAgeOverview getPregnancyAgeOverview,
    required GetTrimesterList getTrimesterList,
    required GetMotherFoodRecomList  getMotherFoodRecomList,
    required GetBornBabyList getBornBabyList,
    required GetUnbornBabyList getUnbornBabyList,
    required IsBabyBorn isBabyBorn,
  }):
      //_getMotherNik = getMotherNik,
      _getPregnancyAgeOverview = getPregnancyAgeOverview,
      _getTrimesterList = getTrimesterList,
      _getMotherFoodRecomList = getMotherFoodRecomList,
      _getBornBabyList = getBornBabyList,
      _getUnbornBabyList = getUnbornBabyList,
     _isBabyBorn = isBabyBorn, super(context: context)
  {
    _unbornBabyList.observe(this, (babyList) async {
      prind("PregnHomeVm.init() _unbornBabyList.observe() babyList= $babyList");
      if(babyList?.isNotEmpty == true) {
        if(_selectedProfile.value == null) {
          final cred = ProfileCredential.fromBabyOverlay(babyList!.first);
          init(profile: cred);
        } else {
          final profile = _selectedProfile.value!;
          final babyIndex = babyList!.indexWhere((e) => e.id == profile.id);
          prind("PregHomeVm _selectedProfile.observe babyIndex= $babyIndex");
          if(babyIndex >= 0) {
            _selectedUnbornBabyOverlay.value = _unbornBabyList.value![babyIndex];
          } else {
            _selectedUnbornBabyOverlay.value = null;
          }
        }
      }
    }, tag: toString());
    _ageOverview.observe(this, (overview) {
      if(overview != null) {
        final babyCred = _selectedProfile.value;
        if(babyCred == null) {
          throw "Something error. `babyCred` is null";
        }
        final unbornIndex = _unbornBabyList.value!.indexWhere((e) {
          prind("_unbornBabyList.value!.indexWhere() e= $e babyCred= $babyCred");
          return e.id == babyCred.id;
        });
        prind("BabyHomeVm unbornIndex= $unbornIndex");
        if(unbornIndex >= 0) {
          selectedIndex.value = unbornIndex;
        } else {
          throw "Something error. `ageOverview.value` is not null, but there's no selected baby";
        }
        prind("BabyHomeVm selectedIndex= $selectedIndex");
      }
    });
    _selectedProfile.observe(this, (profile) async {
      prind("PregHomeVm _selectedProfile.observe profile?.id= ${profile?.id}");
      if(profile != null) {
        final profile = _selectedProfile.value!;
        final babyIndex = _unbornBabyList.value?.indexWhere((e) => e.id == profile.id);
        prind("PregHomeVm _selectedProfile.observe babyIndex= $babyIndex");
        if(babyIndex != null && babyIndex >= 0) {
          _selectedUnbornBabyOverlay.value = _unbornBabyList.value![babyIndex];
        } else {
          _selectedUnbornBabyOverlay.value = null;
        }

        final isBornRes = await _isBabyBorn(profile.id);
        if(isBornRes is Success<bool>) {
          _isBorn.value = isBornRes.data;
        } else {
          _isBorn.value = null;
        }
      }
    }, tag: toString());
  }

  //final GetMotherNik _getMotherNik;
  final GetPregnancyAgeOverview _getPregnancyAgeOverview;
  final GetTrimesterList _getTrimesterList;
  final GetMotherFoodRecomList _getMotherFoodRecomList;
  final GetBornBabyList _getBornBabyList;
  final GetUnbornBabyList _getUnbornBabyList;
  final IsBabyBorn _isBabyBorn;

  final MutableLiveData<MotherPregnancyAgeOverview> _ageOverview = MutableLiveData();
  final MutableLiveData<List<MotherTrimester>> _trimesterList = MutableLiveData();
  final MutableLiveData<List<MotherFoodRecom>> _foodRecomList = MutableLiveData();
  final MutableLiveData<List<BabyOverlayData>> _bornBabyList = MutableLiveData();
  final MutableLiveData<List<BabyOverlayData>> _unbornBabyList = MutableLiveData();
  final MutableLiveData<BabyOverlayData> _selectedUnbornBabyOverlay = MutableLiveData();
  final MutableLiveData<ProfileCredential> _selectedProfile = MutableLiveData();
  final MutableLiveData<bool> _isBorn = MutableLiveData();

  LiveData<MotherPregnancyAgeOverview> get ageOverview => _ageOverview;
  LiveData<List<MotherTrimester>> get trimesterList => _trimesterList;
  LiveData<List<MotherFoodRecom>> get foodRecomList => _foodRecomList;
  LiveData<List<BabyOverlayData>> get bornBabyList => _bornBabyList;
  LiveData<List<BabyOverlayData>> get unbornBabyList => _unbornBabyList;
  LiveData<BabyOverlayData> get selectedUnbornBabyOverlay => _selectedUnbornBabyOverlay;
  LiveData<ProfileCredential> get selectedProfile => _selectedProfile;
  LiveData<bool> get isBorn => _isBorn;

  @override
  List<LiveData> get liveDatas => [
    _ageOverview, _trimesterList, _foodRecomList,
    _selectedProfile, _isBorn, _selectedUnbornBabyOverlay,
  ];

  final MutableLiveData<int> selectedIndex = MutableLiveData();
  //BabyOverlayData? _currentProfile;

  void init({
    required ProfileCredential profile,
    bool forceLoad = false,
  }) {
    prind("PregnHomeVm.init() profile= $profile forceLoad= $forceLoad _selectedProfile= $_selectedProfile");
    if(!forceLoad && profile == _selectedProfile.value) return;
    _selectedProfile.value = profile;
    _ageOverview.value = null;
    _trimesterList.value = null;
    _foodRecomList.value = null;
    getAgeOverview(forceLoad: true,);
    getTrimesterList(forceLoad: true,);
    _ageOverview.observeOnce((data) {
      if(data != null) { //This way, pregnancy week is initialized first.
        getFoodRecomList(forceLoad: true);
      }
    }, immediatelyGet: false);
  }

  @protected
  void getAgeOverview({bool forceLoad = false}) {
    prind("getAgeOverview() _selectedProfile= $_selectedProfile forceLoad = $forceLoad _ageOverview.value = ${_ageOverview.value}");
    if(!forceLoad && _ageOverview.value != null) return;
    prind("getAgeOverview() LANJUT =====");
    startJob(getAgeOverviewKey, (isActive) async {
      prind("getAgeOverview() startJob");
      _getPregnancyAgeOverview(_selectedProfile.value!.id).then((value){
        prind("getAgeOverview() startJob then value = $value");
        if(value is Success<MotherPregnancyAgeOverview>) {
          final data = value.data;
          _ageOverview.value = data;
        }
      });
    });
  }
  @protected
  void getTrimesterList({bool forceLoad = false}) {
    prind("getTrimesterList() forceLoad = $forceLoad _trimesterList.value = ${_trimesterList.value}");
    if(!forceLoad && _trimesterList.value != null) return;
    startJob(getTrimesterListKey, (isActive) async {
      prind("getTrimesterList() start");
      final res = await _getTrimesterList(_selectedProfile.value!.id);
      prind("getTrimesterList() start then res= $res");
      if(res is Success<List<MotherTrimester>>) {
        final data = res.data;
        _trimesterList.value = data;
      }
    });
  }
  @protected
  void getFoodRecomList({bool forceLoad = false}) {
    prind("getFoodRecomList() forceLoad = $forceLoad _foodRecomList.value = ${_foodRecomList.value}");
    if(!forceLoad && _foodRecomList.value != null) return;
    startJob(getFoodRecomListKey, (isActive) async {
      final week = VarDi.pregnancyWeek.getOrElse();
      //final motherNik = VarDi.motherNik.getOrElse();
      final res = await _getMotherFoodRecomList(_selectedProfile.value!.id, week);
      if(res is Success<List<MotherFoodRecom>>) {
        final data = res.data;
        _foodRecomList.value = data;
      }
    });
  }
  //@protected
  void getBabyOverlay({ bool forceLoad = false }) {
    prind("`getBabyOverlay` MULAI forceLoad= $forceLoad");
    if(!forceLoad
        && _bornBabyList.value != null
        && _unbornBabyList.value != null) return;
    prind("`getBabyOverlay` LANJUT forceLoad= $forceLoad");
    startJob(getBabyOverlayKey, (isActive) async {
      final motherNik = VarDi.motherNik.getOrElse();
      prind("`getBabyOverlay` startJob motherNik= $motherNik");
      final res1 = await _getBornBabyList(motherNik);
      prind("`getBabyOverlay` startJob res1= $res1");
      final res2 = await _getUnbornBabyList(motherNik);
      prind("`getBabyOverlay` startJob res2= $res2");

      if(res1 is Success<List<BabyOverlayData>>
        && res2 is Success<List<BabyOverlayData>>) {
        final born = res1.data;
        final unborn = res2.data;
        prind("`getBabyOverlay` startJob born= $born unborn= $unborn");

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