import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:home/core/domain/usecase/home_page_use_case.dart';

class HomeVm extends AsyncAuthVm {
  static const getProfileKey = "getProfile";
  static const getStatusListKey = "getStatusList";
  static const getMenuListKey = "getMenuList";
  static const getTipsListKey = "getTipsList";

  HomeVm({
    BuildContext? context,
    required GetHomeStatusList getHomeStatusList,
    required GetHomeMenuList getHomeMenuList,
    required GetHomeTipsList getHomeTipsList,
    required GetMotherNik getMotherNik,
    required GetProfile getProfile,
    required GetCurrentEmail getCurrentEmail,
  }):
    _getHomeMenuList = getHomeMenuList,
    _getHomeStatusList = getHomeStatusList,
    _getHomeTipsList = getHomeTipsList,
    _getMotherNik = getMotherNik,
    _getProfile = getProfile,
    _getCurrentEmail = getCurrentEmail, super(context: context)
  ;
  final GetMotherNik _getMotherNik;
  final GetProfile _getProfile;
  final GetCurrentEmail _getCurrentEmail;
  final GetHomeStatusList _getHomeStatusList;
  final GetHomeMenuList _getHomeMenuList;
  final GetHomeTipsList _getHomeTipsList;

  final MutableLiveData<List<HomeStatus>> _homeStatusList = MutableLiveData();
  final MutableLiveData<List<HomeMenu>> _homeMenuList = MutableLiveData();
  final MutableLiveData<List<Tips>> _homeTipsList = MutableLiveData();
  final MutableLiveData<Profile> _profile = MutableLiveData();

  LiveData<List<HomeStatus>> get homeStatusList => _homeStatusList;
  LiveData<List<HomeMenu>> get homeMenuList => _homeMenuList;
  LiveData<List<Tips>> get homeTipsList => _homeTipsList;
  LiveData<Profile> get profile => _profile;

  @override
  List<LiveData> get liveDatas => [
    _homeStatusList, _homeMenuList, _homeTipsList, _profile
  ];

  void getProfile([bool forceLoad = false]) {
    if(!forceLoad && _profile.value != null) return;
    startJob(getProfileKey, (isActive) async {
      final res1 = await _getCurrentEmail();
      prind("getProfile() res1 = $res1");
      if(res1 is Success<String>) {
        final email = res1.data;
        final res2 = await _getProfile(email);
        prind("getProfile() res2 = $res2");
        if(res2 is Success<Profile>) {
          final data = res2.data;
          _profile.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
  void getStatusList([bool forceLoad = false]) {
    if(!forceLoad && _homeStatusList.value != null) return;
    startJob(getStatusListKey, (isActive) async {
      final res1 = await _getMotherNik();
      if(res1 is Success<String>) {
        final motherNik = res1.data;
        final res2 = await _getHomeStatusList(motherNik);
        if(res2 is Success<List<HomeStatus>>) {
          final data = res2.data;
          _homeStatusList.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
  void getMenuList([bool forceLoad = false]) {
    if(!forceLoad && _homeMenuList.value != null) return;
    startJob(getMenuListKey, (isActive) async {
      final res = await _getHomeMenuList();
      if(res is Success<List<HomeMenu>>) {
        final data = res.data;
        _homeMenuList.value = data;
        return null;
      }
      return res as Fail;
    });
  }
  void getTipsList([bool forceLoad = false]) {
    if(!forceLoad && _homeTipsList.value != null) return;
    startJob(getTipsListKey, (isActive) async {
      final res1 = await _getMotherNik();
      if(res1 is Success<String>) {
        final motherNik = res1.data;
        final res2 = await _getHomeTipsList(motherNik);
        if(res2 is Success<List<Tips>>) {
          final data = res2.data;
          _homeTipsList.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
}