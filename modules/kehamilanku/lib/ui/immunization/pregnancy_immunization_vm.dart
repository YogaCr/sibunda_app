import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:kehamilanku/core/domain/usecase/mother_immunization_use_case.dart';
import 'package:tuple/tuple.dart';

class PregnancyImmunizationVm extends AsyncVm {
  static const getImmunizationGroupsKey = "getImmunizationGroups";
  static const getImmunizationOverviewKey = "getImmunizationOverview";

  PregnancyImmunizationVm({
    required GetMotherImmunizationGroupList getMotherImmunizationGroupList,
    required GetMotherImmunizationOverview getMotherImmunizationOverview,
  }):
    _getMotherImmunizationGroupList = getMotherImmunizationGroupList,
    _getMotherImmunizationOverview = getMotherImmunizationOverview
  ;

  final GetMotherImmunizationGroupList _getMotherImmunizationGroupList;
  final GetMotherImmunizationOverview _getMotherImmunizationOverview;

  final MutableLiveData<List<UiImmunizationListGroup>> _immunizationGroups = MutableLiveData();
  final MutableLiveData<ImmunizationOverview> _overview = MutableLiveData();
  final MutableLiveData<Tuple2<Expirable, bool>> _onConfirm = MutableLiveData();

  LiveData<List<UiImmunizationListGroup>> get immunizationGroups => _immunizationGroups;
  LiveData<ImmunizationOverview> get overview => _overview;
  LiveData<Tuple2<Expirable, bool>> get onConfirm => _onConfirm;

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
}