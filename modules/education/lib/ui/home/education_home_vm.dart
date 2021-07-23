import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:education/core/domain/usecase/education_home_usecase.dart';
import 'package:flutter/material.dart';

class EducationHomeVm extends AsyncAuthVm {
  static const getMainPanelKey = "getMainPanel";
  static const getTipsListKey = "getTipsList";

  EducationHomeVm({
    BuildContext? context,
    required GetEducationMainPanelData getEducationMainPanelData,
    required GetEducationHomeTipsData getEducationHomeTipsData,
    required GetMotherNik getMotherNik,
  }):
    _getEducationMainPanelData = getEducationMainPanelData,
    _getEducationHomeTipsData = getEducationHomeTipsData,
    _getMotherNik = getMotherNik, super(context: context)
  ;
  final GetMotherNik _getMotherNik;
  final GetEducationMainPanelData _getEducationMainPanelData;
  final GetEducationHomeTipsData _getEducationHomeTipsData;

  final MutableLiveData<List<Tips>> _mainPanelList = MutableLiveData();
  final MutableLiveData<List<Tips>> _tipsList = MutableLiveData();

  LiveData<List<Tips>> get mainPanelList => _mainPanelList;
  LiveData<List<Tips>> get tipsList => _tipsList;

  @override
  List<LiveData> get liveDatas => [_mainPanelList, _tipsList];

  void getMainPanel({ bool forceLoad = false }) {
    if(!forceLoad && _mainPanelList.value != null) return;
    startJob(getMainPanelKey, (isActive) async {
      final res1 = await _getMotherNik();
      if(res1 is Success<String>) {
        final motherNik = res1.data;
        final res2 = await _getEducationMainPanelData(motherNik);
        if(res2 is Success<List<Tips>>) {
          final data = res2.data;
          _mainPanelList.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
  void getTipsList({ bool forceLoad = false }) {
    if(!forceLoad && _tipsList.value != null) return;
    startJob(getTipsListKey, (isActive) async {
      final res1 = await _getMotherNik();
      if(res1 is Success<String>) {
        final motherNik = res1.data;
        final res2 = await _getEducationHomeTipsData(motherNik);
        if(res2 is Success<List<Tips>>) {
          final data = res2.data;
          _tipsList.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
}