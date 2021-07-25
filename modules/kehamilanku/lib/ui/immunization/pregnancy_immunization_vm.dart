import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/core/domain/usecase/mother_immunization_use_case.dart';
import 'package:tuple/tuple.dart';

class PregnancyImmunizationVm extends AsyncAuthVm {
  static const getImmunizationGroupsKey = "getImmunizationGroups";
  static const getImmunizationOverviewKey = "getImmunizationOverview";

  PregnancyImmunizationVm({
    BuildContext? context,
    required this.pregnancyId,
    required GetMotherImmunizationGroupList getMotherImmunizationGroupList,
    required GetMotherImmunizationOverview getMotherImmunizationOverview,
  }):
    _getMotherImmunizationGroupList = getMotherImmunizationGroupList,
    _getMotherImmunizationOverview = getMotherImmunizationOverview, super(context: context)
  ;
  final ProfileCredential pregnancyId;

  final GetMotherImmunizationGroupList _getMotherImmunizationGroupList;
  final GetMotherImmunizationOverview _getMotherImmunizationOverview;

  final MutableLiveData<List<UiImmunizationListGroup>> _immunizationGroups = MutableLiveData();
  final MutableLiveData<ImmunizationOverview> _overview = MutableLiveData();
  //final MutableLiveData<Tuple2<Expirable, bool>> _onConfirm = MutableLiveData();

  LiveData<List<UiImmunizationListGroup>> get immunizationGroups => _immunizationGroups;
  LiveData<ImmunizationOverview> get overview => _overview;
  //LiveData<Tuple2<Expirable, bool>> get onConfirm => _onConfirm;

  @override
  List<LiveData> get liveDatas => [_immunizationGroups, _overview];

  void getImmunizationGroups({
    required String motherNik,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _immunizationGroups.value != null) return;
    startJob(getImmunizationGroupsKey, (isActive) async {
      _getMotherImmunizationGroupList(motherNik).then((value) {
        if(value is Success<List<ImmunizationDetailGroup>>) {
          final data = value.data.map((e) => UiImmunizationListGroup.fromDomainModel(e)).toList(growable: false);
          _immunizationGroups.value = data;
        }
      });
    });
  }
  void getImmunizationOverview({
    bool forceLoad = false,
  }) {
    if(!forceLoad && _overview.value != null) return;
    startJob(getImmunizationOverviewKey, (isActive) async {
      _getMotherImmunizationOverview().then((value) {
        if(value is Success<ImmunizationOverview>) {
          final data = value.data;
          _overview.value = data;
        }
      });
    });
  }

  void onConfirmSuccess({
    required int group,
    required int child,
    required String date,
  }) {
    final oldUiData = _immunizationGroups.value![group].immunizationList[child];
    final oldImmData = oldUiData.core;

    if(oldImmData.date != null) {
      prine("ImmunizationData at group '$group', child '$child' has already been confirmed.");
      return;
    }

    _immunizationGroups.value![group].immunizationList[child] = oldUiData.copy(
      core: oldImmData.copy(date: date),
    );
    _immunizationGroups.notifyObservers();
  }
}